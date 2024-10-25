import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/get_sibling_detail/sibling_data_entity.dart';

part 'sibling_profile_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiblingProfileResponseEntity extends BaseLayerDataTransformer<SiblingProfileResponseEntity,SiblingProfileResponse>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  SiblingDataEntity? data;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'success')
  bool? success;

  SiblingProfileResponseEntity({
    this.status,
    this.data,
    this.message,
    this.success,
  });

  factory SiblingProfileResponseEntity.fromJson(Map<String, dynamic> json) => _$SiblingProfileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SiblingProfileResponseEntityToJson(this);

  @override
  SiblingProfileResponse transform() {
    SiblingProfileResponse siblingProfileResponse = SiblingProfileResponse();
    siblingProfileResponse.status = status;
    siblingProfileResponse.data = data?.transform();
    siblingProfileResponse.message = message;
    siblingProfileResponse.success = success;
    return siblingProfileResponse;
  }
}
