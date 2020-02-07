import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:plex_api/plex_api.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LibraryListViewModel extends BaseModel {
  PlexServerV2 _server;

  List<PlexLibrary> libraries = [];

  LibraryListViewModel({@required PlexServerV2 server}) : _server = server;

  PlexServerV2 get server => _server;

  Future<void> getLibraries() async {
    setBusy(true);
    libraries = await _server.getLibraries();
    setBusy(false);
  }

  Future<void> setLibrary(int position) async {
    PlexLibrary lib = libraries[position];
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    prefs.setString(SharedPrefStrings.PLEX_LIBRARY, lib.key);
  }
}
