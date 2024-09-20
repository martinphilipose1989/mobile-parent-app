class SubjectListingRequest {
  int? pageSize;
  int? schoolId;
  int? academicYearId;
  int? brandId;
  int? boardId;
  int? streamId;
  int? termId;

  SubjectListingRequest({
    this.pageSize,
    this.schoolId,
    this.academicYearId,
    this.brandId,
    this.boardId,
    this.streamId,
    this.termId,
  });

  factory SubjectListingRequest.fromJson(Map<String, dynamic> json) =>
      SubjectListingRequest(
        pageSize: json["pageSize"],
        schoolId: json["schoolId"],
        academicYearId: json["academicYearId"],
        brandId: json["brandId"],
        boardId: json["boardId"],
        streamId: json["streamId"],
        termId: json["termId"],
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "schoolId": schoolId,
        "academicYearId": academicYearId,
        "brandId": brandId,
        "boardId": boardId,
        "streamId": streamId,
        "termId": termId,
      };
}
