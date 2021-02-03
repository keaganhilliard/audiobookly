import 'package:test/test.dart';
import 'package:emby_api/src/emby_api.dart';

void main() {
  test('Login Successful', () async {
    final api = EmbyApi(
      '192.168.86.34:8096',
      {
        'X-Emby-Authorization':
            'Emby Client="Android", Device="Zeppy", DeviceId="ZEPPY", Version="1.0"',
      },
    );
    final res = await api.login('keagan.hilliard@gmail.com', '***REMOVED***');
    expect(
      res.accessToken,
      isNot(equals(null)),
    );
  });

  test('Get Recently Added', () async {
    print('STarting');
    var api = EmbyApi('emby.azothforgotten.com', {
      'X-Emby-Client': 'Audiobookly',
      'X-Emby-Device-Name': 'Android',
      'X-Emby-Client-Version': '0.0.1.0',
      'X-Emby-Token': '0c7b8823527d4bd19f97ceccc0174cce',
      'X-Emby-Device-Id': 'ZEPPY',
    });

    var items = await api.getRecentlyAdded('48af3bb0f5988d3cd867a245b7ef32d1');
    items.forEach((element) {
      print(element.name);
    });
  });
}
