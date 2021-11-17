import 'dart:convert';
import 'dart:io';

import 'audiobookshelf.dart';

void main(List<String> args) async {
  AudiobookshelfApi api =
      AudiobookshelfApi(baseUrl: 'https://audiobookshelf.keagan.ninja');
  final res = await api.login('azoth', 'FwFGNCATxRw7Gp7ZLPRC');
  print(jsonEncode(res.user.toJson()));
  final secondRes = await api.getAll();
  File f = File('./out.json');
  await f.writeAsString(jsonEncode([for (final s in secondRes) s.toJson()]));
}
