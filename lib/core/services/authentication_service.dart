import 'dart:async';

import 'package:plex_api/plex_api.dart';

class AuthenticationService {
  final PlexApi _api;

  AuthenticationService({PlexApi api}) : _api = api;

  StreamController<PlexUser> _userController = StreamController<PlexUser>();

  Stream<PlexUser> get user => _userController.stream;

  Future<bool> login(String username, String password) async {
    var fetchedUser = await _api.login(username, password);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }

  Future<bool> checkAuth(String authToken) async {
    var fetchedUser = await _api.authenticate(authToken);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }
}
