import 'package:hive/hive.dart';
import 'package:rickandmorty/domain/models/list/character_model.dart';

import '../../../infrastructure/cache_repository.dart';

part 'episode_model.g.dart';

@HiveType(typeId: CacheRepository.episodeTypeId)
class Episode extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  late DateTime? airDate;

  @HiveField(3)
  final String episode;

  @HiveField(4)
  final List<Character> characters;

  @HiveField(5)
  late DateTime? created;

  Episode(
      {this.id = "",
      this.name = "",
      this.airDate,
      this.episode = "",
      this.characters = const [],
      this.created}) {
    created ??= DateTime.now();
    created ??= DateTime.now();
  }

  static DateTime _parseAirDateToDate(String _airDate) {
    var partialDate = _airDate.split(" ");
    int year = int.parse(partialDate[2]);
    int month = 0;
    int day = int.parse(partialDate[1].split(",")[0]);

    switch (partialDate[0].toLowerCase()) {
      case "january":
        month = DateTime.january;
        break;
      case "february":
        month = DateTime.february;
        break;
      case "march":
        month = DateTime.march;
        break;
      case "april":
        month = DateTime.april;
        break;
      case "may":
        month = DateTime.may;
        break;
      case "june":
        month = DateTime.june;
        break;
      case "july":
        month = DateTime.july;
        break;
      case "august":
        month = DateTime.august;
        break;
      case "september":
        month = DateTime.september;
        break;
      case "october":
        month = DateTime.october;
        break;
      case "november":
        month = DateTime.november;
        break;
      case "december":
        month = DateTime.december;
        break;
    }

    return DateTime(year, month, day);
  }

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        airDate: json["air_date"] != null
            ? _parseAirDateToDate(json["air_date"])
            : DateTime.now(),
        episode: json["episode"] ?? "",
        characters: json["characters"] != null
            ? (json["characters"] as List)
                .map((element) => Character.fromJson(element))
                .toList()
            : [],
        created: json["created"] != null
            ? DateTime.parse(json["created"])
            : DateTime.now());
  }
}
