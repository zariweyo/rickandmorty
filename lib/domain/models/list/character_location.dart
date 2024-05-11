import 'package:hive/hive.dart';

import '../../../infrastructure/cache_repository.dart';

part 'character_location.g.dart';

@HiveType(typeId: CacheRepository.characterLocationTypeId)
class CharacterLocation extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  CharacterLocation({this.name = "", this.url = ""});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(name: json["name"] ?? "", url: json["url"] ?? "");
  }
}
