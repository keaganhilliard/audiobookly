class PlexPin {
  int? id;
  String? code;
  String? clientIdentifier;
  int? expiresIn;
  String? createdAt;
  String? expiresAt;
  String? authToken;
  String? error;

  PlexPin(
      {this.id,
      this.code,
      this.clientIdentifier,
      this.expiresIn,
      this.createdAt,
      this.expiresAt,
      this.authToken});

  PlexPin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    clientIdentifier = json['clientIdentifier'];
    expiresIn = json['expiresIn'];
    createdAt = json['createdAt'];
    expiresAt = json['expiresAt'];
    authToken = json['authToken'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['clientIdentifier'] = clientIdentifier;
    data['expiresIn'] = expiresIn;
    data['createdAt'] = createdAt;
    data['expiresAt'] = expiresAt;
    data['authToken'] = authToken;
    return data;
  }
}
