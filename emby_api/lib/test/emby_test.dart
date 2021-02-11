import 'package:test/test.dart';
import 'package:emby_api/src/emby_api.dart';

void main() {
  test('Login Successful', () async {
    final api = EmbyApi(
      baseUrl: 'emby.azothforgotten.com',
      client: 'Audiobookly',
      deviceName: 'Android',
      clientVersion: '0.0.1.0',
      token: '0c7b8823527d4bd19f97ceccc0174cce',
      deviceId: 'ZEPPY',
    );
    final res = await api.login('keagan.hilliard@gmail.com', '***REMOVED***');
    print(res.accessToken);
    expect(
      res.accessToken,
      isNot(equals(null)),
    );
  });

  test('Get Recently Added', () async {
    print('STarting');
    var api = EmbyApi(
      baseUrl: 'emby.azothforgotten.com',
      client: 'Audiobookly',
      deviceName: 'Android',
      clientVersion: '0.0.1.0',
      token: '0c7b8823527d4bd19f97ceccc0174cce',
      deviceId: 'ZEPPY',
    );

    var items = await api.getRecentlyAdded('48af3bb0f5988d3cd867a245b7ef32d1');
    items.forEach((element) {
      print(element.name);
    });
  });
}
