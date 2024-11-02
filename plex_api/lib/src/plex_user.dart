class PlexUser {
  int? id;
  String? uuid;
  String? email;
  String? joinedAt;
  String? username;
  String? title;
  String? thumb;
  bool? hasPassword;
  String? authToken;
  String? authenticationToken;
  Subscription? subscription;
  Roles? roles;
  List<String>? entitlements;
  String? confirmedAt;
  String? forumId;
  bool? rememberMe;

  PlexUser(
      {this.id,
      this.uuid,
      this.email,
      this.joinedAt,
      this.username,
      this.title,
      this.thumb,
      this.hasPassword,
      this.authToken,
      this.authenticationToken,
      this.subscription,
      this.roles,
      this.entitlements,
      this.confirmedAt,
      this.forumId,
      this.rememberMe});

  PlexUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    email = json['email'];
    joinedAt = json['joined_at'];
    username = json['username'];
    title = json['title'];
    thumb = json['thumb'];
    hasPassword = json['hasPassword'];
    authToken = json['authToken'];
    authenticationToken = json['authentication_token'];
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
    roles = json['roles'] != null ? Roles.fromJson(json['roles']) : null;
    entitlements = json['entitlements'].cast<String>();
    confirmedAt = json['confirmedAt'];
    forumId = json['forumId'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['email'] = email;
    data['joined_at'] = joinedAt;
    data['username'] = username;
    data['title'] = title;
    data['thumb'] = thumb;
    data['hasPassword'] = hasPassword;
    data['authToken'] = authToken;
    data['authentication_token'] = authenticationToken;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    data['entitlements'] = entitlements;
    data['confirmedAt'] = confirmedAt;
    data['forumId'] = forumId;
    data['rememberMe'] = rememberMe;
    return data;
  }
}

class Subscription {
  bool? active;
  String? status;
  String? plan;
  List<String>? features;

  Subscription({this.active, this.status, this.plan, this.features});

  Subscription.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    status = json['status'];
    plan = json['plan'];
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['status'] = status;
    data['plan'] = plan;
    data['features'] = features;
    return data;
  }
}

class Roles {
  List<String>? roles;

  Roles({this.roles});

  Roles.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roles'] = roles;
    return data;
  }
}
