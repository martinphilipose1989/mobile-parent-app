class StudentDetailsResponseModel {
  int? status;
  Data? data;
  String? message;
  bool? success;

  StudentDetailsResponseModel({
    this.status,
    this.data,
    this.message,
    this.success,
  });

}

class Data {
  Profile? profile;
  List<Parent>? parent;
  List<SiblingsInfo>? siblingsInfo;
  ContactInfo? contactInfo;
  List<GuardianContactInfo>? guardianContactInfo;
  MedicalInfo? medicalInfo;
  List<DocumentInfo>? documentInfo;
  Academics? academics;

  Data({
    this.profile,
    this.parent,
    this.siblingsInfo,
    this.contactInfo,
    this.guardianContactInfo,
    this.medicalInfo,
    this.documentInfo,
    this.academics,
  });

}

class Academics {
  String? houseAllocationName;
  String? divisionAllocationName;
  int? crtHouseId;
  int? crtDivId;

  Academics({
    this.houseAllocationName,
    this.divisionAllocationName,
    this.crtHouseId,
    this.crtDivId,
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
  List<String?>? tagIds;

  ResidentialInformation({
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

}

class DocumentInfo {
  int? id;
  int? typeId;
  String? documentFilename;
  bool? isMandatory;
  bool? isDeleted;
  bool? isVerified;
  DateTime? verifiedOn;
  String? remarks;
  int? verifiedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  dynamic createdById;
  dynamic updatedById;
  int? studentId;
  String? documentName;

  DocumentInfo({
    this.id,
    this.typeId,
    this.documentFilename,
    this.isMandatory,
    this.isDeleted,
    this.isVerified,
    this.verifiedOn,
    this.remarks,
    this.verifiedBy,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdById,
    this.updatedById,
    this.studentId,
    this.documentName,
  });

}

class GuardianContactInfo {
  String? relation;
  int? guardianRelationshipId;
  int? guardianId;
  int? preferredMobileNo;
  int? preferredEmailNo;

  GuardianContactInfo({
    this.relation,
    this.guardianRelationshipId,
    this.guardianId,
    this.preferredMobileNo,
    this.preferredEmailNo,
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

class Parent {
  int? id;
  int? guardianId;
  int? guardianRelationshipId;
  String? relation;
  String? globalNo;
  String? firstName;
  String? lastName;
  String? adharNo;
  String? panNo;
  dynamic designation;
  dynamic occupation;
  dynamic organization;
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

}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? birthPlace;
  int? status;
  int? genderId;
  String? gender;
  String? nationality;
  String? caste;
  dynamic subCaste;
  dynamic subCasteId;
  dynamic isParentsSeperated;
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
  dynamic emergencyContactNo;
  String? profileImage;
  int? academicYearId;
  String? academicYearName;
  int? casteId;
  int? crtBoardId;
  int? crtGradeId;
  int? crtShiftId;
  int? crtSchoolId;
  dynamic crtCourseId;
  dynamic crtStreamId;
  int? globalId;
  int? studentTypeId;
  dynamic courseName;
  dynamic streamName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? crtLobId;
  int? schoolParentId;
  String? profileImageUrl;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.dob,
    this.birthPlace,
    this.status,
    this.genderId,
    this.gender,
    this.nationality,
    this.caste,
    this.subCaste,
    this.subCasteId,
    this.isParentsSeperated,
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
    this.schoolParentId,
    this.profileImageUrl,
  });

}

class SiblingsInfo {
  int? globalId;
  String? globalNumber;
  bool? isVibgyorStudent;
  String? firstName;
  String? lastName;
  int? genderId;
  DateTime? dob;
  String? schoolName;
  int? gradeId;

  SiblingsInfo({
    this.globalId,
    this.globalNumber,
    this.isVibgyorStudent,
    this.firstName,
    this.lastName,
    this.genderId,
    this.dob,
    this.schoolName,
    this.gradeId,
  });

}
