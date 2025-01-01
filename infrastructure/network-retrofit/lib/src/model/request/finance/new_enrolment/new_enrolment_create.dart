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
  @JsonKey(name: "school_id")
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

  Map<String, dynamic> toJson() => _$StudentEnrolmentFeeEntityToJson(this);

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
