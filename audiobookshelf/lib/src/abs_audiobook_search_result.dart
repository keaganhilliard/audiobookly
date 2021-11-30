import 'package:audiobookshelf/audiobookshelf.dart';

class AbsAudiobookSearchResult {
  String matchKey;
  String matchText;
  AbsAudiobook audiobook;

  AbsAudiobookSearchResult(
      {required this.matchKey,
      required this.matchText,
      required this.audiobook});

  factory AbsAudiobookSearchResult.fromJson(Map<String, dynamic> json) =>
      AbsAudiobookSearchResult(
        matchKey: json['matchKey'],
        matchText: json['matchText'],
        audiobook: AbsAudiobook.fromJson(json['audiobook']),
      );

  Map<String, dynamic> toJson() => {
        'matchKey': matchKey,
        'matchText': matchText,
        'audiobook': audiobook.toJson()
      };

  @override
  String toString() {
    return 'AbsAudiobookSearchResult(matchKey: $matchKey, matchText: $matchText, audiobook: $audiobook)';
  }
}
