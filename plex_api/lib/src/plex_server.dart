import 'package:xml/xml.dart' show XmlElement;

class PlexServer {
  String? accessToken;
  String? name;
  String? address;
  String? port;
  String? version;
  String? scheme;
  String? host;
  List<String>? localAddresses;
  String? machineIdentifier;
  String? createdAt;
  String? updatedAt;
  String? owned;
  String? synced;

  PlexServer({this.accessToken,
      this.name,
      this.address,
      this.port,
      this.version,
      this.scheme,
      this.host,
      this.localAddresses,
      this.machineIdentifier,
      this.createdAt,
      this.updatedAt,
      this.owned,
      this.synced});

  PlexServer.fromXml(XmlElement el) {
      accessToken = el.getAttribute('accessToken');
      name = el.getAttribute('name');
      address = el.getAttribute('address');
      port = el.getAttribute('port');
      version = el.getAttribute('version');
      scheme = el.getAttribute('scheme');
      host = el.getAttribute('host');
      localAddresses = el.getAttribute('localAddresses')!.split(",");
      machineIdentifier = el.getAttribute('machineIdentifier');
      createdAt = el.getAttribute('createdAt');
      updatedAt = el.getAttribute('updatedAt');
      owned = el.getAttribute('owned');
      synced = el.getAttribute('synced');
  }

  PlexServer.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    name = json['name'];
    address = json['address'];
    port = json['port'];
    version = json['version'];
    scheme = json['scheme'];
    host = json['host'];
    localAddresses = (json['localAddresses'] as String).split(",");
    machineIdentifier = json['machineIdentifier'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    owned = json['owned'];
    synced = json['synced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['name'] = this.name;
    data['address'] = this.address;
    data['port'] = this.port;
    data['version'] = this.version;
    data['scheme'] = this.scheme;
    data['host'] = this.host;
    data['localAddresses'] = this.localAddresses;
    data['machineIdentifier'] = this.machineIdentifier;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['owned'] = this.owned;
    data['synced'] = this.synced;
    return data;
  }

  String toString() {
    return "Name: $name, Address: $address, LocalAddresses: $localAddresses, AccessToken: $accessToken";
  }
}