import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_guardian_student_details_meta_entity.g.dart';

@JsonSerializable()
class GetGuardianStudentDetailsMetaEntity extends BaseLayerDataTransformer<
    GetGuardianStudentDetailsMetaEntity, GetGuardianStudentDetailsMetaModel> {
  GetGuardianStudentDetailsMetaEntity();

  factory GetGuardianStudentDetailsMetaEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetGuardianStudentDetailsMetaEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetGuardianStudentDetailsMetaEntityToJson(this);

  @override
  GetGuardianStudentDetailsMetaModel transform() {
    // TODO: implement transform
    return GetGuardianStudentDetailsMetaModel();
  }
}
