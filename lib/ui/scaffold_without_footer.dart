import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/utils/book_search_delegate.dart';
import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/screens/server_select.dart';
import 'package:audiobookly/screens/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class ScaffoldWithoutFooter extends StatelessWidget {
  final Widget title;
  final Widget body;

  ScaffoldWithoutFooter({this.title, this.body});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BookSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              PlexApi api;
              var _prefs = await SharedPreferences.getInstance();
              String authToken = _prefs.getString(SharedPrefStrings.PLEX_TOKEN);
              String serverId = _prefs.getString(SharedPrefStrings.PLEX_SERVER);
              String libraryKey =
                  _prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              PlexHeaders headers;

              if (Platform.isAndroid) {
                AndroidDeviceInfo androidDeviceInfo =
                    await deviceInfo.androidInfo;
                headers = PlexHeaders(
                  clientIdentifier: androidDeviceInfo.androidId,
                  device: androidDeviceInfo.model,
                  product: 'Audiobookly',
                  platform: 'Android',
                  platformVersion: androidDeviceInfo.version.release,
                );
              }

              if (authToken != null) {
                headers.token = authToken;
                api = PlexApi(headers: headers);
              }

              showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  builder: (context) {
                    return SettingsView();
                  });
            },
          )
        ],
      ),
      body: body,
    );
  }
}
