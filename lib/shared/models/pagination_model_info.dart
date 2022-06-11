
import 'package:hive/hive.dart';

import '../repository/cache_repository.dart';

part 'pagination_model_info.g.dart';

@HiveType(typeId: CacheRepository.paginationModelInfoTypeId)
class PaginationModelInfo {
  @HiveField(0)
  final int       count;

  @HiveField(1)
  final int       pages;

  @HiveField(2)
  final String    next;

  @HiveField(3)
  final String    prev;

  PaginationModelInfo({
    this.count  = 0,
    this.pages  = 0,
    this.next   = "",
    this.prev   = "",
  });

  factory PaginationModelInfo.fromJson(Map<String, dynamic> json) {
    return PaginationModelInfo(
      count : json["count"] ?? 0,
      pages : json["pages"] ?? 0,
      next  : json["next"]  ?? "",
      prev  : json["prev"]  ?? "",
    );
  }
}
