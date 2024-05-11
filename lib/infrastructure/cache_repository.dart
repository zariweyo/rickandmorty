import 'package:hive_flutter/hive_flutter.dart';
import 'package:rickandmorty/domain/models/list/character_location.dart';
import 'package:rickandmorty/domain/models/list/character_model.dart';
import 'package:rickandmorty/domain/models/list/episode_model.dart';
import 'package:rickandmorty/domain/models/list/pagination_model.dart';
import 'package:rickandmorty/domain/models/list/pagination_model_info.dart';

class CacheRepository {
  static const int characterTypeId = 0;
  static const int characterLocationTypeId = 1;
  static const int paginationModelTypeId = 2;
  static const int paginationModelInfoTypeId = 3;
  static const int episodeTypeId = 4;

  final String boxName = "PaginationModelCacheBoxv3";
  late Box<PaginationModel> box;

  CacheRepository() {
    Hive.initFlutter().then((value) {
      Hive.registerAdapter(PaginationModelAdapter());
      Hive.registerAdapter(PaginationModelInfoAdapter());
      Hive.registerAdapter(CharacterAdapter());
      Hive.registerAdapter(CharacterLocationAdapter());
      Hive.registerAdapter(EpisodeAdapter());

      Hive.openBox<PaginationModel>(boxName).then((boxOppened) {
        box = boxOppened;
      });
    });
  }

  saveQueryCache(String query, PaginationModel paginationModel) {
    box.put(query, paginationModel);
  }

  PaginationModel? getQueryCache(String id) {
    if (box.containsKey(id)) {
      return box.get(id)!;
    }
    return null;
  }
}
