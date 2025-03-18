import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_gurdian_student_details_student_entity.dart';

part 'get_guardian_student_details_data_entity.g.dart';

@JsonSerializable()
class GetGuardianStudentDetailsDataEntity extends BaseLayerDataTransformer<
    GetGuardianStudentDetailsDataEntity, GetGuardianStudentDetailsDataModel> {
  @JsonKey(name: "students")
  final List<GetGuardianStudentDetailsStudentEntity>? students;

  GetGuardianStudentDetailsDataEntity({
    this.students,
  });

  factory GetGuardianStudentDetailsDataEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetGuardianStudentDetailsDataEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetGuardianStudentDetailsDataEntityToJson(this);

  @override
  GetGuardianStudentDetailsDataModel transform() {
    // TODO: implement transform
    return GetGuardianStudentDetailsDataModel(
        students: students!
            .map(
              (e) => GetGuardianStudentDetailsStudentModel(
                crtEnrOn: e.crtEnrOn,
                id: e.id,
                studentDisplayName: e.studentDisplayName,
                urlKey: e.urlKey,
                undertakingFile: e.undertakingFile,
                boardId: e.boardId,
                boardName: e.boardName,
                courseId: e.courseId,
                crtLobId: e.crtLobId,
                division: e.division,
                divisionId: e.divisionId,
                gradeId: e.gradeId,
                gradeName: e.gradeName,
                ipDuringUndertaking: e.ipDuringUndertaking,
                isUndertakingTaken: e.isUndertakingTaken,
                schoolId: e.schoolId,
                shiftId: e.shiftId,
                shiftName: e.shiftName,
                streamId: e.streamId,
                streamName: e.streamName,
                studentYearlyId: e.studentYearlyId,
                undertakingTakenOn: e.undertakingTakenOn,
              ),
            )
            .toList());
  }
}
