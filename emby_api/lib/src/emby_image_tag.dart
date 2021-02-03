class EmbyImageTag {
  EmbyImageTag({
    this.primary,
  });

  String primary;

  factory EmbyImageTag.fromJson(Map<String, dynamic> json) => EmbyImageTag(
        primary: json["Primary"],
      );

  Map<String, dynamic> toJson() => {
        "Primary": primary,
      };
}
