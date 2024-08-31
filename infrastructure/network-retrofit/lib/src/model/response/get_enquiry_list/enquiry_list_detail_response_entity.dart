import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_list_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryListDetailResponseEntity extends BaseLayerDataTransformer <EnquiryListDetailResponseEntity,EnquiryListDetailModel>{
    @JsonKey(name: 'enquiryType')
    String? enquiryType;
    @JsonKey(name: 'enquiryId')
    String? enquiryId;
    @JsonKey(name: 'enquiryNumber')
    String? enquiryNumber;
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
    @JsonKey(name: 'enquiryStage')
    String? enquiryStage;
    @JsonKey(name: 'nextAction')
    String? nextAction;

    EnquiryListDetailResponseEntity({
        this.enquiryType,
        this.enquiryId,
        this.enquiryNumber,
        this.studentName,
        this.academicYear,
        this.school,
        this.board,
        this.grade,
        this.enquiryStage,
        this.nextAction,
    });  

  factory EnquiryListDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryListDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryListDetailResponseEntityToJson(this);

  @override
  EnquiryListDetailModel transform() {
    EnquiryListDetailModel enquiryListDetailModel = EnquiryListDetailModel();
    enquiryListDetailModel.enquiryType = enquiryType;
    enquiryListDetailModel.enquiryId = enquiryId;
    enquiryListDetailModel.enquiryNumber = enquiryNumber;
    enquiryListDetailModel.studentName = studentName;
    enquiryListDetailModel.academicYear = academicYear;
    enquiryListDetailModel.school = school;
    enquiryListDetailModel.board = board;
    enquiryListDetailModel.grade = grade;
    enquiryListDetailModel.enquiryStage = enquiryStage;
    enquiryListDetailModel.nextAction = nextAction;

    return enquiryListDetailModel;
  }
}