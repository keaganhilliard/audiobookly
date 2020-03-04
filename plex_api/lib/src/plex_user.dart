class PlexUser {
  int id;
  String uuid;
  String email;
  String joinedAt;
  String username;
  String title;
  String thumb;
  bool hasPassword;
  String authToken;
  String authenticationToken;
  Subscription subscription;
  Roles roles;
  List<String> entitlements;
  String confirmedAt;
  String forumId;
  bool rememberMe;

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
        ? new Subscription.fromJson(json['subscription'])
        : null;
    roles = json['roles'] != null ? new Roles.fromJson(json['roles']) : null;
    entitlements = json['entitlements'].cast<String>();
    confirmedAt = json['confirmedAt'];
    forumId = json['forumId'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['email'] = this.email;
    data['joined_at'] = this.joinedAt;
    data['username'] = this.username;
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['hasPassword'] = this.hasPassword;
    data['authToken'] = this.authToken;
    data['authentication_token'] = this.authenticationToken;
    if (this.subscription != null) {
      data['subscription'] = this.subscription.toJson();
    }
    if (this.roles != null) {
      data['roles'] = this.roles.toJson();
    }
    data['entitlements'] = this.entitlements;
    data['confirmedAt'] = this.confirmedAt;
    data['forumId'] = this.forumId;
    data['rememberMe'] = this.rememberMe;
    return data;
  }
}

class Subscription {
  bool active;
  String status;
  String plan;
  List<String> features;

  Subscription({this.active, this.status, this.plan, this.features});

  Subscription.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    status = json['status'];
    plan = json['plan'];
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['status'] = this.status;
    data['plan'] = this.plan;
    data['features'] = this.features;
    return data;
  }
}

class Roles {
  List<String> roles;

  Roles({this.roles});

  Roles.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    return data;
  }
}
