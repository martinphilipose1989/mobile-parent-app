class StudentEditResponseModel {
  int? id;
  StudentProfileData? studentProfile;
  List<Parentdata>? parent;




  StudentEditResponseModel({
    this.id,
    this.studentProfile,
    this.parent,



  });

}


class Parentdata {
  int? guardianId;
  int? cityId;
  int? stateId;
  int? countryId;
  String? addressTag;
  String? addressType;
  String? globalNo;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? adharNo;
  String? panNo;
  int? qualificationId;
  int? occupationId;
  int? organizationId;
  int? designationId;
  String? address;
  String? area;
  String? pincode;
  String? mobileNo;
  String? email;
  int? isPreferredEmail;
  int? isPreferredMobileNo;
  int? setAsEmergencyContact;
  int? userType;
  int? applicationId;
  int? serviceId;
  int? guardianRelationshipId;

  Parentdata({
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

}


class StudentProfileData {
  String? firstName;
  String? middleName;
  String? lastName;
  int? genderId;
  String? dob;
  String? birthPlace;
  int? natinalityId;
  int? religionId;
  int? casteId;
  int? subCasteId;
  int? motherTongueId;
  int? emergencyContactNo;
  int? isParentsSeperated;
  String? profileImage;
  int? crtBoardId;
  int? crtGradeId;
  int? crtDivId;
  int? crtShiftId;
  int? crtSchoolId;
  int? crtHouseId;
  int? crtBrandId;
  int? crtCourseId;
  int? crtLobId;
  String? enquiryId;
  bool? competencyTestAttended;
  bool? competencyTestMode;
  String? competencyTestResult;
  bool? competencyTestStatus;
  String? reconsiderationCycleDate;
  String? admissionOfferedDate;
  Medical? medicalInfo;

  StudentProfileData({
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

}

class Medical {
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
  int? bloodGroupId;

  Medical({
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

}
