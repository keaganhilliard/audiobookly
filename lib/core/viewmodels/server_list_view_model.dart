import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audiobookly/core/constants/app_constants.dart';

import 'package:plex_api/plex_api.dart';

class ServerListViewModel extends BaseModel {
  PlexApi _api;
  ServerListViewModel({@required PlexApi api}) : _api = api;

  List<PlexServerV2> servers = [];

  Future<void> getServers() async {
    setBusy(true);
    servers = await _api.getServersV2();
    setBusy(false);
    notifyListeners();
  }

  Future<void> selectServer(int serverIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        SharedPrefStrings.PLEX_SERVER, servers[serverIndex].clientIdentifier);
  }
}
