import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'sendTokenRequestEntity.g.dart';

@JsonSerializable()
class SendTokenRequestEntity
    implements
        BaseLayerDataTransformer<SendTokenRequestEntity,
            SendTokenRequestModel> {
  @JsonKey(name: "data")
  TokenEntity? tokenEntity;

  SendTokenRequestEntity({
    this.tokenEntity,
  });

  factory SendTokenRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$SendTokenRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SendTokenRequestEntityToJson(this);

  @override
  SendTokenRequestEntity restore(SendTokenRequestModel data) {
    return SendTokenRequestEntity(
        tokenEntity: TokenEntity(appToken: data.data?.appToken));
  }

  @override
  SendTokenRequestModel transform() {
    return SendTokenRequestModel(data: tokenEntity?.transform());
  }
}

@JsonSerializable()
class TokenEntity implements BaseLayerDataTransformer<TokenEntity, TokenModel> {
  @JsonKey(name: "app_token")
  String? appToken;

  TokenEntity({
    this.appToken,
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);

  @override
  TokenEntity restore(TokenModel data) {
    return TokenEntity(appToken: data.appToken);
  }

  @override
  TokenModel transform() {
    return TokenModel(appToken: appToken);
  }
}
