import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:plex_api/plex_api.dart';

class PlexAuthRepository extends AuthenticationRepository {
  final DeviceInfo _info;
  PlexAuthRepository(this._info);
  Future<User> getUser(String token) async {
    // _plexApi.getUs
    return User();
  }

  Future<bool> logout() async {
    return true;
  }
}
