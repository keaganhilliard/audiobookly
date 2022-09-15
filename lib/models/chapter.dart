class Chapter {
  Chapter({
    required this.id,
    required this.start,
    required this.end,
    required this.title,
    required this.bookId,
  });

  final String id;
  final double start;
  final double end;
  final String title;
  final int bookId;

  factory Chapter.fromJson(Map<String, dynamic> json, int bookId) => Chapter(
        id: json["id"].toString(),
        start: json["start"].toDouble(),
        end: json["end"].toDouble(),
        title: json["title"],
        bookId: bookId,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "title": title,
        "bookId": bookId,
      };
}
