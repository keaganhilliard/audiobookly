import 'abs_utils.dart';

class AbsAudiobookProgress {
  String id;
  Duration? duration;
  double? progress;
  Duration? currentTime;
  bool isFinished;
  DateTime? lastUpdate;
  DateTime? startedAt;
  DateTime? finishedAt;
  List<int>? bookmarks;

  AbsAudiobookProgress({
    required this.id,
    this.duration,
    this.progress,
    this.currentTime,
    required this.isFinished,
    this.lastUpdate,
    this.startedAt,
    this.finishedAt,
    this.bookmarks,
  });

  factory AbsAudiobookProgress.fromJson(Map<String, dynamic> json) =>
      AbsAudiobookProgress(
        id: json['id'],
        duration: AbsUtils.parseDurationFromSeconds(json['duration']),
        isFinished: json['isFinished'],
        progress: json['progress']?.toDouble(),
        currentTime: AbsUtils.parseDurationFromSeconds(json['currentTime']),
        lastUpdate: AbsUtils.parseDateTime(json['lastUpdate']),
        startedAt: AbsUtils.parseDateTime(json['startedAt']),
        finishedAt: AbsUtils.parseDateTime(json['finishedAt']),
        bookmarks: json['bookmarks']?.cast<int>(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['duration'] = (duration?.inMilliseconds ?? 0) / 1000;
    data['progress'] = progress;
    data['currentTime'] = (currentTime?.inMilliseconds ?? 0) / 1000;
    data['isFinished'] = isFinished;
    data['lastUpdate'] = lastUpdate?.millisecondsSinceEpoch;
    data['startedAt'] = startedAt?.millisecondsSinceEpoch;
    data['finishedAt'] = finishedAt?.millisecondsSinceEpoch;
    data['bookmarks'] = bookmarks;
    return data;
  }
}
