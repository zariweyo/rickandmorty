import 'package:hive/hive.dart';
import 'package:rickandmorty/domain/models/list/episode_model.dart';

import '../../../infrastructure/cache_repository.dart';
import 'character_location.dart';

part 'character_model.g.dart';

@HiveType(typeId: CacheRepository.characterTypeId)
class Character extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final String image;

  @HiveField(7)
  final List<Episode> episode;

  @HiveField(8)
  final String url;

  @HiveField(9)
  late CharacterLocation? origin;

  @HiveField(10)
  late CharacterLocation? location;

  @HiveField(11)
  late DateTime? created;

  Character({
    this.id = "",
    this.name = "",
    this.status = "",
    this.species = "",
    this.type = "",
    this.gender = "",
    this.image = "",
    this.origin,
    this.location,
    this.episode = const [],
    this.url = "",
    this.created,
  }) {
    origin ??= CharacterLocation();
    location ??= CharacterLocation();
    created ??= DateTime.now();
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        status: json["status"] ?? "",
        species: json["species"] ?? "",
        type: json["type"] ?? "",
        gender: json["gender"] ?? "",
        origin: json["origin"] != null
            ? CharacterLocation.fromJson(json["origin"])
            : CharacterLocation(),
        location: json["location"] != null
            ? CharacterLocation.fromJson(json["location"])
            : CharacterLocation(),
        image: json["image"] ?? "",
        episode: json["episode"] != null
            ? (json["episode"] as List)
                .map((element) => Episode.fromJson(element))
                .toList()
            : [],
        url: json["url"] ?? "",
        created: json["created"] != null
            ? DateTime.parse(json["created"])
            : DateTime.now());
  }
}
