class AbsUtils {
  static Duration? parseDuration(double? time) {
    return time == null ? null : Duration(milliseconds: (time * 1000).round());
  }

  static DateTime? parseDateTime(int? dateInMillis) {
    return dateInMillis == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(dateInMillis);
  }
}
