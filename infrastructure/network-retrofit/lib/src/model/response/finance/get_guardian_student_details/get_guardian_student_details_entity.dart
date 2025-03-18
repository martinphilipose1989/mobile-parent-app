import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_guardian_student_details_data_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_guardian_student_details_meta_entity.dart';

part 'get_guardian_student_details_entity.g.dart';

@JsonSerializable()
class GetGuardianStudentDetailsEntity extends BaseLayerDataTransformer<
    GetGuardianStudentDetailsEntity, GetGuardianStudentDetailsModel> {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final GetGuardianStudentDetailsDataEntity? data;
  @JsonKey(name: "meta")
  final GetGuardianStudentDetailsMetaEntity? meta;
  @JsonKey(name: "message")
  final String? message;

  GetGuardianStudentDetailsEntity({
    this.success,
    this.data,
    this.meta,
    this.message,
  });

  factory GetGuardianStudentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$GetGuardianStudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetGuardianStudentDetailsEntityToJson(this);

  @override
  GetGuardianStudentDetailsModel transform() {
    // TODO: implement transform
    return GetGuardianStudentDetailsModel(
        meta: meta!.transform(),
        data: data!.transform(),
        message: message,
        success: success);
  }
}
