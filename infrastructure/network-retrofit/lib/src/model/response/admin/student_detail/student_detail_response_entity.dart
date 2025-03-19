import 'package:data/data.dart';

import '../../../../../network_retrofit.dart';

part 'student_detail_response_entity.g.dart';

@JsonSerializable()
class StudentDetailsResponseEntity
    implements
        BaseLayerDataTransformer<StudentDetailsResponseEntity,
            StudentDetailsResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  StudentDetailsEntity? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "success")
  bool? success;

  StudentDetailsResponseEntity({
    this.status,
    this.data,
    this.message,
    this.success,
  });

  factory StudentDetailsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsResponseEntityToJson(this);

  @override
  StudentDetailsResponseEntity restore(StudentDetailsResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentDetailsResponseModel transform() {
    return StudentDetailsResponseModel(
        status: status,
        data: data?.transform(),
        message: message,
        success: success);
  }
}

@JsonSerializable()
class StudentDetailsEntity
    implements BaseLayerDataTransformer<StudentDetailsEntity, StudentData> {
  @JsonKey(name: "profile")
  ProfileEntity? profile;
  @JsonKey(name: "academics")
  AcademicsEntity? academics;
  @JsonKey(name: "parent")
  List<ParentDataEntity>? parent;
  @JsonKey(name: "contact_info")
  ContactInfoEntity? contactInfo;
  @JsonKey(name: "medical_info")
  MedicalInfoEntity? medicalInfoEntity;
  StudentDetailsEntity({
    this.profile,
    this.academics,
    this.contactInfo,
    this.parent,
    this.medicalInfoEntity,

  });

  factory StudentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsEntityToJson(this);

  @override
  StudentDetailsEntity restore(StudentData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentData transform() {
    return StudentData(
        profile: profile?.transform(), academics: academics?.transform(),parent: parent?.map((e) => Parent(
      id: e.id,
      guardianId: e.guardianId,
      guardianRelationshipId: e.guardianRelationshipId,
      relation: e.relation,
      globalNo: e.globalNo,
      firstName: e.firstName,
      lastName: e.lastName,
      adharNo: e.adharNo,
      panNo: e.panNo,
      designation: e.designation,
      occupation: e.occupation,
      organization: e.organization,
      qualification: e.qualification,
      address: e.address,
      area: e.area,
      pincode: e.pincode,
      mobileNo: e.mobileNo,
      email: e.email,
      isPreferredEmail: e.isPreferredEmail,
      isPreferredMobileNo: e.isPreferredMobileNo,
      isPreferredAddress: e.isPreferredAddress,

      userId: e.userId,
      streetName: e.streetName,
      landmark: e.landmark,
      cityId: e.cityId,
      countryId: e.countryId,
      stateId: e.stateId,
      city: e.city,
      state: e.state,
      country: e.country,
      tagId: e.tagId,
    )).toList(),
      contactInfo: contactInfo?.transform(),medicalInfo: medicalInfoEntity?.transform()
    );
  }
}

@JsonSerializable()
class AcademicsEntity
    implements BaseLayerDataTransformer<AcademicsEntity, Academics> {
  @JsonKey(name: "house_allocation_name")
  String? houseAllocationName;
  @JsonKey(name: "division_allocation_name")
  String? divisionAllocationName;
  @JsonKey(name: "crt_house_id")
  int? crtHouseId;
  @JsonKey(name: "crt_div_id")
  int? crtDivId;

  AcademicsEntity({
    this.houseAllocationName,
    this.divisionAllocationName,
    this.crtHouseId,
    this.crtDivId,
  });

  factory AcademicsEntity.fromJson(Map<String, dynamic> json) =>
      _$AcademicsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicsEntityToJson(this);

  @override
  AcademicsEntity restore(Academics data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Academics transform() {
    return Academics(
        houseAllocationName: houseAllocationName,
        divisionAllocationName: divisionAllocationName,
        crtHouseId: crtHouseId,
        crtDivId: crtDivId);
  }
}
@JsonSerializable()
class ContactInfoEntity  implements BaseLayerDataTransformer<ContactInfoEntity,ContactInfo>{
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "emergency_contact")
  String? emergencyContact;
  @JsonKey(name: "emergency_contact_of")
  dynamic emergencyContactOf;
  @JsonKey(name: "residential_information")
  List<ResidentialInformationEntity>? residentialInformation;

  ContactInfoEntity({
    this.address,
    this.emergencyContact,
    this.emergencyContactOf,
    this.residentialInformation,
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
  return ContactInfo(address: address,emergencyContact: emergencyContact,residentialInformation: residentialInformation?.map((e)=>ResidentialInformation(id: e.id, type: e.type, userId: e.userId, houseBuildingNo: e.houseBuildingNo, streetName: e.streetName, landmark: e.landmark, cityId: e.cityId, stateId: e.stateId, countryId: e.countryId, city: e.city, state: e.state, country: e.country, pincode: e.pincode)).toList());
  }
}

@JsonSerializable()
class ResidentialInformationEntity implements BaseLayerDataTransformer<ResidentialInformationEntity,ResidentialInformation> {
  @JsonKey(name: "id")
  int? id;
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
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "pincode")
  int? pincode;
  @JsonKey(name: "tag_ids")
  List<dynamic>? tagIds;

  ResidentialInformationEntity({
    this.id,
    this.type,
    this.userId,
    this.houseBuildingNo,
    this.streetName,
    this.landmark,
    this.cityId,
    this.stateId,
    this.countryId,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.tagIds,
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
   return ResidentialInformation(id: id, type: type, userId: userId, houseBuildingNo: houseBuildingNo, streetName: streetName, landmark: landmark, cityId: cityId, stateId: stateId, countryId: countryId, city: city, state: state, country: country, pincode: pincode, );
  }
}

@JsonSerializable()
class MedicalInfoEntity implements BaseLayerDataTransformer<MedicalInfoEntity,MedicalInfo>{
  @JsonKey(name: "past_hospitalization")
  dynamic pastHospitalization;
  @JsonKey(name: "last_hospitalization_year")
  dynamic lastHospitalizationYear;
  @JsonKey(name: "reason_for_hospitalization")
  dynamic reasonForHospitalization;
  @JsonKey(name: "is_phsically_disabled")
  dynamic isPhsicallyDisabled;
  @JsonKey(name: "disablility_details")
  dynamic disablilityDetails;
  @JsonKey(name: "has_medical_history")
  dynamic hasMedicalHistory;
  @JsonKey(name: "medical_history_details")
  dynamic medicalHistoryDetails;
  @JsonKey(name: "has_allergy")
  dynamic hasAllergy;
  @JsonKey(name: "allergy_details")
  dynamic allergyDetails;
  @JsonKey(name: "has_personalized_learning_needs")
  dynamic hasPersonalizedLearningNeeds;
  @JsonKey(name: "personalized_learning_needs_details")
  dynamic personalizedLearningNeedsDetails;

  MedicalInfoEntity({
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
    // TODO: implement transform
   return MedicalInfo(disablilityDetails: disablilityDetails,medicalHistoryDetails: medicalHistoryDetails,allergyDetails: allergyDetails);
  }
}
@JsonSerializable()
class ParentDataEntity implements BaseLayerDataTransformer<ParentDataEntity,Parent> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "guardian_id")
  int? guardianId;
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
  dynamic adharNo;
  @JsonKey(name: "pan_no")
  dynamic panNo;
  @JsonKey(name: "designation")
  dynamic designation;
  @JsonKey(name: "occupation")
  dynamic occupation;
  @JsonKey(name: "organization")
  dynamic organization;
  @JsonKey(name: "qualification")
  dynamic qualification;
  @JsonKey(name: "address")
  dynamic address;
  @JsonKey(name: "area")
  dynamic area;
  @JsonKey(name: "pincode")
  dynamic pincode;
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
  @JsonKey(name: "set_as_emergency_contact")
  dynamic setAsEmergencyContact;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "street_name")
  String? streetName;
  @JsonKey(name: "landmark")
  dynamic landmark;
  @JsonKey(name: "city_id")
  dynamic cityId;
  @JsonKey(name: "country_id")
  dynamic countryId;
  @JsonKey(name: "state_id")
  dynamic stateId;
  @JsonKey(name: "city")
  dynamic city;
  @JsonKey(name: "state")
  dynamic state;
  @JsonKey(name: "country")
  dynamic country;
  @JsonKey(name: "tag_id")
  dynamic tagId;

  ParentDataEntity({
    this.id,
    this.guardianId,
    this.guardianRelationshipId,
    this.relation,
    this.globalNo,
    this.firstName,
    this.lastName,
    this.adharNo,
    this.panNo,
    this.designation,
    this.occupation,
    this.organization,
    this.qualification,
    this.address,
    this.area,
    this.pincode,
    this.mobileNo,
    this.email,
    this.isPreferredEmail,
    this.isPreferredMobileNo,
    this.isPreferredAddress,
    this.setAsEmergencyContact,
    this.userId,
    this.streetName,
    this.landmark,
    this.cityId,
    this.countryId,
    this.stateId,
    this.city,
    this.state,
    this.country,
    this.tagId,
  });

  factory ParentDataEntity.fromJson(Map<String, dynamic> json) => _$ParentDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentDataEntityToJson(this);

  @override
  ParentDataEntity restore(Parent data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Parent transform() {
    return Parent(id: id, guardianId: guardianId, guardianRelationshipId: guardianRelationshipId, relation: relation, globalNo: globalNo, firstName: firstName, lastName: lastName, adharNo: adharNo, panNo: panNo, designation: designation, occupation: occupation, organization: organization, qualification: qualification, address: address, area: area, pincode: pincode, mobileNo: mobileNo, email: email, isPreferredEmail: isPreferredEmail, isPreferredMobileNo: isPreferredMobileNo, isPreferredAddress: isPreferredAddress, userId: userId, streetName: streetName, landmark: landmark, cityId: cityId, countryId: countryId, stateId: stateId, city: city,
        state: state, country: country, tagId: tagId);
  }
}


@JsonSerializable()
class ProfileEntity
    implements BaseLayerDataTransformer<ProfileEntity, Profile> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "dob")
  DateTime dob;
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
  dynamic subCasteId;
  @JsonKey(name: "is_ParentDataEntitys_seperated")
  int? isParentDataEntitysSeperated;
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
  dynamic crtStreamId;
  @JsonKey(name: "global_id")
  int? globalId;
  @JsonKey(name: "student_type_id")
  int? studentTypeId;
  @JsonKey(name: "course_name")
  String? courseName;
  @JsonKey(name: "stream_name", defaultValue: "NA")
  String? streamName;
  @JsonKey(name: "created_at")
  dynamic createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "crt_lob_id")
  int? crtLobId;
  @JsonKey(name: "profile_image_url")
  String? profileImageUrl;
  @JsonKey(name: 'school_ParentDataEntity_id')
  int? schoolParentDataEntityId;

  ProfileEntity(
      {this.id,
      this.firstName,
      this.lastName,
      required this.dob,
      this.birthPlace,
      this.status,
      this.genderId,
      this.gender,
      this.nationality,
      this.caste,
      this.subCaste,
      this.subCasteId,
      this.isParentDataEntitysSeperated,
      this.religion,
      this.bloodGroup,
      this.motherTongue,
      this.studentTypes,
      this.crtBoard,
      this.crtGrade,
      this.crtDivision,
      this.crtDivId,
      this.crtBrandId,
      this.brandName,
      this.crtEnrOn,
      this.crtShift,
      this.crtSchool,
      this.crtHouse,
      this.crtHouseId,
      this.emergencyContactNo,
      this.profileImage,
      this.academicYearId,
      this.academicYearName,
      this.casteId,
      this.crtBoardId,
      this.crtGradeId,
      this.crtShiftId,
      this.crtSchoolId,
      this.crtCourseId,
      this.crtStreamId,
      this.globalId,
      this.studentTypeId,
      this.courseName,
      this.streamName,
      this.createdAt,
      this.updatedAt,
      this.crtLobId,
      this.profileImageUrl,
      this.schoolParentDataEntityId});

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  @override
  ProfileEntity restore(Profile data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Profile transform() {
    return Profile(
        id: id,
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        birthPlace: birthPlace,
        status: status,
        genderId: genderId,
        gender: gender,
        nationality: nationality,
        caste: caste,
        subCaste: subCaste,
        subCasteId: subCasteId,
        isParentsSeperated: isParentDataEntitysSeperated,
        religion: religion,
        bloodGroup: bloodGroup,
        motherTongue: motherTongue,
        studentTypes: studentTypes,
        crtBoard: crtBoard,
        crtGrade: crtGrade,
        crtDivision: crtDivision,
        crtDivId: crtDivId,
        crtBrandId: crtBrandId,
        brandName: brandName,
        crtEnrOn: crtEnrOn,
        crtShift: crtShift,
        crtSchool: crtSchool,
        crtHouse: crtHouse,
        crtHouseId: crtHouseId,
        emergencyContactNo: emergencyContactNo,
        profileImage: profileImage,
        academicYearId: academicYearId,
        academicYearName: academicYearName,
        casteId: casteId,
        crtBoardId: crtBoardId,
        crtGradeId: crtGradeId,
        crtShiftId: crtShiftId,
        crtSchoolId: crtSchoolId,
        crtCourseId: crtCourseId,
        crtStreamId: crtStreamId,
        globalId: globalId,
        studentTypeId: studentTypeId,
        courseName: courseName,
        streamName: streamName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        profileImageUrl: profileImageUrl,
        crtLobId: crtLobId,
        schoolParentId: schoolParentDataEntityId);
  }
}
