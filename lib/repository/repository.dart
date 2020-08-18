import 'dart:async';

import 'package:audiobookly/core/database/database.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:plex_api/plex_api.dart';

class Repository {
  BookDatabase _bookDatabase;

  static Repository get to => Get.find();

  Stream get allBooks => _bookDatabase?.allBooksWithTracks();

  Future connect() async {
    if (_bookDatabase != null) return;
    MoorIsolate i = await getMoorIsolate();
    DatabaseConnection dbConn = await i.connect();
    _bookDatabase = BookDatabase.connect(dbConn);
  }

  static Future<List<PlexTrack>> getAllTracks(ServerAndLibrary sl) async {
    // PlexServerCommunicator communicator = PlexServerCommunicator();
    // await communicator.getServerAndLibrary();
    List<PlexAlbum> plexBooks = (await sl.server.getAllAlbums(sl.library));
    List<PlexTrack> plexTracks = [];
    await Future.wait(plexBooks.map((book) async {
      int index = 0;
      List<PlexTrack> bookTracks =
          (await sl.server.getTracks(book.ratingKey)).map((track) {
        track.index ??= index++;
        return track;
      }).toList();
      plexTracks.addAll(bookTracks);
    }));
    return plexTracks;
  }

  Future refreshDatabase() async {
    PlexServerCommunicator communicator = PlexServerCommunicator();
    await communicator.getServerAndLibrary();
    print('Gonsta try to get tracks');
    print('Starting callout: ${DateTime.now()}');
    // List<MediaItem> plexBooks = (await communicator.getAllBooks());
    List<PlexTrack> plexTracks =
        await compute(getAllTracks, await communicator.serverAndLibrary);
    // await Future.wait(plexBooks.map((book) async {
    //   int index = 0;
    //   List<PlexTrack> bookTracks =
    //       (await (await communicator.server).getTracks(book.id)).map((track) {
    //     track.index ??= index++;
    //     return track;
    //   }).toList();
    //   plexTracks.addAll(bookTracks);
    // }));
    // try {
    //   plexTracks.addAll(await (await communicator.server)
    //       .getAllTracks(communicator.libraryKey));
    // } catch (e) {
    //   print(e);
    // }
    print('Tracks got! ${plexTracks.length}');
    print('Finished decode: ${DateTime.now()}');
    Map<String, Author> authors = Map();
    Map<String, Book> books = Map();
    Map<String, List<Track>> tracks = Map();

    plexTracks.forEach((track) {
      authors.putIfAbsent(
        track.grandparentRatingKey,
        () => Author(
          id: track.grandparentRatingKey,
          title: track.grandparentTitle,
          artUrl: track.grandparentThumb,
        ),
      );
      books.putIfAbsent(
        track.parentRatingKey,
        () => Book(
          id: track.parentRatingKey,
          title: track.parentTitle,
          artUrl: track.parentThumb ?? track.grandparentThumb ?? 'placeholder',
          author: track.grandparentRatingKey,
        ),
      );
      tracks.putIfAbsent(track.parentRatingKey, () => []).add(
            Track(
              id: track.ratingKey,
              book: track.parentRatingKey,
              fileUrl: track.media[0].part[0].file,
              cached: false,
              duration: track.duration,
              index: track.index,
            ),
          );
    });
    await connect();
    var res =
        await _bookDatabase.insertMultipleAuthors(authors.values.toList());
    print(res);
    await _bookDatabase.insertMultipleBooks(books.values.toList());
    await _bookDatabase.insertMultipleTracks(
      tracks.values.fold([], (previousValue, element) {
        previousValue.addAll(element);
        return previousValue;
      }),
    );
  }
}
