import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_document_entity.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_stage_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'enquiry_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryDetailEntity
    extends BaseLayerDataTransformer<EnquiryDetailEntity, EnquiryDetail> {
  @JsonKey(name: 'enquiryNumber')
  String? enquiryNumber;
  @JsonKey(name: 'enquiryDate')
  String? enquiryDate;
  @JsonKey(name: 'enquiryType')
  String? enquiryType;
  @JsonKey(name: 'schoolLocation')
  String? schoolLocation;
  @JsonKey(name: 'studentFirstName')
  String? studentFirstName;
  @JsonKey(name: 'studentLastName')
  String? studentLastName;
  @JsonKey(name: 'grade')
  String? grade;
  @JsonKey(name: 'dob')
  String? dob;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'existingSchoolName')
  String? existingSchoolName;
  @JsonKey(name: 'existingSchoolBoard')
  String? existingSchoolBoard;
  @JsonKey(name: 'existingSchoolGrade')
  String? existingSchoolGrade;
  @JsonKey(name: 'parentType')
  String? parentType;
  @JsonKey(name: 'globalId')
  String? globalId;
  @JsonKey(name: 'parentFirstName')
  String? parentFirstName;
  @JsonKey(name: 'parentLastName')
  String? parentLastName;
  @JsonKey(name: 'parentEmail')
  String? parentEmail;
  @JsonKey(name: 'parentMobile')
  String? parentMobile;
  @JsonKey(name: 'enquiryDocuments')
  List<EnquiryDocumentEntity>? enquiryDocuments;
  @JsonKey(name: 'enquiry_stages')
  List<EnquiryStageDetailEntity>? enquiryStages;
  @JsonKey(name: 'eligibleGrade')
  String? eligibleGrade;
  @JsonKey(name: 'studentAadhaarNumber')
  String? studentAadhaarNumber;
  @JsonKey(name: 'placeOfBirth')
  String? placeOfBirth;
  @JsonKey(name: 'religion', fromJson: _fromJson)
  dynamic religion;
  @JsonKey(name: 'caste', fromJson: _fromJson)
  dynamic caste;
  @JsonKey(name: 'subCaste', fromJson: _fromJson)
  dynamic subCaste;
  @JsonKey(name: 'nationality', fromJson: _fromJson)
  dynamic nationality;
  @JsonKey(name: 'motherTongue', fromJson: _fromJson)
  dynamic motherTongue;
  @JsonKey(name: 'schoolId')
  int? schoolId;
  @JsonKey(name: 'boardId')
  int? boardId;
  @JsonKey(name: 'streamId')
  int? streamId;
  @JsonKey(name: 'academicYearId')
  int? academicYearId;
  @JsonKey(name: 'currentStage')
  String? currentStage;
  @JsonKey(name: 'board')
  String? boardName;
  @JsonKey(name: 'academicYear')
  String? academicYear;
  @JsonKey(name: 'gradeId')
  int? gradeId;
  @JsonKey(name: 'brandId')
  int? brandId;
  @JsonKey(name: "brand")
  String? brandName;
  @JsonKey(name: "course")
  String? courseName;
  @JsonKey(name: "courseId")
  int? courseId;
  @JsonKey(name: "shiftId")
  int? shiftId;

  EnquiryDetailEntity(
      {this.enquiryNumber,
      this.enquiryDate,
      this.enquiryType,
      this.schoolLocation,
      this.studentFirstName,
      this.studentLastName,
      this.grade,
      this.dob,
      this.gender,
      this.existingSchoolName,
      this.existingSchoolBoard,
      this.existingSchoolGrade,
      this.parentType,
      this.globalId,
      this.parentFirstName,
      this.parentLastName,
      this.parentEmail,
      this.parentMobile,
      this.enquiryDocuments,
      this.enquiryStages,
      this.eligibleGrade,
      this.studentAadhaarNumber,
      this.placeOfBirth,
      this.religion,
      this.caste,
      this.subCaste,
      this.nationality,
      this.motherTongue,
      this.schoolId,
      this.academicYearId,
      this.boardId,
      this.streamId,
      this.currentStage,
      this.academicYear,
      this.gradeId,
      this.brandId,
      this.brandName,
      this.courseId,
      this.courseName,
      this.shiftId});
  factory EnquiryDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryDetailEntityFromJson(json);

  static dynamic _fromJson(dynamic data) {
    if (data is Map<String, dynamic>) {
      return CommonDataEntity.fromJson(data);
    } else {
      return data;
    }
  }

  Map<String, dynamic> toJson() => _$EnquiryDetailEntityToJson(this);

  @override
  EnquiryDetail transform() {
    EnquiryDetail enquiryDetail = EnquiryDetail();
    enquiryDetail.enquiryNumber = enquiryNumber;
    enquiryDetail.enquiryDate = enquiryDate;
    enquiryDetail.enquiryType = enquiryType;
    enquiryDetail.schoolLocation = schoolLocation;
    enquiryDetail.studentFirstName = studentFirstName;
    enquiryDetail.studentLastName = studentLastName;
    enquiryDetail.grade = grade;
    enquiryDetail.dob = dob;
    enquiryDetail.gender = gender;
    enquiryDetail.existingSchoolName = existingSchoolName;
    enquiryDetail.existingSchoolBoard = existingSchoolBoard;
    enquiryDetail.existingSchoolGrade = existingSchoolGrade;
    enquiryDetail.parentType = parentType;
    enquiryDetail.globalId = globalId;
    enquiryDetail.parentFirstName = parentFirstName;
    enquiryDetail.parentLastName = parentLastName;
    enquiryDetail.parentEmail = parentEmail;
    enquiryDetail.parentMobile = parentMobile;
    enquiryDetail.enquiryDocuments =
        enquiryDocuments?.map((element) => element.transform()).toList();
    enquiryDetail.enquiryStage =
        enquiryStages?.map((element) => element.transform()).toList();
    enquiryDetail.eligibleGrade = eligibleGrade;
    enquiryDetail.studentAadhaarNumber = studentAadhaarNumber;
    enquiryDetail.placeOfBirth = placeOfBirth;
    enquiryDetail.religion =
        (religion is CommonDataEntity) ? religion?.transform() : religion ?? '';
    enquiryDetail.caste =
        (caste is CommonDataEntity) ? caste?.transform() : caste ?? '';
    enquiryDetail.subCaste =
        (subCaste is CommonDataEntity) ? subCaste?.transform() : subCaste ?? '';
    enquiryDetail.nationality = (nationality is CommonDataEntity)
        ? nationality?.transform()
        : nationality ?? '';
    enquiryDetail.motherTongue = (motherTongue is CommonDataEntity)
        ? motherTongue?.transform()
        : motherTongue ?? '';
    enquiryDetail.schoolId = schoolId;
    enquiryDetail.academicYearId = academicYearId;
    enquiryDetail.boardId = boardId;
    enquiryDetail.streamId = streamId;
    enquiryDetail.currentStage = currentStage;
    enquiryDetail.boardName = boardName;
    enquiryDetail.academicYear = academicYear;
    enquiryDetail.gradeId = gradeId;
    enquiryDetail.brandId = brandId;
    enquiryDetail.brandName = brandName;
    enquiryDetail.courseId = courseId;
    enquiryDetail.courseName = courseName;
    enquiryDetail.shiftId = shiftId;
    return enquiryDetail;
  }
}
