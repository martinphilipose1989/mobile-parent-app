import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guardians_detail_response_entity.g.dart';

@JsonSerializable()
class GetGuardianListResponseEntity
    implements
        BaseLayerDataTransformer<GetGuardianListResponseEntity,
            GetGuardianListResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<GuardiansDetailEntity>? data;
  @JsonKey(name: "message")
  String? message;

  GetGuardianListResponseEntity({this.status, this.data, this.message});

  factory GetGuardianListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetGuardianListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetGuardianListResponseEntityToJson(this);

  @override
  GetGuardianListResponseEntity restore(GetGuardianListResponse data) {
    return GetGuardianListResponseEntity();
  }

  @override
  GetGuardianListResponse transform() {
    return GetGuardianListResponse(
        data: data?.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GuardiansDetailEntity
    implements
        BaseLayerDataTransformer<GuardiansDetailEntity, GuardiansDetail> {
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "mobile_no")
  String? mobileNo;

  GuardiansDetailEntity(
      {this.firstName, this.middleName, this.lastName, this.mobileNo});

  factory GuardiansDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$GuardiansDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuardiansDetailEntityToJson(this);

  @override
  GuardiansDetailEntity restore(GuardiansDetail data) {
    return GuardiansDetailEntity();
  }

  @override
  GuardiansDetail transform() {
    return GuardiansDetail(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        mobileNo: mobileNo);
  }
}
