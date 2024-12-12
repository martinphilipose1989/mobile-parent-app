class VasDetailRequest {
  int? schoolId;
  int? boardId;
  int? gradeId;
  int? streamId;
  int? courseId;
  int? academicYearId;

  VasDetailRequest({
    this.schoolId,
    this.boardId,
    this.gradeId,
    this.streamId,
    this.courseId,
    this.academicYearId,
  });


  factory VasDetailRequest.fromJson(Map<String, dynamic> json) =>
      VasDetailRequest(
        schoolId: json["school_id"],
        boardId: json["board_id"],
        gradeId: json["grade_id"],
        streamId: json["stream_id"],
        courseId: json["course_id"],
        academicYearId: json["academic_year_id"],
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "board_id": boardId,
        "grade_id": gradeId,
        "stream_id": streamId,
        "course_id": courseId,
        "academic_year_id": academicYearId,
      };
}
