import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:hive/hive.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 5)
class HiveUser {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String token;

  @HiveField(2)
  final String? libraryId;

  @HiveField(3)
  final String? serverId;

  @HiveField(4)
  final String? baseUrl;

  @HiveField(5)
  final String? _serverType;

  @HiveField(6)
  final bool isSelected;

  SERVER_TYPE get serverType => SERVER_TYPE.values.firstWhere(
        (servType) => servType.toString() == _serverType,
        orElse: () => SERVER_TYPE.UNKNOWN,
      );

  HiveUser({
    required this.id,
    required this.token,
    required serverType,
    required this.isSelected,
    this.serverId,
    this.libraryId,
    this.baseUrl,
  }) : _serverType = serverType;

  HiveUser copyWith({
    String? id,
    String? token,
    bool? isSelected,
    String? serverType,
    String? serverId,
    String? libraryId,
    String? baseUrl,
  }) =>
      HiveUser(
        id: id ?? this.id,
        token: token ?? this.token,
        isSelected: isSelected ?? this.isSelected,
        serverType: serverType ?? this.serverType,
        serverId: serverId ?? this.serverId,
        libraryId: libraryId ?? this.libraryId,
        baseUrl: baseUrl ?? this.baseUrl,
      );
}
