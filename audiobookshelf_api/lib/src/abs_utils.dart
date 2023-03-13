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
