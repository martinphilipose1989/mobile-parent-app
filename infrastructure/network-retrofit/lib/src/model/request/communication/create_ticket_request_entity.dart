import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'create_ticket_request_entity.g.dart';

@JsonSerializable()
class CreateTicketRequestEntity extends BaseLayerDataTransformer<
    CreateTicketRequestEntity, CreateTicketRequest> {
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "subcategory_id")
  int? subcategoryId;
  @JsonKey(name: "communication")
  String? communication;
  @JsonKey(name: "ticket_title")
  String? ticketTitle;
  @JsonKey(name: "parent_id")
  int? parentId;
  @JsonKey(name: "attachment")
  String? attachment;
  @JsonKey(name: "student_id")
  String? studentId;

  CreateTicketRequestEntity({
    this.categoryId,
    this.subcategoryId,
    this.communication,
    this.ticketTitle,
    this.parentId,
    this.attachment,
    this.studentId,
  });

  factory CreateTicketRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketRequestEntityToJson(this);

  @override
  CreateTicketRequestEntity restore(CreateTicketRequest data) {
    // TODO: implement restore
    return CreateTicketRequestEntity(
        attachment: data.attachment,
        categoryId: data.categoryId,
        communication: data.communication,
        parentId: data.parentId,
        studentId: data.studentId,
        subcategoryId: data.subcategoryId,
        ticketTitle: data.ticketTitle);
  }
}
