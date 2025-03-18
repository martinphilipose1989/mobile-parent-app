import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_enrolment_create.g.dart';

@JsonSerializable()
class NewEnrolmentCreateEntity
    implements
        BaseLayerDataTransformer<NewEnrolmentCreateEntity, NewEnrolmentCreate> {
  @JsonKey(name: "studentFees")
  List<StudentEnrolmentFeeEntity>? studentFees;

  NewEnrolmentCreateEntity({this.studentFees});

  factory NewEnrolmentCreateEntity.fromJson(Map<String, dynamic> json) =>
      _$NewEnrolmentCreateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewEnrolmentCreateEntityToJson(this);

  @override
  NewEnrolmentCreateEntity restore(NewEnrolmentCreate data) {
    return NewEnrolmentCreateEntity(
      studentFees: data.studentFees
          ?.map((e) => StudentEnrolmentFeeEntity().restore(e))
          .toList(),
    );
  }

  @override
  NewEnrolmentCreate transform() {
    return NewEnrolmentCreate(
      studentFees: studentFees?.map((e) => e.transform()).toList(),
    );
  }
}

@JsonSerializable()
class StudentEnrolmentFeeEntity
    implements
        BaseLayerDataTransformer<StudentEnrolmentFeeEntity,
            StudentEnrolmentFee> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "global_user_id")
  int? globalUserId;
  @JsonKey(name: "enquiry_id")
  String? enquiryId;
  @JsonKey(name: "enquiry_no")
  String? enquiryNo;
  @JsonKey(name: "lob_id")
  int? lobId;
  @JsonKey(name: "grade_id")
  int? gradeId;
  @JsonKey(name: "board_id")
  int? boardId;
  @JsonKey(name: "course_id")
  int? courseId;
  @JsonKey(name: "shift_id")
  dynamic shiftId;
  @JsonKey(name: "batch_id")
  dynamic batchId;
  @JsonKey(name: "stream_id")
  dynamic streamId;
  @JsonKey(name: "brand_id")
  dynamic brandId;
  @JsonKey(name: "school_parent_id")
  dynamic schoolId;
  @JsonKey(name: "host_school_id")
  dynamic hostSchoolId;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "fee_type")
  String? feeType;
  @JsonKey(name: "fee_sub_type_id")
  int? feeSubTypeId;
  @JsonKey(name: "fee_category_id")
  int? feeCategoryId;
  @JsonKey(name: "fee_subcategory_id")
  int? feeSubcategoryId;
  @JsonKey(name: "fee_subcategory_start")
  String? feeSubcategoryStart;
  @JsonKey(name: "fee_subcategory_end")
  String? feeSubcategoryEnd;
  @JsonKey(name: "period_of_service_id")
  int? periodOfServiceId;

  StudentEnrolmentFeeEntity({
    this.studentId,
    this.globalUserId,
    this.enquiryId,
    this.enquiryNo,
    this.lobId,
    this.gradeId,
    this.boardId,
    this.courseId,
    this.shiftId,
    this.batchId,
    this.streamId,
    this.brandId,
    this.schoolId,
    this.hostSchoolId,
    this.academicYearId,
    this.feeType,
    this.feeSubTypeId,
    this.feeCategoryId,
    this.feeSubcategoryId,
    this.feeSubcategoryStart,
    this.feeSubcategoryEnd,
    this.periodOfServiceId,
  });

  factory StudentEnrolmentFeeEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentEnrolmentFeeEntityFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (studentId != null && studentId != 0) data['student_id'] = studentId;
    if (globalUserId != null && globalUserId != 0) {
      data['global_user_id'] = globalUserId;
    }
    if (enquiryId != null) data['enquiry_id'] = enquiryId;
    if (enquiryNo != null) data['enquiry_no'] = enquiryNo;
    if (lobId != null && lobId != 0) data['lob_id'] = lobId;
    if (gradeId != null && gradeId != 0) data['grade_id'] = gradeId;
    if (boardId != null && boardId != 0) data['board_id'] = boardId;
    if (courseId != null && courseId != 0) data['course_id'] = courseId;
    if (shiftId != null) data['shift_id'] = shiftId;
    if (batchId != null) data['batch_id'] = batchId;
    if (streamId != null) data['stream_id'] = streamId;
    if (brandId != null) data['brand_id'] = brandId;
    if (schoolId != null) data['school_parent_id'] = schoolId;
    if (hostSchoolId != null) data['host_school_id'] = hostSchoolId;
    if (academicYearId != null && academicYearId != 0) {
      data['academic_year_id'] = academicYearId;
    }
    if (feeType != null) data['fee_type'] = feeType;
    if (feeSubTypeId != null && feeSubTypeId != 0) {
      data['fee_sub_type_id'] = feeSubTypeId;
    }
    if (feeCategoryId != null && feeCategoryId != 0) {
      data['fee_category_id'] = feeCategoryId;
    }
    if (feeSubcategoryId != null && feeSubcategoryId != 0) {
      data['fee_subcategory_id'] = feeSubcategoryId;
    }
    if (feeSubcategoryStart != null) {
      data['fee_subcategory_start'] = feeSubcategoryStart;
    }
    if (feeSubcategoryEnd != null) {
      data['fee_subcategory_end'] = feeSubcategoryEnd;
    }
    if (periodOfServiceId != null && periodOfServiceId != 0) {
      data['period_of_service_id'] = periodOfServiceId;
    }

    return data;
  }

  @override
  StudentEnrolmentFeeEntity restore(StudentEnrolmentFee data) {
    return StudentEnrolmentFeeEntity(
      academicYearId: data.academicYearId,
      batchId: data.batchId,
      boardId: data.boardId,
      brandId: data.brandId,
      courseId: data.courseId,
      enquiryId: data.enquiryId,
      enquiryNo: data.enquiryNo,
      feeCategoryId: data.feeCategoryId,
      feeSubcategoryId: data.feeSubcategoryId,
      feeSubcategoryEnd: data.feeSubcategoryEnd,
      feeSubcategoryStart: data.feeSubcategoryStart,
      feeSubTypeId: data.feeSubTypeId,
      feeType: data.feeType,
      globalUserId: data.globalUserId,
      gradeId: data.gradeId,
      hostSchoolId: data.hostSchoolId,
      lobId: data.lobId,
      periodOfServiceId: data.periodOfServiceId,
      schoolId: data.schoolId,
      shiftId: data.shiftId,
      streamId: data.streamId,
      studentId: data.studentId,
    );
  }

  @override
  StudentEnrolmentFee transform() {
    return StudentEnrolmentFee(
      academicYearId: academicYearId,
      batchId: batchId,
      boardId: boardId,
      brandId: brandId,
      courseId: courseId,
      enquiryId: enquiryId,
      enquiryNo: enquiryNo,
      feeCategoryId: feeCategoryId,
      feeSubcategoryId: feeSubcategoryId,
      feeSubcategoryEnd: feeSubcategoryEnd,
      feeSubcategoryStart: feeSubcategoryStart,
      feeSubTypeId: feeSubTypeId,
      feeType: feeType,
      globalUserId: globalUserId,
      gradeId: gradeId,
      hostSchoolId: hostSchoolId,
      lobId: lobId,
      periodOfServiceId: periodOfServiceId,
      schoolId: schoolId,
      shiftId: shiftId,
      streamId: streamId,
      studentId: studentId,
    );
  }
}
