import 'package:network_retrofit/network_retrofit.dart';

part 'get_ticket_list_request.g.dart';

@JsonSerializable()
class GetTicketListRequest {
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "page")
  int? page;

  GetTicketListRequest({
    this.pageSize,
    this.page,
  });

  factory GetTicketListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTicketListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetTicketListRequestToJson(this);
}
