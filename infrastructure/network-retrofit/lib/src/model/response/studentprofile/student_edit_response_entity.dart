import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'student_edit_response_entity.g.dart';
@JsonSerializable()
class StudentEditResponseEntity implements BaseLayerDataTransformer<StudentEditResponseEntity,StudentEditResponseModel>{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "student_profile")
  StudentProfileEntity? studentProfile;
  @JsonKey(name: "parent")
  List<Parent>? parent;



  StudentEditResponseEntity({
    this.id,
    this.studentProfile,
    this.parent,

  });

  factory StudentEditResponseEntity.fromJson(Map<String, dynamic> json) => _$StudentEditResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentEditResponseEntityToJson(this);

  @override
  StudentEditResponseEntity restore(StudentEditResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentEditResponseModel transform() {
   return StudentEditResponseModel(id: id,studentProfile: studentProfile?.transform(),parent: parent?.map((e)=>Parentdata(firstName: e.firstName,lastName: e.lastName,email: e.email,pincode: e.pincode)).toList());
  }
}



@JsonSerializable()
class Parent {
  @JsonKey(name: "guardian_id")
  int? guardianId;
  @JsonKey(name: "city_id")
  int? cityId;
  @JsonKey(name: "state_id")
  int? stateId;
  @JsonKey(name: "country_id")
  int? countryId;
  @JsonKey(name: "address_tag")
  String? addressTag;
  @JsonKey(name: "address_type")
  String? addressType;
  @JsonKey(name: "global_no")
  String? globalNo;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "adhar_no")
  String? adharNo;
  @JsonKey(name: "pan_no")
  String? panNo;
  @JsonKey(name: "qualification_id")
  int? qualificationId;
  @JsonKey(name: "occupation_id")
  int? occupationId;
  @JsonKey(name: "organization_id")
  int? organizationId;
  @JsonKey(name: "designation_id")
  int? designationId;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "pincode")
  String? pincode;
  @JsonKey(name: "mobile_no")
  String? mobileNo;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "is_preferred_email")
  int? isPreferredEmail;
  @JsonKey(name: "is_preferred_mobile_no")
  int? isPreferredMobileNo;
  @JsonKey(name: "set_as_emergency_contact")
  int? setAsEmergencyContact;
  @JsonKey(name: "user_type")
  int? userType;
  @JsonKey(name: "application_id")
  int? applicationId;
  @JsonKey(name: "service_id")
  int? serviceId;
  @JsonKey(name: "guardian_relationship_id")
  int? guardianRelationshipId;

  Parent({
    this.guardianId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.addressTag,
    this.addressType,
    this.globalNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.adharNo,
    this.panNo,
    this.qualificationId,
    this.occupationId,
    this.organizationId,
    this.designationId,
    this.address,
    this.area,
    this.pincode,
    this.mobileNo,
    this.email,
    this.isPreferredEmail,
    this.isPreferredMobileNo,
    this.setAsEmergencyContact,
    this.userType,
    this.applicationId,
    this.serviceId,
    this.guardianRelationshipId,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}

@JsonSerializable()
class ResidentialInfo {
  @JsonKey(name: "address_tag")
  List<String>? addressTag;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "house_building_no")
  String? houseBuildingNo;
  @JsonKey(name: "street_name")
  String? streetName;
  @JsonKey(name: "landmark")
  String? landmark;
  @JsonKey(name: "city_id")
  int? cityId;
  @JsonKey(name: "state_id")
  int? stateId;
  @JsonKey(name: "country_id")
  int? countryId;
  @JsonKey(name: "pincode")
  int? pincode;

  ResidentialInfo({
    this.addressTag,
    this.type,
    this.userId,
    this.houseBuildingNo,
    this.streetName,
    this.landmark,
    this.cityId,
    this.stateId,
    this.countryId,
    this.pincode,
  });

  factory ResidentialInfo.fromJson(Map<String, dynamic> json) => _$ResidentialInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentialInfoToJson(this);
}



@JsonSerializable()
class StudentProfileEntity implements BaseLayerDataTransformer<StudentProfileEntity,StudentProfileData>{
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "gender_id")
  int? genderId;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "birth_place")
  String? birthPlace;
  @JsonKey(name: "natinality_id")
  int? natinalityId;
  @JsonKey(name: "religion_id")
  int? religionId;
  @JsonKey(name: "caste_id")
  int? casteId;
  @JsonKey(name: "sub_caste_id")
  int? subCasteId;
  @JsonKey(name: "mother_tongue_id")
  int? motherTongueId;
  @JsonKey(name: "emergency_contact_no")
  int? emergencyContactNo;
  @JsonKey(name: "is_parents_seperated")
  int? isParentsSeperated;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "crt_board_id")
  int? crtBoardId;
  @JsonKey(name: "crt_grade_id")
  int? crtGradeId;
  @JsonKey(name: "crt_div_id")
  int? crtDivId;
  @JsonKey(name: "crt_shift_id")
  int? crtShiftId;
  @JsonKey(name: "crt_school_id")
  int? crtSchoolId;
  @JsonKey(name: "crt_house_id")
  int? crtHouseId;
  @JsonKey(name: "crt_brand_id")
  int? crtBrandId;
  @JsonKey(name: "crt_course_id")
  int? crtCourseId;
  @JsonKey(name: "crt_lob_id")
  int? crtLobId;
  @JsonKey(name: "enquiry_id")
  String? enquiryId;
  @JsonKey(name: "competency_test_attended")
  bool? competencyTestAttended;
  @JsonKey(name: "competency_test_mode")
  bool? competencyTestMode;
  @JsonKey(name: "competency_test_result")
  String? competencyTestResult;
  @JsonKey(name: "competency_test_status")
  bool? competencyTestStatus;
  @JsonKey(name: "reconsideration_cycle_date")
  String? reconsiderationCycleDate;
  @JsonKey(name: "admission_offered_date")
  String? admissionOfferedDate;
  @JsonKey(name: "medical_info")
  MedicalInfo? medicalInfo;

  StudentProfileEntity({
    this.firstName,
    this.middleName,
    this.lastName,
    this.genderId,
    this.dob,
    this.birthPlace,
    this.natinalityId,
    this.religionId,
    this.casteId,
    this.subCasteId,
    this.motherTongueId,
    this.emergencyContactNo,
    this.isParentsSeperated,
    this.profileImage,
    this.crtBoardId,
    this.crtGradeId,
    this.crtDivId,
    this.crtShiftId,
    this.crtSchoolId,
    this.crtHouseId,
    this.crtBrandId,
    this.crtCourseId,
    this.crtLobId,
    this.enquiryId,
    this.competencyTestAttended,
    this.competencyTestMode,
    this.competencyTestResult,
    this.competencyTestStatus,
    this.reconsiderationCycleDate,
    this.admissionOfferedDate,
    this.medicalInfo,
  });

  factory StudentProfileEntity.fromJson(Map<String, dynamic> json) => _$StudentProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProfileEntityToJson(this);

  @override
  StudentProfileEntity restore(StudentProfileData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentProfileData transform() {
  return StudentProfileData();
  }
}

@JsonSerializable()
class MedicalInfo {
  @JsonKey(name: "past_hospitalization")
  bool? pastHospitalization;
  @JsonKey(name: "last_hospitalization_year")
  int? lastHospitalizationYear;
  @JsonKey(name: "reason_for_hospitalization")
  String? reasonForHospitalization;
  @JsonKey(name: "is_phsically_disabled")
  bool? isPhsicallyDisabled;
  @JsonKey(name: "disablility_details")
  String? disablilityDetails;
  @JsonKey(name: "has_medical_history")
  bool? hasMedicalHistory;
  @JsonKey(name: "medical_history_details")
  String? medicalHistoryDetails;
  @JsonKey(name: "has_allergy")
  bool? hasAllergy;
  @JsonKey(name: "allergy_details")
  String? allergyDetails;
  @JsonKey(name: "has_personalized_learning_needs")
  bool? hasPersonalizedLearningNeeds;
  @JsonKey(name: "personalized_learning_needs_details")
  String? personalizedLearningNeedsDetails;
  @JsonKey(name: "blood_group_id")
  int? bloodGroupId;

  MedicalInfo({
    this.pastHospitalization,
    this.lastHospitalizationYear,
    this.reasonForHospitalization,
    this.isPhsicallyDisabled,
    this.disablilityDetails,
    this.hasMedicalHistory,
    this.medicalHistoryDetails,
    this.hasAllergy,
    this.allergyDetails,
    this.hasPersonalizedLearningNeeds,
    this.personalizedLearningNeedsDetails,
    this.bloodGroupId,
  });

  factory MedicalInfo.fromJson(Map<String, dynamic> json) => _$MedicalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInfoToJson(this);
}
