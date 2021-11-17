class Track {
  final String id;
  final String title;
  final Duration duration;
  final double downloadProgress;
  final bool isDownloaded;
  final String downloadPath;
  final String bookId;
  final String downloadTaskId;
  final int downloadTaskStatus;

  Track(
    this.id,
    this.title,
    this.duration,
    this.downloadProgress,
    this.isDownloaded,
    this.downloadPath,
    this.bookId,
    this.downloadTaskId,
    this.downloadTaskStatus,
  );

  Track copyWith({
    String? id,
    String? title,
    Duration? duration,
    double? downloadProgress,
    bool? isDownloaded,
    String? downloadPath,
    String? bookId,
    String? downloadTaskId,
    int? downloadTaskStatus,
  }) =>
      Track(
        id ?? this.id,
        title ?? this.title,
        duration ?? this.duration,
        downloadProgress ?? this.downloadProgress,
        isDownloaded ?? this.isDownloaded,
        downloadPath ?? this.downloadPath,
        bookId ?? this.bookId,
        downloadTaskId ?? this.downloadTaskId,
        downloadTaskStatus ?? this.downloadTaskStatus,
      );
}
