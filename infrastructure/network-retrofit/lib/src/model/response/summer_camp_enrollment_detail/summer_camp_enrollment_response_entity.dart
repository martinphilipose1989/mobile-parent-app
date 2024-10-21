import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/summer_camp_enrollment_detail/summer_camp_enrollment_detail_entity.dart';

part 'summer_camp_enrollment_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SummerCampEnrollmentResponseEntity extends BaseLayerDataTransformer<SummerCampEnrollmentResponseEntity,SummerCampEnrollmentResponseModel>{
    @JsonKey(name: 'status')
    String? status;
    @JsonKey(name: 'message')
    String? message;
    @JsonKey(name: 'data')
    SummerCampEnrollmentDetailEntity? data;

    SummerCampEnrollmentResponseEntity({
        this.status,
        this.message,
        this.data,
    });

    factory SummerCampEnrollmentResponseEntity.fromJson(Map<String, dynamic> json) => _$SummerCampEnrollmentResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$SummerCampEnrollmentResponseEntityToJson(this);

  @override
  SummerCampEnrollmentResponseModel transform() {
    return SummerCampEnrollmentResponseModel(
      status: status,
      message: message,
      data: data?.transform(),
    );
  }
}