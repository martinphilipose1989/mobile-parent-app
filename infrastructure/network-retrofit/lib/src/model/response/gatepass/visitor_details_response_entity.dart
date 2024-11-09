import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:network_retrofit/src/model/response/gatepass/visitor_data_entity.dart';

part 'visitor_details_response_entity.g.dart';

VisitorDetailsResponseEntity visitorDetailsResponseEntityFromJson(String str) =>
    VisitorDetailsResponseEntity.fromJson(json.decode(str));

String visitorDetailsResponseEntityToJson(VisitorDetailsResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class VisitorDetailsResponseEntity
    implements
        BaseLayerDataTransformer<VisitorDetailsResponseEntity,
            VisitorDetailsResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  VisitorDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  VisitorDetailsResponseEntity({this.status, this.data, this.message});

  factory VisitorDetailsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorDetailsResponseEntityToJson(this);

  @override
  VisitorDetailsResponseEntity restore(VisitorDetailsResponseModel data) {
    return VisitorDetailsResponseEntity(
      message: data.message,
      status: data.status,
      data: VisitorDataEntity(
          id: data.data?.id ?? '',
          pointOfContact: data.data?.pointOfContact ?? '',
          purposeOfVisitId: data.data?.purposeOfVisitId ?? 0,
          comingFrom: data.data?.comingFrom ?? '',
          issuedDate: data.data?.issuedDate ?? '',
          incomingTime: data.data?.incomingTime ?? '',
          outgoingTime: data.data?.outgoingTime,
          qrCode: data.data?.qrCode ?? '',
          visitStatus: data.data?.visitStatus ?? '',
          visitorId: data.data?.visitorId ?? ' ',
          visitorName: data.data?.visitorName ?? '',
          visitorMobile: data.data?.visitorMobile ?? '',
          visitorEmail: data.data?.visitorEmail ?? '',
          visitorProfileImageFilePath: data.data?.visitorProfileImage ?? '',
          purposeOfVisit: data.data?.purposeOfVisit ?? '',
          visitorProfileImageImageUrl:
              data.data?.visitorProfileImageImageUrl ?? '',
          visitorType: data.data?.visitorType ?? '',
          guestCount: data.data?.guestCount),
    );
  }

  @override
  VisitorDetailsResponseModel transform() {
    return VisitorDetailsResponseModel(
        status: status,
        message: message,
        data: VisitorDataModel(
            id: data?.id ?? '',
            issuedTime: data?.issuedTime ?? '',
            gatePassNumber: data?.gatePassNumber ?? '',
            incomingTime: data?.incomingTime ?? '',
            issuedDate: data?.issuedDate ?? '',
            pointOfContact: data?.pointOfContact ?? '',
            outgoingTime: data?.outgoingTime ?? '',
            visitStatus: data?.visitStatus ?? '',
            visitorId: data?.visitorId ?? '',
            visitorName: data?.visitorName ?? '',
            visitorMobile: data?.visitorMobile ?? '',
            visitorEmail: data?.visitorEmail ?? '',
            purposeOfVisit: data?.purposeOfVisit ?? '',
            qrCode: data?.qrCode ?? '',
            comingFrom: data?.comingFrom ?? '',
            purposeOfVisitId: data?.purposeOfVisitId ?? 0,
            visitorProfileImage: data?.visitorProfileImage ?? '',
            visitorProfileImageFilePath:
                data?.visitorProfileImageFilePath ?? '',
            visitorProfileImageImageUrl:
                data?.visitorProfileImageImageUrl ?? '',
            visitorType: data?.visitorType ?? '',
            guestCount: data?.guestCount,
            vehicleNumber: data?.vehicleNumber,
            studentName: data?.studentName));
  }
}
