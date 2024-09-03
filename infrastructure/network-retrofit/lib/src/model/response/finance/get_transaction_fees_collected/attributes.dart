import 'package:network_retrofit/network_retrofit.dart';

part 'attributes.g.dart';

@JsonSerializable()
class Attributes {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "parent_visible")
  final int? parentVisible;
  @JsonKey(name: "fee_counter_visible")
  final int? feeCounterVisible;

  Attributes({
    this.name,
    this.parentVisible,
    this.feeCounterVisible,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
