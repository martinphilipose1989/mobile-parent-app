import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_gurdian_student_details_student_entity.g.dart';

@JsonSerializable()
class GetGuardianStudentDetailsStudentEntity extends BaseLayerDataTransformer<
    GetGuardianStudentDetailsStudentEntity,
    GetGuardianStudentDetailsStudentModel> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "student_display_name")
  final String? studentDisplayName;
  @JsonKey(name: "crt_enr_on")
  final String? crtEnrOn;
  @JsonKey(name: "url_key")
  final String? urlKey;
  @JsonKey(name: "student_yearly_id")
  final int? studentYearlyId;
  @JsonKey(name: "undertaking_taken_on")
  final String? undertakingTakenOn;
  @JsonKey(name: "ip_during_undertaking")
  final String? ipDuringUndertaking;
  @JsonKey(name: "is_undertaking_taken")
  final bool? isUndertakingTaken;
  @JsonKey(name: "school_id")
  final int? schoolId;
  @JsonKey(name: "board_id")
  final int? boardId;
  @JsonKey(name: "board_name")
  final String? boardName;
  @JsonKey(name: "grade_id")
  final int? gradeId;
  @JsonKey(name: "grade_name")
  final String? gradeName;
  @JsonKey(name: "shift_id")
  final int? shiftId;
  @JsonKey(name: "shift_name")
  final String? shiftName;
  @JsonKey(name: "division_id")
  final int? divisionId;
  @JsonKey(name: "division")
  final String? division;
  @JsonKey(name: "stream_id")
  final int? streamId;
  @JsonKey(name: "stream_name")
  final String? streamName;
  @JsonKey(name: "crt_lob_id")
  final int? crtLobId;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "undertaking_file")
  final String? undertakingFile;

  GetGuardianStudentDetailsStudentEntity(
      {this.id,
      this.studentDisplayName,
      this.crtEnrOn,
      this.urlKey,
      this.studentYearlyId,
      this.undertakingTakenOn,
      this.ipDuringUndertaking,
      this.isUndertakingTaken,
      this.schoolId,
      this.boardId,
      this.boardName,
      this.gradeId,
      this.gradeName,
      this.shiftId,
      this.shiftName,
      this.divisionId,
      this.division,
      this.streamId,
      this.streamName,
      this.crtLobId,
      this.courseId,
      this.undertakingFile});

  factory GetGuardianStudentDetailsStudentEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetGuardianStudentDetailsStudentEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetGuardianStudentDetailsStudentEntityToJson(this);

  @override
  GetGuardianStudentDetailsStudentModel transform() {
    return GetGuardianStudentDetailsStudentModel(
        crtEnrOn: crtEnrOn,
        id: id,
        studentDisplayName: studentDisplayName,
        urlKey: urlKey,
        boardId: boardId,
        boardName: boardName,
        courseId: courseId,
        crtLobId: crtLobId,
        division: division,
        divisionId: divisionId,
        gradeId: gradeId,
        gradeName: gradeName,
        ipDuringUndertaking: ipDuringUndertaking,
        isUndertakingTaken: isUndertakingTaken,
        schoolId: schoolId,
        shiftId: shiftId,
        shiftName: shiftName,
        streamId: streamId,
        streamName: streamName,
        studentYearlyId: studentYearlyId,
        undertakingFile: undertakingFile,
        undertakingTakenOn: undertakingTakenOn);
  }
}
