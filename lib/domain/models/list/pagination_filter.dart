enum PaginationFilterStatus { none, alive, dead, unknown }

enum PaginationFilterGender { all, female, male, genderless, unknown }

class PaginationFilter {
  String name;
  PaginationFilterStatus status;
  PaginationFilterGender gender;

  PaginationFilter({
    this.name   = "",
    this.status = PaginationFilterStatus.none,
    this.gender = PaginationFilterGender.all,
  });

  factory PaginationFilter.fromJson(Map<String, dynamic> json) {
    return PaginationFilter(
        name    : json['name'] ?? "",
        status  : json["status"] != null
                  ? PaginationFilterStatus.values
                      .firstWhere((element) => element.name == json["status"])
                  : PaginationFilterStatus.none,
        gender  : json["gender"] != null
                  ? PaginationFilterGender.values
                      .firstWhere((element) => element.name == json["gender"])
                  : PaginationFilterGender.all);
  }

  Map<String, dynamic> toMap() {
    return {
      "name"  : name,
      "status": status.name,
      "gender": gender.name,
    };
  }
}
