import 'abs_utils.dart';

class AbsAudiobookProgress {
  String audiobookId;
  Duration? totalDuration;
  double? progress;
  Duration? currentTime;
  bool isRead;
  DateTime? lastUpdate;
  DateTime? startedAt;
  DateTime? finishedAt;
  List<int>? bookmarks;

  AbsAudiobookProgress({
    required this.audiobookId,
    this.totalDuration,
    this.progress,
    this.currentTime,
    required this.isRead,
    this.lastUpdate,
    this.startedAt,
    this.finishedAt,
    this.bookmarks,
  });

  factory AbsAudiobookProgress.fromJson(Map<String, dynamic> json) =>
      AbsAudiobookProgress(
        audiobookId: json['audiobookId'],
        totalDuration:
            AbsUtils.parseDuration(json['totalDuration']?.toDouble()),
        isRead: json['isRead'],
        progress: json['progress']?.toDouble(),
        currentTime: AbsUtils.parseDuration(json['currentTime']?.toDouble()),
        lastUpdate: AbsUtils.parseDateTime(json['lastUpdate']),
        startedAt: AbsUtils.parseDateTime(json['startedAt']),
        finishedAt: AbsUtils.parseDateTime(json['finishedAt']),
        bookmarks: json['bookmarks']?.cast<int>(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['audiobookId'] = audiobookId;
    data['totalDuration'] = totalDuration?.inMilliseconds ?? 0 / 1000;
    data['progress'] = progress;
    data['currentTime'] = (currentTime?.inMilliseconds ?? 0) / 1000;
    data['isRead'] = isRead;
    data['lastUpdate'] = lastUpdate?.millisecondsSinceEpoch;
    data['startedAt'] = startedAt?.millisecondsSinceEpoch;
    data['finishedAt'] = finishedAt?.millisecondsSinceEpoch;
    data['bookmarks'] = bookmarks;
    return data;
  }
}
