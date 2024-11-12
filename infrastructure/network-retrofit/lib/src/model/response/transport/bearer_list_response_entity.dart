import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bearer_list_response_entity.g.dart';

@JsonSerializable()
class GetBearerListResponseEntity
    implements
        BaseLayerDataTransformer<GetBearerListResponseEntity,
            GetBearerListResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<BearerResponseEntity>? data;
  @JsonKey(name: "message")
  String? message;

  GetBearerListResponseEntity({this.status, this.data, this.message});

  factory GetBearerListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetBearerListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetBearerListResponseEntityToJson(this);

  @override
  GetBearerListResponseEntity restore(GetBearerListResponse data) {
    return GetBearerListResponseEntity();
  }

  @override
  GetBearerListResponse transform() {
    return GetBearerListResponse(
        data: data?.map((e) => e.transform()).toList(),
        message: message,
        status: status);
  }
}

@JsonSerializable()
class BearerResponseEntity
    implements BaseLayerDataTransformer<BearerResponseEntity, BearerResponse> {
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "mobile_no")
  String? mobileNo;
  @JsonKey(name: "profile_image")
  String? profileImage;

  BearerResponseEntity(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.mobileNo,
      this.profileImage});

  factory BearerResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BearerResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BearerResponseEntityToJson(this);

  @override
  BearerResponseEntity restore(BearerResponse data) {
    return BearerResponseEntity();
  }

  @override
  BearerResponse transform() {
    return BearerResponse(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        mobileNo: mobileNo,
        profileImage: profileImage);
  }
}
