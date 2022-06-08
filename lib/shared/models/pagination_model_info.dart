class PaginationModelInfo {
  final int       count;
  final int       pages;
  final String    next;
  final String    prev;

  const PaginationModelInfo({
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
