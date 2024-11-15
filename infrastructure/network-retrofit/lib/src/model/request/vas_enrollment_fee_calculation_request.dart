class VasEnrollmentFeeCalculationRequest {
  int? boardId;
  int? courseId;
  int? shiftId;
  int? streamId;
  int? gradeId;
  int? schoolId;
  int? batchId;
  int? feeTypeId;
  int? feeSubTypeId;
  int? feeCategoryId;
  int? feeSubcategoryId;
  int? periodOfServiceId;
  int? academicYearId;
  String? feeSubCategoryStart;
  String? feeSubCategoryEnd;

  VasEnrollmentFeeCalculationRequest(
      {this.boardId,
      this.courseId,
      this.shiftId,
      this.streamId,
      this.gradeId,
      this.schoolId,
      this.batchId,
      this.feeTypeId,
      this.feeSubTypeId,
      this.feeCategoryId,
      this.feeSubcategoryId,
      this.periodOfServiceId,
      this.academicYearId,
      this.feeSubCategoryStart,
      this.feeSubCategoryEnd});

  VasEnrollmentFeeCalculationRequest.fromJson(Map<String, dynamic> json) {
    boardId = json['board_id'];
    courseId = json['course_id'];
    shiftId = json['shift_id'];
    streamId = json['stream_id'];
    gradeId = json['grade_id'];
    schoolId = json['school_id'];
    batchId = json['batch_id'];
    feeTypeId = json['fee_type_id'];
    feeSubTypeId = json['fee_sub_type_id'];
    feeCategoryId = json['fee_category_id'];
    feeSubcategoryId = json['fee_subcategory_id'];
    periodOfServiceId = json['period_of_service_id'];
    academicYearId = json['academic_year_id'];
    feeSubCategoryStart = json['fee_subcategory_start'];
    feeSubCategoryEnd = json['fee_subcategory_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['board_id'] = boardId;
    data['course_id'] = courseId;
    data['shift_id'] = shiftId;
    data['stream_id'] = streamId;
    data['grade_id'] = gradeId;
    data['school_id'] = schoolId;
    data['batch_id'] = batchId;
    data['fee_type_id'] = feeTypeId;
    data['fee_sub_type_id'] = feeSubTypeId;
    data['fee_category_id'] = feeCategoryId;
    data['fee_subcategory_id'] = feeSubcategoryId;
    data['period_of_service_id'] = periodOfServiceId;
    data['academic_year_id'] = academicYearId;
    if (feeSubCategoryStart != null) {
      data['fee_subcategory_start'] = feeSubCategoryStart;
    }
    if (feeSubCategoryEnd != null) {
      data['fee_subcategory_end'] = feeSubCategoryEnd;
    }
    return data;
  }
}
