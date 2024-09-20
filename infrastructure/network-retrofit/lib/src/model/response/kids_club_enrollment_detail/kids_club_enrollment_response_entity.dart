import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/kids_club_enrollment_detail/kids_club_enrollment_detail_entity.dart';

part 'kids_club_enrollment_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class KidsClubEnrollmentResponseEntity extends BaseLayerDataTransformer<KidsClubEnrollmentResponseEntity,KidsClubEnrollmentResponseModel>{
    @JsonKey(name: 'status')
    String? status;
    @JsonKey(name: 'message')
    String? message;
    @JsonKey(name: 'data')
    KidsClubEnrollmentDetailEntity? data;

    KidsClubEnrollmentResponseEntity({
        this.status,
        this.message,
        this.data,
    });

    factory KidsClubEnrollmentResponseEntity.fromJson(Map<String, dynamic> json) => _$KidsClubEnrollmentResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$KidsClubEnrollmentResponseEntityToJson(this);

  @override
  KidsClubEnrollmentResponseModel transform() {
    return KidsClubEnrollmentResponseModel(
      status: status,
      message: message,
      data: data?.transform(),
    );
  }
}