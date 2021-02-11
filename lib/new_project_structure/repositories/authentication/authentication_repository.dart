import 'package:audiobookly/core/models/user.dart';

abstract class AuthenticationRepository {
  Future<User> getUser(String token);
  Future logout();
}
