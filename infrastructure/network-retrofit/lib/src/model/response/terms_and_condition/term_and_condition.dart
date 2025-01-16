import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'term_and_condition.g.dart';

@JsonSerializable()
class TermsAndConditionsFileEntity
    implements
        BaseLayerDataTransformer<TermsAndConditionsFileEntity,
            TermsAndConditionsFile> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final TermsAndConditionsEntity? data;
  @JsonKey(name: "message")
  final String? message;

  TermsAndConditionsFileEntity({this.status, this.data, this.message});

  factory TermsAndConditionsFileEntity.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAndConditionsFileEntityToJson(this);

  @override
  TermsAndConditionsFileEntity restore(TermsAndConditionsFile data) {
    return TermsAndConditionsFileEntity(
        status: data.status,
        message: data.message,
        data: TermsAndConditionsEntity().restore(data.data!));
  }

  @override
  TermsAndConditionsFile transform() {
    return TermsAndConditionsFile(
        message: message, status: status, data: data?.transform());
  }
}

@JsonSerializable()
class TermsAndConditionsEntity
    implements
        BaseLayerDataTransformer<TermsAndConditionsEntity, TermsAndConditions> {
  @JsonKey(name: "url")
  final String? url;

  TermsAndConditionsEntity({this.url});

  factory TermsAndConditionsEntity.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAndConditionsEntityToJson(this);

  @override
  TermsAndConditionsEntity restore(TermsAndConditions data) {
    return TermsAndConditionsEntity(url: data.url);
  }

  @override
  TermsAndConditions transform() {
    return TermsAndConditions(url: url);
  }
}
