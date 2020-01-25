import 'package:audiobookly/core/services/authentication_service.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';


class LoginModel extends BaseModel {
  AuthenticationService _authenticationService;
  
  LoginModel({@required AuthenticationService authenticationService}) : _authenticationService = authenticationService;

  List<PlexArtist> collections;

  Future<bool> login(String username, String password) async {
    setBusy(true);
    var success = await _authenticationService.login(username, password);
    setBusy(false);
    return success;
  }

  Future<bool> checkAuth() {
    
  }

}