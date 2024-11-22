import 'package:data/data.dart';

import '../../../../../network_retrofit.dart';
part 'student_detail_response_entity.g.dart';
@JsonSerializable()
class StudentDetailsResponseEntity implements BaseLayerDataTransformer<StudentDetailsResponseEntity,StudentDetailsResponseModel>{
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
class StudentDetailsEntity implements BaseLayerDataTransformer<StudentDetailsEntity,StudentData> {
  @JsonKey(name: "profile")
  ProfileEntity? profile;
  @JsonKey(name: "academics")
  AcademicsEntity? academics;

  StudentDetailsEntity({
    this.profile,
    this.academics,
  });

  factory StudentDetailsEntity.fromJson(Map<String, dynamic> json) => _$StudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsEntityToJson(this);

  @override
  StudentDetailsEntity restore(StudentData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StudentData transform() {
 return StudentData(profile: profile?.transform(), academics: academics?.transform());
  }
}

@JsonSerializable()
class AcademicsEntity implements BaseLayerDataTransformer<AcademicsEntity,Academics>{
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

  factory AcademicsEntity.fromJson(Map<String, dynamic> json) => _$AcademicsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicsEntityToJson(this);

  @override
  AcademicsEntity restore(Academics data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Academics transform() {
return Academics(houseAllocationName: houseAllocationName, divisionAllocationName: divisionAllocationName, crtHouseId: crtHouseId, crtDivId: crtDivId);
  }
}



@JsonSerializable()
class ProfileEntity implements BaseLayerDataTransformer<ProfileEntity,Profile>{
  @JsonKey(name: "id")
  int? id;
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
  dynamic subCasteId;
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
  dynamic? crtStreamId;
  @JsonKey(name: "global_id")
  int? globalId;
  @JsonKey(name: "student_type_id")
  int? studentTypeId;
  @JsonKey(name: "course_name")
  String? courseName;
  @JsonKey(name: "stream_name")
  String? streamName;
  @JsonKey(name: "created_at")
  dynamic? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "crt_lob_id")
  int? crtLobId;
  @JsonKey(name: "profile_image_url")
  String? profileImageUrl;

  ProfileEntity({
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
    this.profileImageUrl,
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
 return Profile(id: id, firstName: firstName, lastName: lastName, dob: dob, birthPlace: birthPlace, status: status, genderId: genderId, gender: gender, nationality: nationality, caste: caste, subCaste: subCaste, subCasteId: subCasteId, isParentsSeperated: isParentsSeperated, religion: religion, bloodGroup: bloodGroup, motherTongue: motherTongue, studentTypes: studentTypes, crtBoard: crtBoard, crtGrade: crtGrade, crtDivision: crtDivision, crtDivId: crtDivId, crtBrandId: crtBrandId, brandName: brandName, crtEnrOn: crtEnrOn, crtShift: crtShift, crtSchool: crtSchool, crtHouse: crtHouse, crtHouseId: crtHouseId, emergencyContactNo: emergencyContactNo, profileImage: profileImage, academicYearId: academicYearId, academicYearName: academicYearName, casteId: casteId, crtBoardId: crtBoardId, crtGradeId: crtGradeId, crtShiftId: crtShiftId, crtSchoolId: crtSchoolId, crtCourseId: crtCourseId, crtStreamId: crtStreamId, globalId: globalId, studentTypeId: studentTypeId, courseName: courseName, streamName: streamName, createdAt: createdAt, updatedAt: updatedAt, profileImageUrl: profileImageUrl);
  }
}

