import 'package:rickandmorty/shared/models/Character.dart';

import 'PaginationModelInfo.dart';

class PaginationModel {
  PaginationModelInfo info;
  List<Character> results;

  PaginationModel(
      {this.info = const PaginationModelInfo(), this.results = const []});

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
        info: json["info"] != null
            ? PaginationModelInfo.fromJson(json["info"])
            : const PaginationModelInfo(),
        results: json["results"] != null
            ? (json["results"] as List)
                .map((e) => Character.fromJson(e))
                .toList()
            : []);
  }
}
