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
    @JsonKey(name: 'enquiry_date',includeToJson: false)
    String? enquiryDate;
    @JsonKey(name: 'academic_year')
    AcademicYearEntity? academicYear;
    @JsonKey(name: 'school_location')
    CommonDataEntity? schoolLocation;
    @JsonKey(name: 'is_guest_student')
    bool? isGuestStudent;
    @JsonKey(name: 'guest_student_details',includeToJson: false)
    GuestStudentDetailsEntity? guestStudentDetails;
    @JsonKey(name: 'parent_details')
    ParentDetailsEntity? parentDetails;
    @JsonKey(name: 'existing_school_details')
    ExistingSchoolDetailsEntity? existingSchoolDetails;
    @JsonKey(name: 'enquirer_parent')
    String? enquirerParent;
    @JsonKey(name: 'student_details')
    StudentDetailsEntity? studentDetails;
    @JsonKey(name: 'board')
    CommonDataEntity? board;
    @JsonKey(name: 'course')
    CommonDataEntity? course;
    @JsonKey(name: 'stream')
    CommonDataEntity? stream;
    @JsonKey(name: 'shift')
    CommonDataEntity? shift;
    @JsonKey(name: 'residential_address',includeToJson: false)
    ResidentialAddressEntity? residentialAddress;

    NewAdmissionDetailEntity({
      this.enquiryDate,
      this.academicYear,
      this.schoolLocation,
      this.isGuestStudent,
      this.guestStudentDetails,
      this.parentDetails,
      this.existingSchoolDetails,
      this.enquirerParent,
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
      newAdmissionDetail.enquiryDate = enquiryDate;
      newAdmissionDetail.academicYear = academicYear?.transform();
      newAdmissionDetail.schoolLocation = schoolLocation?.transform();
      newAdmissionDetail.isGuestStudent = isGuestStudent;
      newAdmissionDetail.guestStudentDetails = guestStudentDetails?.transform();
      newAdmissionDetail.parentDetails = parentDetails?.transform();
      newAdmissionDetail.existingSchoolDetails = existingSchoolDetails?.transform();
      newAdmissionDetail.enquirerParent = enquirerParent;
      newAdmissionDetail.studentDetails= studentDetails?.transform();
      newAdmissionDetail.board = board?.transform();
      newAdmissionDetail.course = course?.transform();
      newAdmissionDetail.stream = stream?.transform();
      newAdmissionDetail.shift = shift?.transform();
      newAdmissionDetail.residentialAddress = residentialAddress?.transform();
    return newAdmissionDetail;
  }

  @override
  NewAdmissionDetailEntity restore(NewAdmissionDetail data) {
    AcademicYearEntity academicYearEntity = AcademicYearEntity();
    academicYearEntity = academicYearEntity.restore(data.academicYear!);
    CommonDataEntity commonDataEntity = CommonDataEntity();
    GuestStudentDetailsEntity guestStudentDetailsEntity = GuestStudentDetailsEntity();
    ParentDetailsEntity parentDetailsEntity = ParentDetailsEntity();
    ExistingSchoolDetailsEntity existingSchoolDetailsEntity = ExistingSchoolDetailsEntity();
    StudentDetailsEntity studentDetailsEntity = StudentDetailsEntity();
    ResidentialAddressEntity residentialAddressEntity = ResidentialAddressEntity();
    NewAdmissionDetailEntity newAdmissionDetailEntity = NewAdmissionDetailEntity(
      enquiryDate : data.enquiryDate,
      academicYear : academicYearEntity,
      schoolLocation : commonDataEntity.restore(data.schoolLocation!),
      isGuestStudent : data.isGuestStudent,
      guestStudentDetails : guestStudentDetailsEntity.restore(data.guestStudentDetails!),
      parentDetails : parentDetailsEntity.restore(data.parentDetails!),
      existingSchoolDetails : existingSchoolDetailsEntity.restore(data.existingSchoolDetails!),
      enquirerParent : data.enquirerParent,
      studentDetails: studentDetailsEntity.restore(data.studentDetails!),
      board : commonDataEntity.restore(data.board!),
      course : commonDataEntity.restore(data.course!),
      stream : commonDataEntity.restore(data.stream!),
      shift : commonDataEntity.restore(data.shift!),
      residentialAddress : residentialAddressEntity.restore(data.residentialAddress!),
    );
    return newAdmissionDetailEntity;
  }
}