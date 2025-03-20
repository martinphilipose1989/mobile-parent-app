class StudentEditRequestModel {
  int? id;
  StudentProfileModel? studentProfile;
  List<ParentModel>? parent;


  StudentEditRequestModel({
    this.id,
    this.studentProfile,
    this.parent,

  });

}




class ParentModel {
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

  ParentModel({
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








class StudentProfileModel {

  MedicalInfoModel? medicalInfo;

  StudentProfileModel({

    this.medicalInfo,
  });

}

class MedicalInfoModel {
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

  MedicalInfoModel({
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
