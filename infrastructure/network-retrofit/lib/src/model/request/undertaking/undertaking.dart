import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'undertaking.g.dart';

@JsonSerializable()
class UndertakingRequestEntity
    implements
        BaseLayerDataTransformer<UndertakingRequestEntity, UndertakingRequest> {
  @JsonKey(name: "student_yearly_id")
  final int? studentYearlyId;
  @JsonKey(name: "is_undertaking_taken")
  final bool? isUndertakingTaken;

  UndertakingRequestEntity({this.studentYearlyId, this.isUndertakingTaken});

  factory UndertakingRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$UndertakingRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UndertakingRequestEntityToJson(this);

  @override
  UndertakingRequestEntity restore(UndertakingRequest data) {
    return UndertakingRequestEntity(
        isUndertakingTaken: data.isUndertakingTaken,
        studentYearlyId: data.studentYearlyId);
  }

  @override
  UndertakingRequest transform() {
    return UndertakingRequest(
        studentYearlyId: studentYearlyId,
        isUndertakingTaken: isUndertakingTaken);
  }
}
