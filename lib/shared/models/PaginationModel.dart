
import 'package:rickandmorty/shared/models/DataModel.dart';

class PaginationModelInfo{
  final int count;
  final int pages;
  final String next;
  final String prev;

  const PaginationModelInfo({
    this.count = 0,
    this.pages = 0,
    this.next = "",
    this.prev = "",
  });

  factory PaginationModelInfo.fromJson(Map<String, dynamic> json) {
    return PaginationModelInfo(
      count: json["count"] ?? 0,
      pages: json["pages"] ?? 0,
      next: json["next"] ?? "",
      prev: json["prev"] ?? "",
    );
  }

}

enum PaginationFilterStatus {
  none, alive, dead, unknown
}

enum PaginationFilterGender {
  all, female, male, genderless, unknown
}

class PaginationFilter {
  String name;
  PaginationFilterStatus status;
  PaginationFilterGender gender;

  PaginationFilter({
    this.name = "",
    this.status = PaginationFilterStatus.none,
    this.gender = PaginationFilterGender.all,
  });

  factory PaginationFilter.fromJson(Map<String, dynamic> json) {
    return PaginationFilter(
      name: json['name'] ?? "",
      status: json["status"] !=null ? PaginationFilterStatus.values.firstWhere((element) => element.name == json["status"]) : PaginationFilterStatus.none,
      gender: json["gender"] !=null ? PaginationFilterGender.values.firstWhere((element) => element.name == json["gender"]) : PaginationFilterGender.all
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "status": status.name,
      "gender": gender.name,
    };
  }
}


class PaginationModel{
  PaginationModelInfo info;
  List<Character> results;

  PaginationModel({
    this.info = const PaginationModelInfo(),
    this.results = const []
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      info: json["info"] !=null ? PaginationModelInfo.fromJson(json["info"]): const PaginationModelInfo(),
      results: json["results"] !=null ? (json["results"] as List).map((e) => Character.fromJson(e)).toList(): []
    );
  }
}

