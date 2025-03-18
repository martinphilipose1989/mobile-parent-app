import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'student_entity.g.dart';

@JsonSerializable()
class GetSibglingListResponseEntityStudent extends BaseLayerDataTransformer<
    GetSibglingListResponseEntityStudent, Student> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "student_display_name")
  final String? studentDisplayName;
  @JsonKey(name: "crt_enr_on")
  final String? crtEnrOn;
  @JsonKey(name: "board_name")
  final String? boardName;
  @JsonKey(name: "mobile_no")
  final String? mobileNo;

  GetSibglingListResponseEntityStudent({
    this.id,
    this.studentDisplayName,
    this.crtEnrOn,
    this.boardName,
    this.mobileNo,
  });

  factory GetSibglingListResponseEntityStudent.fromJson(
          Map<String, dynamic> json) =>
      _$GetSibglingListResponseEntityStudentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSibglingListResponseEntityStudentToJson(this);

  @override
  Student transform() {
    return Student(
        boardName: boardName,
        crtEnrOn: crtEnrOn,
        id: id,
        mobileNo: mobileNo,
        studentDisplayName: studentDisplayName);
  }
}
