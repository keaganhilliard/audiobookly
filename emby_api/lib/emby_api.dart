// import 'package:emby_api/src/emby_api.dart';

// Future<void> main() async {
//   var api = EmbyApi(
//     baseUrl: 'emby.azothforgotten.com',
//     client: 'Audiobookly',
//     deviceName: 'Android',
//     clientVersion: '0.0.1.0',
//     token: '0c7b8823527d4bd19f97ceccc0174cce',
//     deviceId: 'ZEPPY',
//     userId: '31a845bac32341a3a379b67d326489bf',
//   );

//   // var items = await api.getItemsForCollection('168975');
//   // //('48af3bb0f5988d3cd867a245b7ef32d1');
//   // items.forEach((element) {
//   //   print('${element.name}: ${element.albumArtist}');
//   // });

//   print((await api.getUser()).toJson());

//   // var childItems = await api.getItemsForCollection('168897');
//   // childItems.forEach((element) {
//   //   print('${element.name}: ${element.albumArtist}');
//   // });
// }

library emby_api;

export 'src/emby_api.dart';
export 'src/emby_artist.dart';
export 'src/emby_image_tag.dart';
export 'src/emby_item.dart';
export 'src/emby_login_response.dart';
export 'src/emby_server.dart';
export 'src/emby_user.dart';
export 'src/emby_user_data.dart';
