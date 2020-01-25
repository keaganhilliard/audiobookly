import "package:meta/meta.dart";

class PlexHeaders {
  /// X-Plex-Platform	(Platform name, eg iOS, MacOSX, Android, LG, etc)
  String platform;

  /// X-Plex-Platform-Version	(Operating system version, eg 4.3.1, 10.6.7, 3.2)
  String platformVersion;

  /// X-Plex-Provides	(one or more of [player, controller, server])
  String provides;

  /// X-Plex-Client-Identifier	(UUID, serial number, or other number unique per device)
  String clientIdentifier;

  /// X-Plex-Product	(Plex application name, eg Laika, Plex Media Server, Media Link)
  String product;

  /// X-Plex-Version	(Plex application version number)
  String version;

  /// X-Plex-Device	(Device name and model number, eg iPhone3,2, Motorola XOOM™, LG5200TV)
  String device;

  /// X-Plex-Container-Size	(Paging Size, eg Plex-Container-Size=1)
  String containerSize;

  /// X-Plex-Token	(Authentication token)
  String token;

  /// Accept
  String accept;

  // In case we need to use something other than application/json
  String contentType;

  PlexHeaders({
    @required this.clientIdentifier,
    this.platform = '',
    this.platformVersion = '',
    this.provides = 'player',
    this.product = '',
    this.version = '',
    this.device = '',
    this.containerSize = '',
    this.token = '',
    this.accept = 'application/json',
    this.contentType = 'application/json'
  }) : assert(clientIdentifier != null && clientIdentifier != '');

  Map<String, String> toMap() => {
        'X-Plex-Platform': this.platform,
        'X-Plex-Platform-Version': this.platformVersion,
        'X-Plex-Provides': this.provides,
        'X-Plex-Client-Identifier': this.clientIdentifier,
        'X-Plex-Product': this.product,
        'X-Plex-Version': this.version,
        'X-Plex-Device': this.device,
        'X-Plex-Container-Size': this.containerSize,
        'X-Plex-Token': this.token,
        'Accept': this.accept,
        'Content-Type': this.contentType
      };
}
