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
}