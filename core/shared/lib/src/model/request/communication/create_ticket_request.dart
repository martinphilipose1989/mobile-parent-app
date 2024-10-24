class CreateTicketRequest {
  int? categoryId;
  int? subcategoryId;
  String? communication;
  String? ticketTitle;
  int? parentId;
  String? attachment;
  String? studentId;

  CreateTicketRequest({
    this.categoryId,
    this.subcategoryId,
    this.communication,
    this.ticketTitle,
    this.parentId,
    this.attachment,
    this.studentId,
  });
}
