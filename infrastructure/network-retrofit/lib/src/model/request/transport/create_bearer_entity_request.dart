import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_bearer_entity_request.g.dart';


@JsonSerializable()
class CreateBearerRequestEntity
    implements
        BaseLayerDataTransformer<CreateBearerRequestEntity,
            CreateBearerRequest> {
  @JsonKey(name: "data")
  CreateBearerRequesDataEntity? data;

  CreateBearerRequestEntity({
    this.data,
  });

  factory CreateBearerRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateBearerRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBearerRequestEntityToJson(this);

  @override
  CreateBearerRequestEntity restore(CreateBearerRequest data) {
    return CreateBearerRequestEntity();
  }

  @override
  CreateBearerRequest transform() {
    return CreateBearerRequest(data: data?.transform());
  }
}

@JsonSerializable()
class CreateBearerRequesDataEntity
    implements
        BaseLayerDataTransformer<CreateBearerRequesDataEntity,
            CreateBearerRequesData> {
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "profile_image")
  String? profileImage;

  CreateBearerRequesDataEntity(
      {this.firstName, this.lastName, this.profileImage});

  factory CreateBearerRequesDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateBearerRequesDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBearerRequesDataEntityToJson(this);

  @override
  CreateBearerRequesDataEntity restore(CreateBearerRequesData data) {
    return CreateBearerRequesDataEntity();
  }

  @override
  CreateBearerRequesData transform() {
    return CreateBearerRequesData(
        firstName: firstName, lastName: lastName, profileImage: profileImage);
  }
}
