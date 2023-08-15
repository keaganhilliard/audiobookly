class Track {
  final String id;
  final String title;
  final Duration duration;
  final double downloadProgress;
  final bool isDownloaded;
  final DateTime? downloadedAt;
  final String downloadPath;
  final String serverPath;
  final String bookId;
  final String downloadTaskId;
  final int downloadTaskStatus;

  Track({
    required this.id,
    required this.title,
    required this.duration,
    required this.downloadProgress,
    required this.isDownloaded,
    this.downloadedAt,
    required this.downloadPath,
    required this.serverPath,
    required this.bookId,
    required this.downloadTaskId,
    required this.downloadTaskStatus,
  });

  Track copyWith({
    String? id,
    String? title,
    Duration? duration,
    double? downloadProgress,
    bool? isDownloaded,
    DateTime? downloadedAt,
    String? downloadPath,
    String? serverPath,
    String? bookId,
    String? downloadTaskId,
    int? downloadTaskStatus,
  }) =>
      Track(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        downloadProgress: downloadProgress ?? this.downloadProgress,
        isDownloaded: isDownloaded ?? this.isDownloaded,
        downloadedAt: downloadedAt ?? this.downloadedAt,
        downloadPath: downloadPath ?? this.downloadPath,
        serverPath: serverPath ?? this.serverPath,
        bookId: bookId ?? this.bookId,
        downloadTaskId: downloadTaskId ?? this.downloadTaskId,
        downloadTaskStatus: downloadTaskStatus ?? this.downloadTaskStatus,
      );

  @override
  String toString() {
    return 'Track(id: $id, title: $title, duration: $duration, downloadProgress: $downloadProgress, isDownloaded: $isDownloaded, downloadPath: $downloadPath, bookId: $bookId, downloadTaskId: $downloadTaskId, downloadTaskStatus: $downloadTaskStatus)';
  }
}
