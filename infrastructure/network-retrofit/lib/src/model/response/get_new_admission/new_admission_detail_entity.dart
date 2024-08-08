import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/academic_year_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/existing_school_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/guest_student_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_details_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/residential_address_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/student_detail_entity.dart';

part 'new_admission_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class NewAdmissionDetailEntity extends BaseLayerDataTransformer<NewAdmissionDetailEntity,NewAdmissionDetail>{
    @JsonKey(name: 'enquiryDate')
    String? enquiryDate;
    @JsonKey(name: 'academicYear')
    AcademicYearEntity? academicYear;
    @JsonKey(name: 'schoolLocation')
    CommonDataEntity? schoolLocation;
    @JsonKey(name: 'isGuestStudent')
    bool? isGuestStudent;
    @JsonKey(name: 'guestStudentDetails')
    GuestStudentDetailsEntity? guestStudentDetails;
    @JsonKey(name: 'parentDetails')
    ParentDetailsEntity? parentDetails;
    @JsonKey(name: 'existingSchoolDetails')
    ExistingSchoolDetailsEntity? existingSchoolDetails;
    @JsonKey(name: 'studentDetails')
    StudentDetailsEntity? studentDetails;
    @JsonKey(name: 'board')
    CommonDataEntity? board;
    @JsonKey(name: 'course')
    CommonDataEntity? course;
    @JsonKey(name: 'stream')
    CommonDataEntity? stream;
    @JsonKey(name: 'shift')
    CommonDataEntity? shift;
    @JsonKey(name: 'residentialAddress')
    ResidentialAddressEntity? residentialAddress;

    NewAdmissionDetailEntity({
      this.enquiryDate,
      this.academicYear,
      this.schoolLocation,
      this.isGuestStudent,
      this.guestStudentDetails,
      this.parentDetails,
      this.existingSchoolDetails,
      this.studentDetails,
      this.board,
      this.course,
      this.stream,
      this.shift,
      this.residentialAddress
    });

  factory NewAdmissionDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$NewAdmissionDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewAdmissionDetailEntityToJson(this);

  @override
  NewAdmissionDetail transform() {
    NewAdmissionDetail newAdmissionDetail = NewAdmissionDetail();
      newAdmissionDetail.enquiryDate =enquiryDate;
      newAdmissionDetail.academicYear = academicYear?.transform();
      newAdmissionDetail.schoolLocation = schoolLocation?.transform();
      newAdmissionDetail.isGuestStudent = isGuestStudent;
      newAdmissionDetail.guestStudentDetails = guestStudentDetails?.transform();
      newAdmissionDetail.parentDetails = parentDetails?.transform();
      newAdmissionDetail.existingSchoolDetails = existingSchoolDetails?.transform();
      newAdmissionDetail.studentDetails= studentDetails?.transform();
      newAdmissionDetail.board = board?.transform();
      newAdmissionDetail.course = course?.transform();
      newAdmissionDetail.stream = stream?.transform();
      newAdmissionDetail.shift = shift?.transform();
      newAdmissionDetail.residentialAddress = residentialAddress?.transform();
    return NewAdmissionDetail();
  }
}