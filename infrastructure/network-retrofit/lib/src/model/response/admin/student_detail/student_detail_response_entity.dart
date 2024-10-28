import 'package:data/data.dart';

import '../../../../../network_retrofit.dart';
part 'student_detail_response_entity.g.dart';
@JsonSerializable()
class StudentDetailsResponseEntity implements BaseLayerDataTransformer<StudentDetailsResponseEntity,StudentDetailsResponseModel>{
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  StudentDataEntity? data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  StudentDetailsResponseEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory StudentDetailsResponseEntity.fromJson(Map<String, dynamic> json) => _$StudentDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsResponseEntityToJson(this);

  @override
  StudentDetailsResponseEntity restore(StudentDetailsResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentDetailsResponseModel transform() {
return StudentDetailsResponseModel(status: status, data: data?.transform(), message: message, success: success);
  }
}

@JsonSerializable()
class StudentDataEntity implements BaseLayerDataTransformer<StudentDataEntity,StudentData>{
  @JsonKey(name: "profile")
  ProfileEntity? profile;
  @JsonKey(name: "parent")
  List<ParentEntity>? parent;
  @JsonKey(name: "siblingsInfo")
  List<SiblingsInfoEntity>? siblingsInfo;
  @JsonKey(name: "contact_info")
  ContactInfoEntity? contactInfo;
  @JsonKey(name: "guardian_contact_info")
  List<GuardianContactInfoEntity>? guardianContactInfo;
  @JsonKey(name: "medical_info")
  MedicalInfoEntity? medicalInfo;
  @JsonKey(name: "document_info")
  List<dynamic>? documentInfo;
  @JsonKey(name: "academics")
  AcademicsEntity? academics;

  StudentDataEntity ({
    required this.profile,
    required this.parent,
    required this.siblingsInfo,
    required this.contactInfo,
    required this.guardianContactInfo,
    required this.medicalInfo,
    required this.documentInfo,
    required this.academics,
  });

  factory StudentDataEntity.fromJson(Map<String, dynamic> json) => _$StudentDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDataEntityToJson(this);

  @override
  StudentDataEntity restore(StudentData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentData transform() {
  return StudentData(profile: profile?.transform(), parent: parent?.map((e)=>e.transform()).toList(),
      siblingsInfo: siblingsInfo?.map((e)=>e.transform()).toList(), contactInfo: contactInfo?.transform(),
      guardianContactInfo: guardianContactInfo?.map((e)=>e.transform()).toList(),
      medicalInfo: medicalInfo?.transform(), documentInfo: documentInfo,
      academics: academics?.transform());
  }
}

@JsonSerializable()
class AcademicsEntity implements BaseLayerDataTransformer<AcademicsEntity ,Academics> {
  @JsonKey(name: "house_allocation_name")
  String? houseAllocationName;
  @JsonKey(name: "division_allocation_name")
  String? divisionAllocationName;
  @JsonKey(name: "crt_house_id")
  int? crtHouseId;
  @JsonKey(name: "crt_div_id")
  int? crtDivId;

  AcademicsEntity({
    required this.houseAllocationName,
    required this.divisionAllocationName,
    required this.crtHouseId,
    required this.crtDivId,
  });

  factory AcademicsEntity.fromJson(Map<String, dynamic> json) => _$AcademicsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicsEntityToJson(this);

  @override
  AcademicsEntity restore(Academics data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Academics transform() {
 return Academics(houseAllocationName: houseAllocationName,
     divisionAllocationName: divisionAllocationName,
     crtHouseId: crtHouseId, crtDivId: crtDivId);
  }
}

@JsonSerializable()
class ContactInfoEntity implements BaseLayerDataTransformer<ContactInfoEntity ,ContactInfo>{
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "emergency_contact")
  String? emergencyContact;
  @JsonKey(name: "residential_information")
  List<ResidentialInformationEntity>? residentialInformation;
  ContactInfoEntity({
    required this.address,
    required this.emergencyContact,
    required this.residentialInformation,
  });

  factory ContactInfoEntity.fromJson(Map<String, dynamic> json) => _$ContactInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoEntityToJson(this);

  @override
  ContactInfoEntity restore(ContactInfo data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  ContactInfo transform() {
return ContactInfo(address: address, emergencyContact:
emergencyContact, residentialInformation: residentialInformation?.map((e)=>e.transform()).toList());
  }
}

@JsonSerializable()
class ResidentialInformationEntity implements BaseLayerDataTransformer<ResidentialInformationEntity,ResidentialInformation> {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "house_building_no")
  dynamic houseBuildingNo;
  @JsonKey(name: "street_name")
  dynamic streetName;
  @JsonKey(name: "landmark")
  dynamic landmark;
  @JsonKey(name: "city_id")
  int cityId;
  @JsonKey(name: "state_id")
  int stateId;
  @JsonKey(name: "country_id")
  int countryId;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "pincode")
  int pincode;
  @JsonKey(name: "address_id")
  dynamic addressId;
  @JsonKey(name: "tag_id")
  dynamic tagId;

  ResidentialInformationEntity({
    required this.id,
    required this.type,
    required this.userId,
    required this.houseBuildingNo,
    required this.streetName,
    required this.landmark,
    required this.cityId,
    required this.stateId,
    required this.countryId,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.addressId,
    required this.tagId,
  });

  factory ResidentialInformationEntity.fromJson(Map<String, dynamic> json) => _$ResidentialInformationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentialInformationEntityToJson(this);

  @override
  ResidentialInformationEntity restore(ResidentialInformation data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  ResidentialInformation transform() {
   return ResidentialInformation(id: id, type: type, userId: userId, houseBuildingNo: houseBuildingNo, streetName: streetName, landmark: landmark, cityId: cityId,
       stateId: stateId, countryId: countryId, city: city,
       state: state, country: country, pincode: pincode,
       addressId: addressId, tagId: tagId);
  }
}

@JsonSerializable()
class GuardianContactInfoEntity implements BaseLayerDataTransformer<GuardianContactInfoEntity,GuardianContactInfo> {
  @JsonKey(name: "relation")
  String relation;
  @JsonKey(name: "guardian_relationship_id")
  int guardianRelationshipId;
  @JsonKey(name: "guardian_id")
  int guardianId;
  @JsonKey(name: "preferred_mobile_no")
  dynamic preferredMobileNo;
  @JsonKey(name: "preferred_email_no")
  dynamic preferredEmailNo;

  GuardianContactInfoEntity({
    required this.relation,
    required this.guardianRelationshipId,
    required this.guardianId,
    required this.preferredMobileNo,
    required this.preferredEmailNo,
  });

  factory GuardianContactInfoEntity.fromJson(Map<String, dynamic> json) => _$GuardianContactInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuardianContactInfoEntityToJson(this);

  @override
  GuardianContactInfoEntity restore(GuardianContactInfo data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  GuardianContactInfo transform() {
   return GuardianContactInfo(relation: relation, guardianRelationshipId: guardianRelationshipId, guardianId: guardianId, preferredMobileNo: preferredMobileNo,
       preferredEmailNo: preferredEmailNo);
  }
}

@JsonSerializable()
class MedicalInfoEntity implements BaseLayerDataTransformer<MedicalInfoEntity,MedicalInfo>{
  @JsonKey(name: "past_hospitalization")
  String pastHospitalization;
  @JsonKey(name: "last_hospitalization_year")
  String lastHospitalizationYear;
  @JsonKey(name: "reason_for_hospitalization")
  String reasonForHospitalization;
  @JsonKey(name: "is_phsically_disabled")
  String isPhsicallyDisabled;
  @JsonKey(name: "disablility_details")
  String disablilityDetails;
  @JsonKey(name: "has_medical_history")
  String hasMedicalHistory;
  @JsonKey(name: "medical_history_details")
  String medicalHistoryDetails;
  @JsonKey(name: "has_allergy")
  String hasAllergy;
  @JsonKey(name: "allergy_details")
  String allergyDetails;
  @JsonKey(name: "has_personalized_learning_needs")
  String hasPersonalizedLearningNeeds;
  @JsonKey(name: "personalized_learning_needs_details")
  String personalizedLearningNeedsDetails;

  MedicalInfoEntity({
    required this.pastHospitalization,
    required this.lastHospitalizationYear,
    required this.reasonForHospitalization,
    required this.isPhsicallyDisabled,
    required this.disablilityDetails,
    required this.hasMedicalHistory,
    required this.medicalHistoryDetails,
    required this.hasAllergy,
    required this.allergyDetails,
    required this.hasPersonalizedLearningNeeds,
    required this.personalizedLearningNeedsDetails,
  });

  factory MedicalInfoEntity.fromJson(Map<String, dynamic> json) => _$MedicalInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInfoEntityToJson(this);

  @override
  MedicalInfoEntity restore(MedicalInfo data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  MedicalInfo transform() {
  return MedicalInfo(pastHospitalization: pastHospitalization,
      lastHospitalizationYear: lastHospitalizationYear, reasonForHospitalization: reasonForHospitalization,
      isPhsicallyDisabled: isPhsicallyDisabled, disablilityDetails: disablilityDetails, hasMedicalHistory: hasMedicalHistory, medicalHistoryDetails: medicalHistoryDetails,
      hasAllergy: hasAllergy,
      allergyDetails: allergyDetails, hasPersonalizedLearningNeeds: hasPersonalizedLearningNeeds,
      personalizedLearningNeedsDetails: personalizedLearningNeedsDetails);
  }
}

@JsonSerializable()
class ParentEntity implements BaseLayerDataTransformer<ParentEntity, Parent>{
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "guardian_id")
  int guardianId;
  @JsonKey(name: "guardian_relationship_id")
  int? guardianRelationshipId;
  @JsonKey(name: "relation")
  String? relation;
  @JsonKey(name: "global_no")
  String? globalNo;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "adhar_no")
  String? adharNo;
  @JsonKey(name: "pan_no")
  String? panNo;
  @JsonKey(name: "designation")
  String? designation;
  @JsonKey(name: "occupation")
  String? occupation;
  @JsonKey(name: "organization")
  String? organization;
  @JsonKey(name: "qualification")
  String? qualification;
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
  @JsonKey(name: "is_preferred_address")
  int? isPreferredAddress;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "street_name")
  String? streetName;
  @JsonKey(name: "landmark")
 String? landmark;
  @JsonKey(name: "city_id")
  int? cityId;
  @JsonKey(name: "country_id")
  int? countryId;
  @JsonKey(name: "state_id")
  int? stateId;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "tag_id")
  String? tagId;

  ParentEntity({
    required this.id,
    required this.guardianId,
    required this.guardianRelationshipId,
    required this.relation,
    required this.globalNo,
    required this.firstName,
    required this.lastName,
    required this.adharNo,
    required this.panNo,
    required this.designation,
    required this.occupation,
    required this.organization,
    required this.qualification,
    required this.address,
    required this.area,
    required this.pincode,
    required this.mobileNo,
    required this.email,
    required this.isPreferredEmail,
    required this.isPreferredMobileNo,
    required this.isPreferredAddress,
    required this.userId,
    required this.streetName,
    required this.landmark,
    required this.cityId,
    required this.countryId,
    required this.stateId,
    required this.city,
    required this.state,
    required this.country,
    required this.tagId,
  });

  factory ParentEntity.fromJson(Map<String, dynamic> json) => _$ParentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentEntityToJson(this);

  @override
  ParentEntity restore(Parent data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Parent transform() {
 return Parent(id: id, guardianId: guardianId, guardianRelationshipId: guardianRelationshipId,
     relation: relation, globalNo: globalNo, firstName: firstName, lastName: lastName, adharNo: adharNo, panNo: panNo, designation: designation, occupation: occupation, organization: organization, qualification: qualification, address: address, area: area, pincode: pincode, mobileNo: mobileNo, email: email, isPreferredEmail: isPreferredEmail, isPreferredMobileNo: isPreferredMobileNo, isPreferredAddress: isPreferredAddress, userId: userId, streetName: streetName, landmark: landmark, cityId: cityId, countryId: countryId, stateId: stateId,
     city: city, state: state, country: country, tagId: tagId);
  }
}

@JsonSerializable()
class ProfileEntity implements BaseLayerDataTransformer<ProfileEntity,Profile> {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "dob")
  DateTime? dob;
  @JsonKey(name: "birth_place")
  String? birthPlace;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "gender_id")
  int? genderId;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "nationality")
  String? nationality;
  @JsonKey(name: "caste")
  String? caste;
  @JsonKey(name: "sub_caste")
  String? subCaste;
  @JsonKey(name: "sub_caste_id")
  String? subCasteId;
  @JsonKey(name: "is_parents_seperated")
  int? isParentsSeperated;
  @JsonKey(name: "religion")
  String? religion;
  @JsonKey(name: "blood_group")
  String? bloodGroup;
  @JsonKey(name: "mother_tongue")
  String? motherTongue;
  @JsonKey(name: "student_types")
  String? studentTypes;
  @JsonKey(name: "crt_board")
  String? crtBoard;
  @JsonKey(name: "crt_grade")
  String? crtGrade;
  @JsonKey(name: "crt_division")
  String? crtDivision;
  @JsonKey(name: "crt_div_id")
  int? crtDivId;
  @JsonKey(name: "crt_brand_id")
  int? crtBrandId;
  @JsonKey(name: "brand_name")
  String? brandName;
  @JsonKey(name: "crt_enr_on")
  String? crtEnrOn;
  @JsonKey(name: "crt_shift")
  String? crtShift;
  @JsonKey(name: "crt_school")
  String? crtSchool;
  @JsonKey(name: "crt_house")
  String? crtHouse;
  @JsonKey(name: "crt_house_id")
  int? crtHouseId;
  @JsonKey(name: "emergency_contact_no")
  String? emergencyContactNo;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "academic_year_name")
  String? academicYearName;
  @JsonKey(name: "caste_id")
  int? casteId;
  @JsonKey(name: "crt_board_id")
  int? crtBoardId;
  @JsonKey(name: "crt_grade_id")
  int? crtGradeId;
  @JsonKey(name: "crt_shift_id")
  int? crtShiftId;
  @JsonKey(name: "crt_school_id")
  int? crtSchoolId;
  @JsonKey(name: "crt_course_id")
  int? crtCourseId;
  @JsonKey(name: "crt_stream_id")
  String? crtStreamId;
  @JsonKey(name: "global_id")
  int? globalId;
  @JsonKey(name: "student_type_id")
  int? studentTypeId;
  @JsonKey(name: "course_name")
  String? courseName;
  @JsonKey(name: "stream_name")
  String? streamName;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "profile_image_url")
  String? profileImageUrl;

  ProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.birthPlace,
    required this.status,
    required this.genderId,
    required this.gender,
    required this.nationality,
    required this.caste,
    required this.subCaste,
    required this.subCasteId,
    required this.isParentsSeperated,
    required this.religion,
    required this.bloodGroup,
    required this.motherTongue,
    required this.studentTypes,
    required this.crtBoard,
    required this.crtGrade,
    required this.crtDivision,
    required this.crtDivId,
    required this.crtBrandId,
    required this.brandName,
    required this.crtEnrOn,
    required this.crtShift,
    required this.crtSchool,
    required this.crtHouse,
    required this.crtHouseId,
    required this.emergencyContactNo,
    required this.profileImage,
    required this.academicYearId,
    required this.academicYearName,
    required this.casteId,
    required this.crtBoardId,
    required this.crtGradeId,
    required this.crtShiftId,
    required this.crtSchoolId,
    required this.crtCourseId,
    required this.crtStreamId,
    required this.globalId,
    required this.studentTypeId,
    required this.courseName,
    required this.streamName,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImageUrl,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => _$ProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  @override
  ProfileEntity restore(Profile data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Profile transform() {
return Profile(id: id, firstName: firstName, lastName: lastName, dob: dob, birthPlace: birthPlace, status: status, genderId: genderId, gender: gender, nationality: nationality, caste: caste, subCaste: subCaste, subCasteId: subCasteId, isParentsSeperated: isParentsSeperated, religion: religion, bloodGroup: bloodGroup, motherTongue: motherTongue, studentTypes: studentTypes, crtBoard: crtBoard, crtGrade: crtGrade,
    crtDivision: crtDivision, crtDivId: crtDivId, crtBrandId: crtBrandId, brandName: brandName, crtEnrOn: crtEnrOn,
    crtShift: crtShift, crtSchool: crtSchool, crtHouse: crtHouse, crtHouseId: crtHouseId,
    emergencyContactNo: emergencyContactNo, profileImage: profileImage, academicYearId: academicYearId,
    academicYearName: academicYearName, casteId: casteId, crtBoardId: crtBoardId,
    crtGradeId: crtGradeId, crtShiftId: crtShiftId, crtSchoolId: crtSchoolId,
    crtCourseId: crtCourseId, crtStreamId: crtStreamId, globalId: globalId,
    studentTypeId: studentTypeId, courseName: courseName,
    streamName: streamName, createdAt: createdAt,
    updatedAt: updatedAt,
    profileImageUrl: profileImageUrl);
  }
}

@JsonSerializable()
class SiblingsInfoEntity implements BaseLayerDataTransformer<SiblingsInfoEntity,SiblingsInfo>{
  @JsonKey(name: "global_id")
  int globalId;
  @JsonKey(name: "global_number")
  String? globalNumber;
  @JsonKey(name: "is_vibgyor_student")
  bool? isVibgyorStudent;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "gender_id")
  int? genderId;
  @JsonKey(name: "dob")
  DateTime? dob;
  @JsonKey(name: "school_name")
  String? schoolName;
  @JsonKey(name: "grade_id")
  String? gradeId;

  SiblingsInfoEntity({
    required this.globalId,
    required this.globalNumber,
    required this.isVibgyorStudent,
    required this.firstName,
    required this.lastName,
    required this.genderId,
    required this.dob,
    required this.schoolName,
    required this.gradeId,
  });

  factory SiblingsInfoEntity.fromJson(Map<String, dynamic> json) => _$SiblingsInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SiblingsInfoEntityToJson(this);

  @override
  SiblingsInfoEntity restore(SiblingsInfo data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SiblingsInfo transform() {
return SiblingsInfo(globalId: globalId, globalNumber: globalNumber, isVibgyorStudent: isVibgyorStudent,
    firstName: firstName,
    lastName: lastName, genderId: genderId,
    dob: dob, schoolName: schoolName,
    gradeId: gradeId);
  }
}
