import 'package:audiobookly/core/constants/app_constants.dart';
// import 'package:audiobookly/core/services/audio_service.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: PlexApi(headers: PlexSettings.headers)),
  // Provider.value(value: startAudioService()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
