import 'package:data/data.dart';

import '../../../../network_retrofit.dart';

part 'sendTokenResponseEntity.g.dart';

@JsonSerializable()
class SendTokenResponseEntity implements BaseLayerDataTransformer<SendTokenResponseEntity,SendTokenResponseModel>{
  @JsonKey(name: "data")
 TokenDataEntity? data;

  SendTokenResponseEntity({
    this.data,
  });

  factory SendTokenResponseEntity.fromJson(Map<String, dynamic> json) => _$SendTokenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SendTokenResponseEntityToJson(this);

  @override
  SendTokenResponseEntity restore(SendTokenResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SendTokenResponseModel transform() {
 return SendTokenResponseModel(tokenDataModel: data?.transform());
  }
}

@JsonSerializable()
class  TokenDataEntity implements BaseLayerDataTransformer<TokenDataEntity,TokenDataModel>{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  AttributeEntity? attributes;

  TokenDataEntity({
    this.id,
    this.attributes,
  });

  factory  TokenDataEntity.fromJson(Map<String, dynamic> json) => _$TokenDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataEntityToJson(this);

  @override
  TokenDataEntity restore(TokenDataModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  TokenDataModel transform() {
  return TokenDataModel(id: id,attributes: attributes?.transform());
  }
}

@JsonSerializable()
class   AttributeEntity implements BaseLayerDataTransformer<AttributeEntity,Attribute> {
  @JsonKey(name: "app_token")
  String? appToken;

  AttributeEntity({
    this.appToken,
  });

  factory  AttributeEntity.fromJson(Map<String, dynamic> json) => _$AttributeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeEntityToJson(this);

  @override
  AttributeEntity restore(Attribute data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Attribute transform() {
return Attribute(appToken: appToken);
  }
}
