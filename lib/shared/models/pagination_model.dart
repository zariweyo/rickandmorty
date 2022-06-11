import 'package:hive/hive.dart';
import 'package:rickandmorty/shared/models/character_model.dart';

import '../repository/cache_repository.dart';
import 'pagination_model_info.dart';

part 'pagination_model.g.dart';

@HiveType(typeId: CacheRepository.paginationModelTypeId)
class PaginationModel {
  @HiveField(0)
  PaginationModelInfo?        info;

  @HiveField(1)
  List<Character>             results;

  PaginationModel({
      this.info, 
      this.results  = const []
  }){
    info ??= PaginationModelInfo();
  }

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
        info    : json["info"] != null
                    ? PaginationModelInfo.fromJson(json["info"])
                    : PaginationModelInfo(),
        results : json["results"] != null
                    ? (json["results"] as List)
                        .map((e) => Character.fromJson(e))
                        .toList()
                    : []
    );
  }
}
