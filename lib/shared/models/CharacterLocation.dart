class CharacterLocation {
  final String name;
  final String url;

  const CharacterLocation({this.name = "", this.url = ""});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(name: json["name"] ?? "", url: json["url"] ?? "");
  }
}
