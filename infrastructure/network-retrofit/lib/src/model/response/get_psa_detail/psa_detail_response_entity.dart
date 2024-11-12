import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/academic_year_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/existing_school_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_contact_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_details_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/student_detail_entity.dart';

part 'psa_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PsaDetailResponseEntity
    implements BaseLayerDataTransformer<PsaDetailResponseEntity, PSADetail> {
  @JsonKey(name: 'enquiry_date')
  String? enquiryDate;
  @JsonKey(name: 'academic_year')
  AcademicYearEntity? academicYear;
  @JsonKey(name: 'school_location')
  CommonDataEntity? schoolLocation;
  @JsonKey(name: 'parent_details')
  ParentDetailsEntity? parentDetails;
  @JsonKey(name: 'existing_school_details')
  ExistingSchoolDetailsEntity? existingSchoolDetails;
  @JsonKey(name: 'enquirer_parent')
  String? enquirerParent;
  @JsonKey(name: 'student_details')
  StudentDetailsEntity? studentDetails;
  @JsonKey(name: 'psa_sub_type')
  CommonDataEntity? psaSubType;
  @JsonKey(name: 'psa_category')
  CommonDataEntity? psaCategory;
  @JsonKey(name: 'psa_sub_category')
  CommonDataEntity? psaSubCategory;
  @JsonKey(name: 'psa_period_of_service')
  CommonDataEntity? psaPeriodOfService;
  @JsonKey(name: 'psa_batch')
  CommonDataEntity? psaBatch;

  PsaDetailResponseEntity({
    this.enquiryDate,
    this.academicYear,
    this.schoolLocation,
    this.parentDetails,
    this.existingSchoolDetails,
    this.enquirerParent,
    this.studentDetails,
    this.psaSubType,
    this.psaCategory,
    this.psaSubCategory,
    this.psaPeriodOfService,
    this.psaBatch,
  });

  factory PsaDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PsaDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PsaDetailResponseEntityToJson(this);

  @override
  PSADetail transform() {
    PSADetail psaDetail = PSADetail();
    psaDetail.enquiryDate = enquiryDate;
    psaDetail.academicYear = academicYear?.transform();
    psaDetail.schoolLocation = schoolLocation?.transform();
    psaDetail.parentDetails = parentDetails?.transform();
    psaDetail.existingSchoolDetails = existingSchoolDetails?.transform();
    psaDetail.enquirerParent = enquirerParent;
    psaDetail.studentDetails = studentDetails?.transform();
    psaDetail.psaSubType = psaSubType?.transform();
    psaDetail.psaCategory = psaCategory?.transform();
    psaDetail.psaSubCategory = psaSubCategory?.transform();
    psaDetail.psaPeriodOfService = psaPeriodOfService?.transform();
    psaDetail.psaBatch = psaBatch?.transform();
    return psaDetail;
  }

  @override
  PsaDetailResponseEntity restore(PSADetail data) {
    return PsaDetailResponseEntity(
      academicYear: AcademicYearEntity(
          id: data.academicYear?.id, value: data.academicYear?.value),
      enquirerParent: data.enquirerParent,
      enquiryDate: data.enquiryDate,
      existingSchoolDetails: ExistingSchoolDetailsEntity(
        name: data.existingSchoolDetails?.name,
        board: CommonDataEntity(
            id: data.existingSchoolDetails?.board?.id,
            value: data.existingSchoolDetails?.board?.value),
        grade: CommonDataEntity(
            id: data.existingSchoolDetails?.grade?.id,
            value: data.existingSchoolDetails?.grade?.value),
      ),
      parentDetails: ParentDetailsEntity(
        fatherDetails: ParentContactDetailEntity(
          email: data.parentDetails?.fatherDetails?.email,
          firstName: data.parentDetails?.fatherDetails?.firstName,
          lastName: data.parentDetails?.fatherDetails?.lastName,
          mobile: data.parentDetails?.fatherDetails?.mobile,
          globalId: data.parentDetails?.fatherDetails?.globalId,
        ),
        motherDetails: ParentContactDetailEntity(
          email: data.parentDetails?.motherDetails?.email,
          firstName: data.parentDetails?.motherDetails?.firstName,
          lastName: data.parentDetails?.motherDetails?.lastName,
          mobile: data.parentDetails?.motherDetails?.mobile,
          globalId: data.parentDetails?.motherDetails?.globalId,
        ),
      ),
      psaBatch:
          CommonDataEntity(id: data.psaBatch?.id, value: data.psaBatch?.value),
      psaCategory: CommonDataEntity(
          id: data.psaCategory?.id, value: data.psaCategory?.value),
      psaPeriodOfService: CommonDataEntity(
          id: data.psaPeriodOfService?.id,
          value: data.psaPeriodOfService?.value),
      psaSubCategory: CommonDataEntity(
          id: data.psaSubCategory?.id, value: data.psaSubCategory?.value),
      psaSubType: CommonDataEntity(
          id: data.psaSubType?.id, value: data.psaSubType?.value),
      schoolLocation: CommonDataEntity(
          id: data.schoolLocation?.id, value: data.schoolLocation?.value),
      studentDetails: StudentDetailsEntity(
          aadhar: data.studentDetails?.aadhar,
          dob: data.studentDetails?.dob,
          eligibleGrade: data.studentDetails?.eligibleGrade,
          firstName: data.studentDetails?.firstName,
          lastName: data.studentDetails?.lastName,
          globalId: data.studentDetails?.globalId,
          placeOfBirth: data.studentDetails?.placeOfBirth,
          caste: CommonDataEntity(
              id: data.studentDetails?.caste?.id,
              value: data.studentDetails?.caste?.value),
          gender: CommonDataEntity(
              id: data.studentDetails?.gender?.id,
              value: data.studentDetails?.gender?.value),
          grade: CommonDataEntity(
              id: data.studentDetails?.grade?.id,
              value: data.studentDetails?.grade?.value),
          motherTongue: CommonDataEntity(
              id: data.studentDetails?.motherTongue?.id,
              value: data.studentDetails?.motherTongue?.value),
          nationality: CommonDataEntity(
              id: data.studentDetails?.nationality?.id,
              value: data.studentDetails?.nationality?.value),
          religion: CommonDataEntity(
              id: data.studentDetails?.religion?.id,
              value: data.studentDetails?.religion?.value),
          subCaste: CommonDataEntity(
              id: data.studentDetails?.subCaste?.id,
              value: data.studentDetails?.subCaste?.value)),
    );
  }
}
