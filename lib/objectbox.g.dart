// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'database/entities.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:7968653816016852112",
        "lastPropertyId": "6:4901756861453353842",
        "name": "Book",
        "properties": [
          {"id": "1:6010075238166090135", "name": "id", "type": 6, "flags": 1},
          {"id": "2:5430407976412558200", "name": "exId", "type": 9},
          {"id": "3:5950058525273420119", "name": "title", "type": 9},
          {"id": "4:7941224302771259559", "name": "author", "type": 9},
          {"id": "5:3279714818521013753", "name": "description", "type": 9},
          {
            "id": "6:4901756861453353842",
            "name": "durationInMilliseconds",
            "type": 6
          }
        ],
        "relations": [],
        "backlinks": [
          {"name": "tracks", "srcEntity": "Track", "srcField": ""}
        ]
      },
      {
        "id": "2:3744221835344948983",
        "lastPropertyId": "6:4586161345339671471",
        "name": "DownloadTask",
        "properties": [
          {"id": "1:6374727733805080173", "name": "id", "type": 6, "flags": 1},
          {"id": "2:9027542594289117336", "name": "progress", "type": 8},
          {
            "id": "3:4039890115977935168",
            "name": "trackId",
            "type": 11,
            "flags": 520,
            "indexId": "1:1265909808686125968",
            "relationTarget": "Track"
          },
          {"id": "4:438735009237650167", "name": "status", "type": 9},
          {"id": "5:4419907167810871129", "name": "path", "type": 9},
          {"id": "6:4586161345339671471", "name": "url", "type": 9}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "3:488527119246372000",
        "lastPropertyId": "4:2391151777963167133",
        "name": "Track",
        "properties": [
          {"id": "1:4932588467112853406", "name": "id", "type": 6, "flags": 1},
          {"id": "2:6047718478732151832", "name": "exId", "type": 9},
          {"id": "3:7841225794578977304", "name": "title", "type": 9},
          {
            "id": "4:2391151777963167133",
            "name": "bookId",
            "type": 11,
            "flags": 520,
            "indexId": "2:5136697801723172224",
            "relationTarget": "Book"
          }
        ],
        "relations": [],
        "backlinks": [
          {"name": "downloadTasks", "srcEntity": "DownloadTask", "srcField": ""}
        ]
      }
    ],
    "lastEntityId": "3:488527119246372000",
    "lastIndexId": "2:5136697801723172224",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[Book] = EntityDefinition<Book>(
      model: model.getEntityByUid(7968653816016852112),
      toOneRelations: (Book object) => [],
      toManyRelations: (Book object) => {
            RelInfo<Track>.toOneBacklink(
                    4, object.id, (Track srcObject) => srcObject.book):
                object.tracks
          },
      getId: (Book object) => object.id,
      setId: (Book object, int id) {
        object.id = id;
      },
      objectToFB: (Book object, fb.Builder fbb) {
        final offsetexId =
            object.exId == null ? null : fbb.writeString(object.exId);
        final offsettitle =
            object.title == null ? null : fbb.writeString(object.title);
        final offsetauthor =
            object.author == null ? null : fbb.writeString(object.author);
        final offsetdescription = object.description == null
            ? null
            : fbb.writeString(object.description);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetexId);
        fbb.addOffset(2, offsettitle);
        fbb.addOffset(3, offsetauthor);
        fbb.addOffset(4, offsetdescription);
        fbb.addInt64(5, object.durationInMilliseconds);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Book();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.exId = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.title = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.author = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        object.description =
            fb.StringReader().vTableGet(buffer, rootOffset, 12);
        object.durationInMilliseconds =
            fb.Int64Reader().vTableGet(buffer, rootOffset, 14);
        InternalToManyAccess.setRelInfo(
            object.tracks,
            store,
            RelInfo<Track>.toOneBacklink(
                4, object.id, (Track srcObject) => srcObject.book),
            store.box<Book>());
        return object;
      });
  bindings[DownloadTask] = EntityDefinition<DownloadTask>(
      model: model.getEntityByUid(3744221835344948983),
      toOneRelations: (DownloadTask object) => [object.track],
      toManyRelations: (DownloadTask object) => {},
      getId: (DownloadTask object) => object.id,
      setId: (DownloadTask object, int id) {
        object.id = id;
      },
      objectToFB: (DownloadTask object, fb.Builder fbb) {
        final offsetstatus =
            object.status == null ? null : fbb.writeString(object.status);
        final offsetpath =
            object.path == null ? null : fbb.writeString(object.path);
        final offseturl =
            object.url == null ? null : fbb.writeString(object.url);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addFloat64(1, object.progress);
        fbb.addInt64(2, object.track.targetId);
        fbb.addOffset(3, offsetstatus);
        fbb.addOffset(4, offsetpath);
        fbb.addOffset(5, offseturl);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = DownloadTask();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.progress = fb.Float64Reader().vTableGet(buffer, rootOffset, 6);
        object.track.targetId =
            fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
        object.track.attach(store);
        object.status = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        object.path = fb.StringReader().vTableGet(buffer, rootOffset, 12);
        object.url = fb.StringReader().vTableGet(buffer, rootOffset, 14);
        return object;
      });
  bindings[Track] = EntityDefinition<Track>(
      model: model.getEntityByUid(488527119246372000),
      toOneRelations: (Track object) => [object.book],
      toManyRelations: (Track object) => {
            RelInfo<DownloadTask>.toOneBacklink(
                    3, object.id, (DownloadTask srcObject) => srcObject.track):
                object.downloadTasks
          },
      getId: (Track object) => object.id,
      setId: (Track object, int id) {
        object.id = id;
      },
      objectToFB: (Track object, fb.Builder fbb) {
        final offsetexId =
            object.exId == null ? null : fbb.writeString(object.exId);
        final offsettitle =
            object.title == null ? null : fbb.writeString(object.title);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetexId);
        fbb.addOffset(2, offsettitle);
        fbb.addInt64(3, object.book.targetId);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Track();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.exId = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.title = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.book.targetId =
            fb.Int64Reader().vTableGet(buffer, rootOffset, 10);
        object.book.attach(store);
        InternalToManyAccess.setRelInfo(
            object.downloadTasks,
            store,
            RelInfo<DownloadTask>.toOneBacklink(
                3, object.id, (DownloadTask srcObject) => srcObject.track),
            store.box<Track>());
        return object;
      });

  return ModelDefinition(model, bindings);
}

class Book_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final exId =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final title =
      QueryStringProperty(entityId: 1, propertyId: 3, obxType: 9);
  static final author =
      QueryStringProperty(entityId: 1, propertyId: 4, obxType: 9);
  static final description =
      QueryStringProperty(entityId: 1, propertyId: 5, obxType: 9);
  static final durationInMilliseconds =
      QueryIntegerProperty(entityId: 1, propertyId: 6, obxType: 6);
}

class DownloadTask_ {
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 1, obxType: 6);
  static final progress =
      QueryDoubleProperty(entityId: 2, propertyId: 2, obxType: 8);
  static final track = QueryRelationProperty<DownloadTask, Track>(
      targetEntityId: 3, sourceEntityId: 2, propertyId: 3, obxType: 11);
  static final status =
      QueryStringProperty(entityId: 2, propertyId: 4, obxType: 9);
  static final path =
      QueryStringProperty(entityId: 2, propertyId: 5, obxType: 9);
  static final url =
      QueryStringProperty(entityId: 2, propertyId: 6, obxType: 9);
}

class Track_ {
  static final id =
      QueryIntegerProperty(entityId: 3, propertyId: 1, obxType: 6);
  static final exId =
      QueryStringProperty(entityId: 3, propertyId: 2, obxType: 9);
  static final title =
      QueryStringProperty(entityId: 3, propertyId: 3, obxType: 9);
  static final book = QueryRelationProperty<Track, Book>(
      targetEntityId: 1, sourceEntityId: 3, propertyId: 4, obxType: 11);
}
