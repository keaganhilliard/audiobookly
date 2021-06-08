// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'database/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7968653816016852112),
      name: 'Book',
      lastPropertyId: const IdUid(7, 6099277228885854196),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6010075238166090135),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5430407976412558200),
            name: 'exId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5950058525273420119),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7941224302771259559),
            name: 'author',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3279714818521013753),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4901756861453353842),
            name: 'durationInMilliseconds',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6099277228885854196),
            name: 'artPath',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'tracks', srcEntity: 'Track', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 3744221835344948983),
      name: 'DownloadTask',
      lastPropertyId: const IdUid(6, 4586161345339671471),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6374727733805080173),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9027542594289117336),
            name: 'progress',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4039890115977935168),
            name: 'trackId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 1265909808686125968),
            relationTarget: 'Track'),
        ModelProperty(
            id: const IdUid(4, 438735009237650167),
            name: 'status',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4419907167810871129),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4586161345339671471),
            name: 'url',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 488527119246372000),
      name: 'Track',
      lastPropertyId: const IdUid(5, 717134928331429442),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4932588467112853406),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6047718478732151832),
            name: 'exId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7841225794578977304),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2391151777963167133),
            name: 'bookId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 5136697801723172224),
            relationTarget: 'Book'),
        ModelProperty(
            id: const IdUid(5, 717134928331429442),
            name: 'durationInMilliseconds',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'downloadTasks', srcEntity: 'DownloadTask', srcField: '')
      ])
];

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 488527119246372000),
      lastIndexId: const IdUid(2, 5136697801723172224),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Book: EntityDefinition<Book>(
        model: _entities[0],
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
          final exIdOffset = fbb.writeString(object.exId);
          final titleOffset = fbb.writeString(object.title);
          final authorOffset = fbb.writeString(object.author);
          final descriptionOffset = fbb.writeString(object.description);
          final artPathOffset = fbb.writeString(object.artPath);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, exIdOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, authorOffset);
          fbb.addOffset(4, descriptionOffset);
          fbb.addInt64(5, object.durationInMilliseconds);
          fbb.addOffset(6, artPathOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Book(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              exId:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              title:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              author:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              description:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              artPath:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 16, ''),
              durationInMilliseconds:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0));
          InternalToManyAccess.setRelInfo(
              object.tracks,
              store,
              RelInfo<Track>.toOneBacklink(
                  4, object.id, (Track srcObject) => srcObject.book),
              store.box<Book>());
          return object;
        }),
    DownloadTask: EntityDefinition<DownloadTask>(
        model: _entities[1],
        toOneRelations: (DownloadTask object) => [object.track],
        toManyRelations: (DownloadTask object) => {},
        getId: (DownloadTask object) => object.id,
        setId: (DownloadTask object, int id) {
          object.id = id;
        },
        objectToFB: (DownloadTask object, fb.Builder fbb) {
          final statusOffset = fbb.writeString(object.status);
          final pathOffset = fbb.writeString(object.path);
          final urlOffset = fbb.writeString(object.url);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addFloat64(1, object.progress);
          fbb.addInt64(2, object.track.targetId);
          fbb.addOffset(3, statusOffset);
          fbb.addOffset(4, pathOffset);
          fbb.addOffset(5, urlOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DownloadTask(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              progress:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0),
              status:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              path:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              url: const fb.StringReader()
                  .vTableGet(buffer, rootOffset, 14, ''));
          object.track.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.track.attach(store);
          return object;
        }),
    Track: EntityDefinition<Track>(
        model: _entities[2],
        toOneRelations: (Track object) => [object.book],
        toManyRelations: (Track object) => {
              RelInfo<DownloadTask>.toOneBacklink(3, object.id,
                      (DownloadTask srcObject) => srcObject.track):
                  object.downloadTasks
            },
        getId: (Track object) => object.id,
        setId: (Track object, int id) {
          object.id = id;
        },
        objectToFB: (Track object, fb.Builder fbb) {
          final exIdOffset = fbb.writeString(object.exId);
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, exIdOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addInt64(3, object.book.targetId);
          fbb.addInt64(4, object.durationInMilliseconds);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Track(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              exId:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              title:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              durationInMilliseconds:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          object.book.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.book.attach(store);
          InternalToManyAccess.setRelInfo(
              object.downloadTasks,
              store,
              RelInfo<DownloadTask>.toOneBacklink(
                  3, object.id, (DownloadTask srcObject) => srcObject.track),
              store.box<Track>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Book] entity fields to define ObjectBox queries.
class Book_ {
  /// see [Book.id]
  static final id = QueryIntegerProperty<Book>(_entities[0].properties[0]);

  /// see [Book.exId]
  static final exId = QueryStringProperty<Book>(_entities[0].properties[1]);

  /// see [Book.title]
  static final title = QueryStringProperty<Book>(_entities[0].properties[2]);

  /// see [Book.author]
  static final author = QueryStringProperty<Book>(_entities[0].properties[3]);

  /// see [Book.description]
  static final description =
      QueryStringProperty<Book>(_entities[0].properties[4]);

  /// see [Book.durationInMilliseconds]
  static final durationInMilliseconds =
      QueryIntegerProperty<Book>(_entities[0].properties[5]);

  /// see [Book.artPath]
  static final artPath = QueryStringProperty<Book>(_entities[0].properties[6]);
}

/// [DownloadTask] entity fields to define ObjectBox queries.
class DownloadTask_ {
  /// see [DownloadTask.id]
  static final id =
      QueryIntegerProperty<DownloadTask>(_entities[1].properties[0]);

  /// see [DownloadTask.progress]
  static final progress =
      QueryDoubleProperty<DownloadTask>(_entities[1].properties[1]);

  /// see [DownloadTask.track]
  static final track =
      QueryRelationProperty<DownloadTask, Track>(_entities[1].properties[2]);

  /// see [DownloadTask.status]
  static final status =
      QueryStringProperty<DownloadTask>(_entities[1].properties[3]);

  /// see [DownloadTask.path]
  static final path =
      QueryStringProperty<DownloadTask>(_entities[1].properties[4]);

  /// see [DownloadTask.url]
  static final url =
      QueryStringProperty<DownloadTask>(_entities[1].properties[5]);
}

/// [Track] entity fields to define ObjectBox queries.
class Track_ {
  /// see [Track.id]
  static final id = QueryIntegerProperty<Track>(_entities[2].properties[0]);

  /// see [Track.exId]
  static final exId = QueryStringProperty<Track>(_entities[2].properties[1]);

  /// see [Track.title]
  static final title = QueryStringProperty<Track>(_entities[2].properties[2]);

  /// see [Track.book]
  static final book =
      QueryRelationProperty<Track, Book>(_entities[2].properties[3]);

  /// see [Track.durationInMilliseconds]
  static final durationInMilliseconds =
      QueryIntegerProperty<Track>(_entities[2].properties[4]);
}
