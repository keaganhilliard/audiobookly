import 'package:audiobookshelf/audiobookshelf.dart';

class AbsAudiobookSearchResult {
  // String matchKey;
  // String matchText;
  AbsAudiobook libraryItem;

  AbsAudiobookSearchResult({
    // required this.matchKey,
    // required this.matchText,
    required this.libraryItem,
  });

  factory AbsAudiobookSearchResult.fromJson(Map<String, dynamic> json) =>
      AbsAudiobookSearchResult(
        // matchKey: json['matchKey'],
        // matchText: json['matchText'],
        libraryItem: AbsAudiobook.fromJson(json['libraryItem']),
      );

  Map<String, dynamic> toJson() => {
        // 'matchKey': matchKey,
        // 'matchText': matchText,
        'libraryItem': libraryItem.toJson()
      };

  @override
  String toString() {
    return 'AbsAudiobookSearchResult(libraryItem: $libraryItem)';
  }
}
