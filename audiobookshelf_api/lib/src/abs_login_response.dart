import 'abs_user.dart';

class AbsLoginResponse {
  AbsUser user;

  AbsLoginResponse({required this.user});

  factory AbsLoginResponse.fromJson(Map<String, dynamic> json) =>
      AbsLoginResponse(
          user: AbsUser.fromJson(
        json['user'],
      ));

  Map<String, dynamic> toJson() => {'user': user.toJson()};
}
