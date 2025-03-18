class StudentDetailsResponseModel {
  int? status;
  StudentData? data;
  String? message;
  bool? success;

  StudentDetailsResponseModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });
}

class StudentData {
  Profile? profile;
  List<Parent>? parent;
  List<SiblingsInfo>? siblingsInfo;
  ContactInfo? contactInfo;
  List<GuardianContactInfo>? guardianContactInfo;
  MedicalInfo? medicalInfo;

  Academics? academics;

  StudentData({
    required this.profile,
    required this.academics,
  });
}

class Academics {
  String? houseAllocationName;
  String? divisionAllocationName;
  int? crtHouseId;
  int? crtDivId;

  Academics({
    required this.houseAllocationName,
    required this.divisionAllocationName,
    required this.crtHouseId,
    required this.crtDivId,
  });
}

class ResidentialInformation {
  int? id;
  String? type;
  int? userId;
  String? houseBuildingNo;
  String? streetName;
  String? landmark;
  int? cityId;
  int? stateId;
  int? countryId;
  String? city;
  String? state;
  String? country;
  int? pincode;
  String? addressId;
  String? tagId;

  ResidentialInformation({
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
}

class GuardianContactInfo {
  String? relation;
  int? guardianRelationshipId;
  int? guardianId;
  String? preferredMobileNo;
  String? preferredEmailNo;

  GuardianContactInfo({
    required this.relation,
    required this.guardianRelationshipId,
    required this.guardianId,
    required this.preferredMobileNo,
    required this.preferredEmailNo,
  });
}

class Parent {
  int id;
  int guardianId;
  int? guardianRelationshipId;
  String? relation;
  String? globalNo;
  String? firstName;
  String? lastName;
  String? adharNo;
  String? panNo;
  String? designation;
  String? occupation;
  String? organization;
  String? qualification;
  String? address;
  String? area;
  String? pincode;
  String? mobileNo;
  String? email;
  int? isPreferredEmail;
  int? isPreferredMobileNo;
  int? isPreferredAddress;
  int? userId;
  String? streetName;
  String? landmark;
  int? cityId;
  int? countryId;
  int? stateId;
  String? city;
  String? state;
  String? country;
  String? tagId;

  Parent({
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
}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  DateTime dob;
  String? birthPlace;
  int? status;
  int? genderId;
  String? gender;
  String? nationality;
  String? caste;
  String? subCaste;
  String? subCasteId;
  int? isParentsSeperated;
  String? religion;
  String? bloodGroup;
  String? motherTongue;
  String? studentTypes;
  String? crtBoard;
  String? crtGrade;
  String? crtDivision;
  int? crtDivId;
  int? crtBrandId;
  String? brandName;
  String? crtEnrOn;
  String? crtShift;
  String? crtSchool;
  String? crtHouse;
  int? crtHouseId;
  String? emergencyContactNo;
  String? profileImage;
  int? academicYearId;
  String? academicYearName;
  int? casteId;
  int? crtBoardId;
  int? crtGradeId;
  int? crtShiftId;
  int? crtSchoolId;
  int? crtCourseId;
  dynamic crtStreamId;
  int? globalId;
  int? studentTypeId;
  String? courseName;
  String? streamName;
  String? createdAt;
  DateTime? updatedAt;
  String? profileImageUrl;
  int? crtLobId;
  int? schoolParentId;

  Profile(
      {required this.id,
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
      required this.crtLobId,
      required this.schoolParentId});
}

class SiblingsInfo {
  int globalId;
  String? globalNumber;
  bool? isVibgyorStudent;
  String? firstName;
  String? lastName;
  int? genderId;
  DateTime? dob;
  String? schoolName;
  String? gradeId;

  SiblingsInfo({
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



}

class MedicalInfo {
  bool? pastHospitalization;
  int? lastHospitalizationYear;
  String? reasonForHospitalization;
  bool? isPhsicallyDisabled;
  String? disablilityDetails;
  bool? hasMedicalHistory;
  String? medicalHistoryDetails;
  bool? hasAllergy;
  String? allergyDetails;
  bool? hasPersonalizedLearningNeeds;
  String? personalizedLearningNeedsDetails;

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
  });

}

class ContactInfo {
  String? address;
  String? emergencyContact;
  List<ResidentialInformation>? residentialInformation;

  ContactInfo({
    this.address,
    this.emergencyContact,
    this.residentialInformation,
  });

}
