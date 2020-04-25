import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:plex_api/plex_api.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/screens/server_select.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:device_info/device_info.dart';
import 'dart:io';
import 'dart:async';

class RootViewModel extends BaseModel {
  PlexApi api;
  SharedPreferences _prefs;
  // PlexServerV2 server;
  // PlexLibrary library;
  ServerCommunicator communicator;

  RootViewModel();

  Future init() async {
    setBusy(true);
    _prefs = await SharedPreferences.getInstance();
    String authToken = _prefs.getString(SharedPrefStrings.PLEX_TOKEN);
    String serverId = _prefs.getString(SharedPrefStrings.PLEX_SERVER);
    String libraryKey = _prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PlexHeaders headers;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      headers = PlexHeaders(
        clientIdentifier: androidDeviceInfo.androidId,
        device: androidDeviceInfo.model,
        product: 'Audiobookly',
        platform: 'Android',
        platformVersion: androidDeviceInfo.version.release,
      );
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      headers = PlexHeaders(
        clientIdentifier: iosInfo.identifierForVendor,
        device: iosInfo.model,
        product: 'Audiobookly',
        platform: 'iOS',
        platformVersion: iosInfo.systemVersion,
        token: authToken,
      );
    }

    if (authToken == null && headers != null) {
      api = PlexApi(headers: headers);
      PlexPin pin = await api.getPin();
      String oAuthUrl = api.getOauthUrl(pin.code);
      if (await urlLauncher.canLaunch(oAuthUrl)) {
        urlLauncher.launch(oAuthUrl);
        // NavigationService().push(MaterialPageRoute(builder: (context) {
        //   return LoginView(
        //     url: oAuthUrl,
        //   );
        // }));
        int count = 0;
        Timer.periodic(Duration(seconds: 5), (timer) async {
          count++;
          PlexPin authToken = await api.getAuthToken(pin.id);
          if (authToken.authToken != null) {
            _prefs.setString(SharedPrefStrings.PLEX_TOKEN, authToken.authToken);
            urlLauncher.closeWebView();
            timer.cancel();
            init();
          }
          print('In Timer: ${authToken.error}');
          if (count > 20) timer.cancel();
        });
      }
    } else if (headers != null) {
      headers.token = authToken;
      print('AuthToken: $authToken');
      api = PlexApi(headers: headers);
      if (serverId == null) {
        NavigationService().push(MaterialPageRoute(
          builder: (context) =>
              ServerSelect(model: ServerListViewModel(api: api)),
        ));
        int count = 0;
        Timer.periodic(Duration(seconds: 5), (timer) async {
          count++;
          libraryKey = _prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
          print('checking library :$libraryKey');
          if (libraryKey != null) {
            timer.cancel();
            init();
          }
          if (count > 20) timer.cancel();
        });
      } else if (libraryKey == null) {
        List<PlexServerV2> servers = await api.getServersV2();
        PlexServerV2 server = servers.firstWhere(
            (server) => server.clientIdentifier == serverId,
            orElse: () => null);
        NavigationService().push(MaterialPageRoute(
          builder: (context) =>
              LibrarySelect(model: LibraryListViewModel(server: server)),
        ));
      } else {
        // List<PlexServerV2> servers = await api.getServersV2();
        // PlexServerV2 server = servers.firstWhere(
        //     (server) => server.clientIdentifier == serverId,
        //     orElse: () => null);
        // List<PlexLibrary> libraries = await server.getLibraries();
        // PlexLibrary library = libraries.firstWhere(
        //     (library) => library.key == libraryKey,
        //     orElse: () => null);
        // this.server = server;
        // this.library = library;
        communicator = PlexServerCommunicator();
        await communicator.getServerAndLibrary();
        setBusy(false);
      }
    }
  }
}
