import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/academic_year_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/existing_school_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_details_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/student_detail_entity.dart';

part 'ivt_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class IvtDetailResponseEntity extends BaseLayerDataTransformer<IvtDetailResponseEntity,IVTDetail>{
    @JsonKey(name: 'enquiry_date')
    String? enquiryDate;
    @JsonKey(name: 'academic_year')
    AcademicYearEntity? academicYear;
    @JsonKey(name: 'school_location')
    CommonDataEntity? schoolLocation;
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

    IvtDetailResponseEntity({
      this.enquiryDate,
      this.academicYear,
      this.schoolLocation,
      this.parentDetails,
      this.existingSchoolDetails,
      this.enquirerParent,
      this.studentDetails,
      this.board,
      this.course,
      this.shift,
      this.stream,
    });

  factory IvtDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$IvtDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IvtDetailResponseEntityToJson(this);

  @override
  IVTDetail transform() {
    IVTDetail ivtDetail = IVTDetail();
    ivtDetail.enquiryDate = enquiryDate;
    ivtDetail.academicYear = academicYear?.transform();
    ivtDetail.schoolLocation = schoolLocation?.transform();
    ivtDetail.parentDetails = parentDetails?.transform();
    ivtDetail.existingSchoolDetails = existingSchoolDetails?.transform();
    ivtDetail.enquirerParent = enquirerParent;
    ivtDetail.studentDetails = studentDetails?.transform();
    ivtDetail.board = board?.transform();
    ivtDetail.course = course?.transform();
    ivtDetail.shift = shift?.transform();
    ivtDetail.stream = stream?.transform();
    return ivtDetail;
  }
}