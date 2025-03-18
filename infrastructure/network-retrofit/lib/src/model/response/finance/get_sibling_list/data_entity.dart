import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_sibling_list/student_entity.dart';

part 'data_entity.g.dart';

@JsonSerializable()
class GetSibglingListResponseEntityData extends BaseLayerDataTransformer<
    GetSibglingListResponseEntityData, GetsibglingListDataModel> {
  @JsonKey(name: "students")
  final List<GetSibglingListResponseEntityStudent>? students;

  GetSibglingListResponseEntityData({
    this.students,
  });

  factory GetSibglingListResponseEntityData.fromJson(
          Map<String, dynamic> json) =>
      _$GetSibglingListResponseEntityDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSibglingListResponseEntityDataToJson(this);

  @override
  GetsibglingListDataModel transform() {
    return GetsibglingListDataModel(
        students: students!
            .map((e) => Student(
                boardName: e.boardName,
                crtEnrOn: e.boardName,
                id: e.id,
                mobileNo: e.mobileNo,
                studentDisplayName: e.studentDisplayName))
            .toList());
  }
}
