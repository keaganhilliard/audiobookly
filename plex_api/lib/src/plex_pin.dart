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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['clientIdentifier'] = this.clientIdentifier;
    data['expiresIn'] = this.expiresIn;
    data['createdAt'] = this.createdAt;
    data['expiresAt'] = this.expiresAt;
    data['authToken'] = this.authToken;
    return data;
  }
}
