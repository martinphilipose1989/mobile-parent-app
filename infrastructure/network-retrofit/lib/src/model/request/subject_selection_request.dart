class SubjectSelectionRequest {
  int? id;
  int? schoolId;
  dynamic schoolBrandId;
  int? subjectId;
  int? isCompulsory;
  dynamic isOptionalCompulsory;
  dynamic orderNo;
  int? academicYearId;
  dynamic statusId;
  String? schoolName;
  dynamic subjectName;
  String? acYear;

  SubjectSelectionRequest({
    this.id,
    this.schoolId,
    this.schoolBrandId,
    this.subjectId,
    this.isCompulsory,
    this.isOptionalCompulsory,
    this.orderNo,
    this.academicYearId,
    this.statusId,
    this.schoolName,
    this.subjectName,
    this.acYear,
  });

  factory SubjectSelectionRequest.fromJson(Map<String, dynamic> json) => SubjectSelectionRequest(
    id: json["id"],
    schoolId: json["school_id"],
    schoolBrandId: json["school_brand_id"],
    subjectId: json["subject_id"],
    isCompulsory: json["is_compulsory"],
    isOptionalCompulsory: json["is_optional_compulsory"],
    orderNo: json["order_no"],
    academicYearId: json["academic_year_id"],
    statusId: json["status_id"],
    schoolName: json["school_name"],
    subjectName: json["subject_name"],
    acYear: json["ac_year"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "school_id": schoolId,
    "school_brand_id": schoolBrandId,
    "subject_id": subjectId,
    "is_compulsory": isCompulsory,
    "is_optional_compulsory": isOptionalCompulsory,
    "order_no": orderNo,
    "academic_year_id": academicYearId,
    "status_id": statusId,
    "school_name": schoolName,
    "subject_name": subjectName,
    "ac_year": acYear,
  };
}