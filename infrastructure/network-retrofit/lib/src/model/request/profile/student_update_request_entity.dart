import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'student_update_request_entity.g.dart';

@JsonSerializable()
class StudentEditRequestEntity implements BaseLayerDataTransformer<StudentEditRequestEntity,StudentEditRequestModel> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "student_profile")
  StudentProfileEntity? studentProfile;
  @JsonKey(name: "parent")
  List<ParentEntity>? parent;


  StudentEditRequestEntity({
    this.id,
    this.studentProfile,
    this.parent,

  });

  factory StudentEditRequestEntity.fromJson(Map<String, dynamic> json) => _$StudentEditRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentEditRequestEntityToJson(this);

  @override
  StudentEditRequestEntity restore( StudentEditRequestModel data) {
   return StudentEditRequestEntity(id: data.id,studentProfile: StudentProfileEntity().restore(data.studentProfile!) ,parent: data.parent?.map((e) => ParentEntity().restore(e)).toList() ?? [],);
  }

  @override
  transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}


@JsonSerializable()
class ParentEntity implements BaseLayerDataTransformer<ParentEntity,ParentModel> {
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

  ParentEntity({
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

  factory ParentEntity.fromJson(Map<String, dynamic> json) => _$ParentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentEntityToJson(this);

  @override
  ParentEntity restore(ParentModel data) {
  return ParentEntity(firstName: data.firstName,lastName: data.lastName,email: data.email,pincode: data.pincode,guardianRelationshipId: data.guardianRelationshipId);
  }

  @override
  ParentModel transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}


@JsonSerializable()
class StudentProfileEntity implements BaseLayerDataTransformer<StudentProfileEntity,StudentProfileModel>{

  @JsonKey(name: "medical_info")
  MedicalDataEntity? medicalInfo;

  StudentProfileEntity({

    this.medicalInfo,
  });

  factory StudentProfileEntity.fromJson(Map<String, dynamic> json) => _$StudentProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProfileEntityToJson(this);

  @override
  StudentProfileEntity restore(StudentProfileModel data) {
  return StudentProfileEntity(medicalInfo: medicalInfo);
  }

  @override
  StudentProfileModel transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}

@JsonSerializable()
class MedicalDataEntity implements BaseLayerDataTransformer<MedicalDataEntity,MedicalInfoModel>{
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

  MedicalDataEntity({
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

  factory MedicalDataEntity.fromJson(Map<String, dynamic> json) => _$MedicalDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalDataEntityToJson(this);

  @override
  MedicalDataEntity restore(MedicalInfoModel data) {
    // TODO: implement restore
    throw MedicalDataEntity(medicalHistoryDetails: data.medicalHistoryDetails,disablilityDetails: data.disablilityDetails,allergyDetails: data.allergyDetails,personalizedLearningNeedsDetails: data.personalizedLearningNeedsDetails);
  }

  @override
  MedicalInfoModel transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
