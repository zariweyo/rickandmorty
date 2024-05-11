import 'package:hive/hive.dart';

import '../../../infrastructure/cache_repository.dart';

part 'pagination_model_info.g.dart';

@HiveType(typeId: CacheRepository.paginationModelInfoTypeId)
class PaginationModelInfo {
  @HiveField(0)
  final int count;

  @HiveField(1)
  final int pages;

  @HiveField(2)
  final int? next;

  @HiveField(3)
  final int? prev;

  PaginationModelInfo({
    this.count = 0,
    this.pages = 0,
    this.next = 0,
    this.prev = 0,
  });

  factory PaginationModelInfo.fromJson(Map<String, dynamic> json) {
    return PaginationModelInfo(
      count: json["count"] ?? 0,
      pages: json["pages"] ?? 0,
      next: json["next"] ?? 0,
      prev: json["prev"] ?? 0,
    );
  }
}
