import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admission_list_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AdmissionListDetailResponseEntity extends BaseLayerDataTransformer <AdmissionListDetailResponseEntity,AdmissionListDetailModel>{
    @JsonKey(name: 'enquiryType')
    String? enquiryType;
    @JsonKey(name: 'enquiryId')
    String? enquiryId;
    @JsonKey(name: 'studentName')
    String? studentName;
    @JsonKey(name: 'academicYear')
    String? academicYear;
    @JsonKey(name: 'school')
    String? school;
    @JsonKey(name: 'board')
    String? board;
    @JsonKey(name: 'grade')
    String? grade;
    @JsonKey(name: 'enquiryNumber')
    String? enquiryNumber;
    @JsonKey(name: 'currentStage')
    String? currentStage;
    @JsonKey(name: 'schoolVisitDate')
    String? schoolVisitDate;
    @JsonKey(name: 'schoolVisitTime')
    String? schoolVisitTime;
    @JsonKey(name: 'formCompletionPercentage')
    int? formCompletionPercentage;

    AdmissionListDetailResponseEntity({
        this.enquiryType,
        this.enquiryId,
        this.studentName,
        this.academicYear,
        this.school,
        this.board,
        this.grade,
        this.enquiryNumber,
        this.currentStage,
        this.schoolVisitDate,
        this.schoolVisitTime,
        this.formCompletionPercentage,
    });

  factory AdmissionListDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionListDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionListDetailResponseEntityToJson(this);

  @override
  AdmissionListDetailModel transform() {
    AdmissionListDetailModel admissionListDetailModel = AdmissionListDetailModel();
    admissionListDetailModel.enquiryType = enquiryType;
    admissionListDetailModel.enquiryId = enquiryId;
    admissionListDetailModel.studentName = studentName;
    admissionListDetailModel.academicYear = academicYear;
    admissionListDetailModel.school = school;
    admissionListDetailModel.board = board;
    admissionListDetailModel.grade = grade;
    admissionListDetailModel.currentStage = currentStage;
    admissionListDetailModel.schoolVisitDate = schoolVisitDate;
    admissionListDetailModel.schoolVisitTime = schoolVisitTime;
    admissionListDetailModel.formCompletionPercentage = formCompletionPercentage;

    return admissionListDetailModel;
  }
}