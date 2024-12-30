import 'dart:developer';

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

  GetGuardianStudentDetailsStudentEntity(
      {this.id, this.studentDisplayName, this.crtEnrOn, this.urlKey});

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
        urlKey: urlKey);
  }
}
