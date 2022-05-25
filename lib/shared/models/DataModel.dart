
class CharacterLocation {
  final String name;
  final String url;

  const CharacterLocation({
    this.name = "",
    this.url = "",
  });

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
    );
  }
}

class Character{
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<String> episode;
  final String url;
  final CharacterLocation origin;
  final CharacterLocation location;
  late final DateTime created;

  Character({
    this.id = 0,
    this.name = "",
    this.status = "",
    this.species = "",
    this.type = "",
    this.gender = "",
    this.image = "",
    this.origin = const CharacterLocation(),
    this.location = const CharacterLocation(),
    this.episode = const [],
    this.url = "",
    DateTime? created,
  }): created = created ?? DateTime.now();

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      status: json["status"] ?? "",
      species: json["species"] ?? "",
      type: json["type"] ?? "",
      gender: json["gender"] ?? "",
      origin: json["origin"] != null ? CharacterLocation.fromJson(json["origin"]) : const CharacterLocation(),
      location: json["location"] != null ? CharacterLocation.fromJson(json["location"]) : const CharacterLocation(),
      image: json["image"] ?? "",
      episode: json["episode"] != null? (json["episode"] as List).map((element) => element as String).toList() : [],
      url: json["url"] ?? "",
      created: json["created"] != null ? DateTime.parse(json["created"]) : DateTime.now()
    );
  }
}

