class EmbyUserData {
  EmbyUserData({
    this.playbackPositionTicks,
    this.playCount,
    this.isFavorite,
    this.lastPlayedDate,
    this.played,
  });

  int playbackPositionTicks;
  int playCount;
  bool isFavorite;
  DateTime lastPlayedDate;
  bool played;

  factory EmbyUserData.fromJson(Map<String, dynamic> json) => EmbyUserData(
        playbackPositionTicks: json["PlaybackPositionTicks"],
        playCount: json["PlayCount"],
        isFavorite: json["IsFavorite"],
        lastPlayedDate: json["LastPlayedDate"] != null
            ? DateTime.parse(json["LastPlayedDate"])
            : null,
        played: json["Played"],
      );

  Map<String, dynamic> toJson() => {
        "PlaybackPositionTicks": playbackPositionTicks,
        "PlayCount": playCount,
        "IsFavorite": isFavorite,
        "LastPlayedDate": lastPlayedDate?.toIso8601String(),
        "Played": played,
      };
}
