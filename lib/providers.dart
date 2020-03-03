import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/search.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:audio_service/audio_service.dart';

import 'package:plex_api/plex_api.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: PlexApi(headers: PlexSettings.headers)),
  Provider.value(value: Search()),
  Provider.value(value: startAudioService()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<PlexApi, AuthenticationService>(
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  ),
  // StreamProvider.value(value: AudioService.playbackStateStream),
  // StreamProvider.value(value: AudioService.currentMediaItemStream),
  // StreamProvider.value(value: AudioService.queueStream),
  // StreamProvider.value(value: AudioService.browseMediaChildrenStream),
];
