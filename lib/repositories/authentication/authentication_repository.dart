import 'package:audiobookly/models/user.dart';

abstract class AuthenticationRepository {
  Future<User> getUser(String token);
  Future logout();
}
