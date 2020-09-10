import 'dart:async';

import 'package:plex_api/plex_api.dart';

class PlexServerV2 {
  String name;
  String product;
  String productVersion;
  String platform;
  String platformVersion;
  String device;
  String clientIdentifier;
  String createdAt;
  String lastSeenAt;
  String provides;
  int ownerId;
  String sourceTitle;
  String publicAddress;
  String accessToken;
  bool owned;
  bool home;
  bool synced;
  bool relay;
  bool presence;
  bool httpsRequired;
  bool publicAddressMatches;
  bool dnsRebindingProtection;
  bool natLoopbackSupported;
  List<PlexConnection> connections;
  PlexApi api;
  String currentIp;

  PlexConnection get mainConnection {
    if (connections != null) {
      return connections.firstWhere(
          (connection) => !publicAddressMatches && !connection.local,
          orElse: () => connections.firstWhere((connection) =>
              connection.address.startsWith('192.') ||
              connection.address.startsWith('10.')));
    } else {
      return null;
    }
  }

  PlexServerV2(
      {this.name,
      this.product,
      this.productVersion,
      this.platform,
      this.platformVersion,
      this.device,
      this.clientIdentifier,
      this.createdAt,
      this.lastSeenAt,
      this.provides,
      this.ownerId,
      this.sourceTitle,
      this.publicAddress,
      this.accessToken,
      this.owned,
      this.home,
      this.synced,
      this.relay,
      this.presence,
      this.httpsRequired,
      this.publicAddressMatches,
      this.dnsRebindingProtection,
      this.natLoopbackSupported,
      this.connections,
      this.api}) {
    // setCurrentIP();
    // Timer.periodic(Duration(seconds: 30), (timer) async {
    //   print(currentIp);
    //   setCurrentIP();
    // });
  }

  PlexServerV2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    product = json['product'];
    productVersion = json['productVersion'];
    platform = json['platform'];
    platformVersion = json['platformVersion'];
    device = json['device'];
    clientIdentifier = json['clientIdentifier'];
    createdAt = json['createdAt'];
    lastSeenAt = json['lastSeenAt'];
    provides = json['provides'];
    ownerId = json['ownerId'];
    sourceTitle = json['sourceTitle'];
    publicAddress = json['publicAddress'];
    accessToken = json['accessToken'];
    owned = json['owned'];
    home = json['home'];
    synced = json['synced'];
    relay = json['relay'];
    presence = json['presence'];
    httpsRequired = json['httpsRequired'];
    publicAddressMatches = json['publicAddressMatches'];
    dnsRebindingProtection = json['dnsRebindingProtection'];
    natLoopbackSupported = json['natLoopbackSupported'];
    if (json['connections'] != null) {
      connections = new List<PlexConnection>();
      json['connections'].forEach((v) {
        connections.add(new PlexConnection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product'] = this.product;
    data['productVersion'] = this.productVersion;
    data['platform'] = this.platform;
    data['platformVersion'] = this.platformVersion;
    data['device'] = this.device;
    data['clientIdentifier'] = this.clientIdentifier;
    data['createdAt'] = this.createdAt;
    data['lastSeenAt'] = this.lastSeenAt;
    data['provides'] = this.provides;
    data['ownerId'] = this.ownerId;
    data['sourceTitle'] = this.sourceTitle;
    data['publicAddress'] = this.publicAddress;
    data['accessToken'] = this.accessToken;
    data['owned'] = this.owned;
    data['home'] = this.home;
    data['synced'] = this.synced;
    data['relay'] = this.relay;
    data['presence'] = this.presence;
    data['httpsRequired'] = this.httpsRequired;
    data['publicAddressMatches'] = this.publicAddressMatches;
    data['dnsRebindingProtection'] = this.dnsRebindingProtection;
    data['natLoopbackSupported'] = this.natLoopbackSupported;
    if (this.connections != null) {
      data['connections'] = this.connections.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void setCurrentIP() async {
    this.currentIp = await api.getCurrentIP();
  }

  Future<List<PlexLibrary>> getLibraries() async {
    return await api.getLibraries(this);
  }

  Future<List<PlexArtist>> getArtists(String libraryKey) async {
    return await api.getArtists(this, libraryKey);
  }

  Future<PlexAlbum> getAlbumFromKey(String albumKey) async {
    return await api.getAlbumFromKey(this, albumKey);
  }

  Future<List<PlexAlbum>> getAllAlbums(String libraryKey) async {
    List<PlexAlbum> albums = await api.getAllAlbums(this, libraryKey);
    return albums;
  }

  Future<List<PlexTrack>> getAllTracks(String libraryKey) async {
    List<PlexTrack> albums = await api.getAllTracks(this, libraryKey);
    return albums;
  }

  Future<List<PlexAlbum>> getRecentlyAdded(String libraryKey) async {
    List<PlexAlbum> albums = await api.getRecentlyAdded(this, libraryKey);
    return albums;
  }

  Future<List<PlexAlbum>> getRecentlyViewed(String libraryKey) async {
    List<PlexAlbum> albums = await api.getRecentlyViewed(this, libraryKey);
    return albums;
  }

  Future<List<PlexAlbum>> getAlbumsFromArtist(String artistRatingKey) async {
    return await api.getAlbumsFromArtist(this, artistRatingKey);
  }

  Future<List<PlexAlbum>> getAlbumsFromCollection(
      String libraryKey, String collectionKey) async {
    return await api.getAlbumsFromCollection(this, libraryKey, collectionKey);
  }

  Future<List<PlexAlbum>> searchAlbums(String libraryKey, String search) async {
    return await api.searchAlbums(this, libraryKey, search);
  }

  Future<List<PlexTrack>> getTracks(String albumRatingKey) async {
    return await api.getTracks(this, albumRatingKey);
  }

  Future<List<PlexCollection>> getCollections(String libraryKey) async {
    return await api.getCollections(this, libraryKey);
  }

  Future savePosition(String key, int currentTime, int duration,
      PlexPlaybackState state) async {
    return await api.savePosition(this, key, currentTime, duration, state);
  }

  String getUrlWithToken(String path) {
    return api.getUrlWithToken(this, path);
  }

  String getThumbnailUrl(String path, [int dimension = 400]) {
    return api.getThumbnailUrl(this, path, dimension);
  }
}

class PlexConnection {
  String protocol;
  String address;
  int port;
  String uri;
  bool local;
  bool relay;
  bool iPv6;

  PlexConnection(
      {this.protocol,
      this.address,
      this.port,
      this.uri,
      this.local,
      this.relay,
      this.iPv6});

  PlexConnection.fromJson(Map<String, dynamic> json) {
    protocol = json['protocol'];
    address = json['address'];
    port = json['port'];
    uri = json['uri'];
    local = json['local'];
    relay = json['relay'];
    iPv6 = json['IPv6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protocol'] = this.protocol;
    data['address'] = this.address;
    data['port'] = this.port;
    data['uri'] = this.uri;
    data['local'] = this.local;
    data['relay'] = this.relay;
    data['IPv6'] = this.iPv6;
    return data;
  }
}
