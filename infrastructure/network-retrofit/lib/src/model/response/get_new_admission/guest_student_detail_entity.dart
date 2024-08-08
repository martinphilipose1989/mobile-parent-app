import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'guest_student_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class GuestStudentDetailsEntity extends BaseLayerDataTransformer<GuestStudentDetailsEntity,GuestStudentDetails>{
    @JsonKey(name: 'location')
    CommonDataEntity? location;
    @JsonKey(name: 'board')
    CommonDataEntity? board;
    @JsonKey(name: 'course')
    CommonDataEntity? course;

    GuestStudentDetailsEntity({
      this.location,
      this.board,
      this.course,
    });

  factory GuestStudentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$GuestStudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuestStudentDetailsEntityToJson(this);


  @override
  GuestStudentDetails transform() {
    GuestStudentDetails guestStudentDetails = GuestStudentDetails();
    guestStudentDetails.board = board?.transform();
    guestStudentDetails.course = course?.transform();
    guestStudentDetails.location = location?.transform();
    return guestStudentDetails;
  }
}