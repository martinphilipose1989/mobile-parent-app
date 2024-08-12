import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'brand_code_entity.g.dart';

@JsonSerializable()
class BrandCodEntity
    extends BaseLayerDataTransformer<BrandCodEntity, BrandCode> {
  @JsonKey(name: "legal_identity")
  final String? legalIdentity;
  @JsonKey(name: "brand_code")
  final int? brandCode;
  @JsonKey(name: "display_name")
  final String? displayName;

  BrandCodEntity({
    this.legalIdentity,
    this.brandCode,
    this.displayName,
  });

  factory BrandCodEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandCodEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandCodEntityToJson(this);

  @override
  BrandCode transform() {
    // TODO: implement transform
    return BrandCode(
        brandCode: brandCode,
        displayName: displayName,
        legalIdentity: legalIdentity);
  }
}
