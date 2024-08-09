import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_document_entity.dart';

part 'enquiry_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryDetailEntity extends BaseLayerDataTransformer<EnquiryDetailEntity, EnquiryDetail> {
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
    @JsonKey(name: 'eligibleGrade')
    String? eligibleGrade;
    @JsonKey(name: 'studentAadhaarNumber')
    String? studentAadhaarNumber;
    @JsonKey(name: 'placeOfBirth')
    String? placeOfBirth;
    @JsonKey(name: 'religion')
    String? religion;
    @JsonKey(name: 'caste')
    String? caste;
    @JsonKey(name: 'subCaste')
    String? subCaste;
    @JsonKey(name: 'nationality')
    String? nationality;
    @JsonKey(name: 'motherTongue')
    String? motherTongue;

    EnquiryDetailEntity({
        this.enquiryNumber,
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
        this.eligibleGrade,
        this.studentAadhaarNumber,
        this.placeOfBirth,
        this.religion,
        this.caste,
        this.subCaste,
        this.nationality,
        this.motherTongue,
    });
  factory EnquiryDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryDetailEntityToJson(this);

  @override
  EnquiryDetail transform() {
    EnquiryDetail enquiryDetail = transform();
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
    enquiryDetail.enquiryDocuments = enquiryDocuments?.map((element)=> element.transform()).toList();
    enquiryDetail.eligibleGrade = eligibleGrade;
    enquiryDetail.studentAadhaarNumber = studentAadhaarNumber;
    enquiryDetail.placeOfBirth = placeOfBirth;
    enquiryDetail.religion = religion;
    enquiryDetail.caste = caste;
    enquiryDetail.subCaste = subCaste;
    enquiryDetail.nationality = nationality;
    enquiryDetail.motherTongue = motherTongue;
    return enquiryDetail;
  }

}