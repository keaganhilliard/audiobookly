import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';

class AbsUtils {
  static Duration? parseDurationFromMilliseconds(Object? time) {
    double? theDouble = getDoubleFromAmbiguousAttribute(time);

    return theDouble == null
        ? null
        : Duration(milliseconds: (theDouble).round());
  }

  static Duration? parseDurationFromSeconds(Object? time) {
    double? theDouble = getDoubleFromAmbiguousAttribute(time);

    return theDouble == null
        ? null
        : Duration(milliseconds: (theDouble * 1000).round());
  }

  static double? getDoubleFromAmbiguousAttribute(Object? shouldBeDouble) {
    double? theDouble;
    if (shouldBeDouble is String) {
      theDouble = double.parse(shouldBeDouble);
    } else if (shouldBeDouble is double) {
      theDouble = shouldBeDouble.toDouble();
    }
    return theDouble;
  }

  static DateTime? parseDateTime(Object? dateInMillis) {
    if (dateInMillis is! num) return null;
    return DateTime.fromMillisecondsSinceEpoch(dateInMillis.toInt());
  }
}

List<T> getResults<T>(
  Uint8List jsonBytes,
  T Function(Map<String, dynamic>) fromJson, [
  String jsonKey = 'results',
]) {
  return (jsonDecode(utf8.decode(jsonBytes))[jsonKey] as List<dynamic>)
      .map<T>((e) => fromJson(e as Map<String, dynamic>))
      .toList();
}

extension RessponseUtils on Response {
  T parseResult<T>(T Function(Map<String, dynamic>) fromJson) =>
      fromJson(jsonDecode(utf8.decode(bodyBytes)));
  List<T> parseResultsList<T>(T Function(Map<String, dynamic>) fromJson,
          {String jsonKey = 'results', bool useKey = true}) =>
      ((useKey
              ? jsonDecode(utf8.decode(bodyBytes))[jsonKey]
              : jsonDecode(utf8.decode(bodyBytes))) as List<dynamic>)
          .map<T>((e) => fromJson(e as Map<String, dynamic>))
          .toList();
}
