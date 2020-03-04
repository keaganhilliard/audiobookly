import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/viewmodels/root_view_model.dart';
import 'package:provider/provider.dart';

import 'package:plex_api/plex_api.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: PlexApi(headers: PlexSettings.headers)),
  Provider.value(value: startAudioService()),
];

List<SingleChildCloneableWidget> dependentServices = [];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
