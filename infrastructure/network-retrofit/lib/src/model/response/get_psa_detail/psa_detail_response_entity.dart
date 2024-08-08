

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/academic_year_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/existing_school_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_details_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/student_detail_entity.dart';

part 'psa_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PsaDetailResponseEntity extends BaseLayerDataTransformer<PsaDetailResponseEntity,PSADetail>{
    @JsonKey(name: 'enquiryDate')
    String? enquiryDate;
    @JsonKey(name: 'academicYear')
    AcademicYearEntity? academicYear;
    @JsonKey(name: 'schoolLocation')
    CommonDataEntity? schoolLocation;
    @JsonKey(name: 'parentDetails')
    ParentDetailsEntity? parentDetails;
    @JsonKey(name: 'existingSchoolDetails')
    ExistingSchoolDetailsEntity? existingSchoolDetails;
    @JsonKey(name: 'studentDetails')
    StudentDetailsEntity? studentDetails;
    @JsonKey(name: 'psaSubType')
    CommonDataEntity? psaSubType;
    @JsonKey(name: 'psaCategory')
    CommonDataEntity? psaCategory;
    @JsonKey(name: 'psaSubCategory')
    CommonDataEntity? psaSubCategory;
    @JsonKey(name: 'psaPeriodOfService')
    CommonDataEntity? psaPeriodOfService;
    @JsonKey(name: 'psaBatch')
    CommonDataEntity? psaBatch;

    PsaDetailResponseEntity({
      this.enquiryDate,
      this.academicYear,
      this.schoolLocation,
      this.parentDetails,
      this.existingSchoolDetails,
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
    psaDetail.studentDetails = studentDetails?.transform();
    psaDetail.psaSubType = psaSubType?.transform();
    psaDetail.psaCategory = psaCategory?.transform();
    psaDetail.psaSubCategory = psaSubCategory?.transform();
    psaDetail.psaPeriodOfService = psaPeriodOfService?.transform();
    psaDetail.psaBatch = psaBatch?.transform();
    return psaDetail;
  }
}