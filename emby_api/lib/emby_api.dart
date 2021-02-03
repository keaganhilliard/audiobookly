import 'package:emby_api/src/emby_api.dart';

Future<void> main() async {
  var api = EmbyApi('emby.azothforgotten.com', {
    // 'X-Emby-Client': 'Audiobookly',
    // 'X-Emby-Device-Name': 'Android',
    // 'X-Emby-Client-Version': '0.0.1.0',
    // 'X-Emby-Token': '0c7b8823527d4bd19f97ceccc0174cce',
    'Accept': 'application/json'
    // 'X-Emby-Device-Id': 'ZEPPY',
  });

  var items = await api.getRecentlyAdded('48af3bb0f5988d3cd867a245b7ef32d1');
  items.forEach((element) {
    print('${element.name}: ${element.overview}');
  });
}
