import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_token_generator_global_number_generator_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorGlobalNumberGeneratorEntity
    extends BaseLayerDataTransformer<
        GetTokenGeneratorGlobalNumberGeneratorEntity, GlobalNumberGenerator> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "prefix")
  final String? prefix;
  @JsonKey(name: "is_year")
  final bool? isYear;
  @JsonKey(name: "is_month")
  final bool? isMonth;
  @JsonKey(name: "is_day")
  final bool? isDay;
  @JsonKey(name: "is_lob")
  final bool? isLob;
  @JsonKey(name: "is_entity_id")
  final dynamic isEntityId;
  @JsonKey(name: "is_school_code")
  final dynamic isSchoolCode;
  @JsonKey(name: "next_number")
  final int? nextNumber;
  @JsonKey(name: "reset_yearly")
  final dynamic resetYearly;
  @JsonKey(name: "number_of_digit")
  final int? numberOfDigit;
  @JsonKey(name: "is_active")
  final bool? isActive;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "lob_id")
  final dynamic lobId;
  @JsonKey(name: "entity_segment_id")
  final dynamic entitySegmentId;
  @JsonKey(name: "school_code_id")
  final dynamic schoolCodeId;

  GetTokenGeneratorGlobalNumberGeneratorEntity({
    this.id,
    this.name,
    this.prefix,
    this.isYear,
    this.isMonth,
    this.isDay,
    this.isLob,
    this.isEntityId,
    this.isSchoolCode,
    this.nextNumber,
    this.resetYearly,
    this.numberOfDigit,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.lobId,
    this.entitySegmentId,
    this.schoolCodeId,
  });

  factory GetTokenGeneratorGlobalNumberGeneratorEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetTokenGeneratorGlobalNumberGeneratorEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTokenGeneratorGlobalNumberGeneratorEntityToJson(this);

  @override
  GlobalNumberGenerator transform() {
    // TODO: implement transform
    return GlobalNumberGenerator(
      createdAt: createdAt,
      entitySegmentId: entitySegmentId,
      id: id,
      isActive: isActive,
      isDay: isDay,
      isEntityId: isEntityId,
      isLob: isLob,
      isMonth: isMonth,
      isSchoolCode: isSchoolCode,
      isYear: isYear,
      lobId: lobId,
      name: name,
      nextNumber: nextNumber,
      numberOfDigit: numberOfDigit,
      prefix: prefix,
      resetYearly: resetYearly,
      schoolCodeId: schoolCodeId,
      updatedAt: updatedAt,
    );
  }
}
