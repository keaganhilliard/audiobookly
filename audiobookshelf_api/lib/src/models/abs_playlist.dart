import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'abs_playlist.freezed.dart';
part 'abs_playlist.g.dart';

@freezed
abstract class AbsPlaylist with _$AbsPlaylist {
  const factory AbsPlaylist({
    required String id,
    required String libraryId,
    required String userId,
    required String name,
    String? description,
    String? coverPath,
    required List<Item> items,
  }) = _AbsPlaylist;

  factory AbsPlaylist.fromJson(Map<String, dynamic> json) =>
      _$AbsPlaylistFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    String? libraryItemId,
    String? episodeId,
    required AbsAudiobook libraryItem,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
