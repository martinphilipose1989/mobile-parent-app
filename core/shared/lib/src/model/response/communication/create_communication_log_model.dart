class CreateCommunicationLogModel {
  int? status;
  CreateCommunicationDataModel? data;
  String? message;

  CreateCommunicationLogModel({
    this.status,
    this.data,
    this.message,
  });
}

class CreateCommunicationDataModel {
  String? communicationId;
  String? comment;
  String? attachmentDetails;
  String? userId;
  String? status;
  int? rating;
  bool? isDraft;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CreateCommunicationDataModel({
    this.communicationId,
    this.comment,
    this.attachmentDetails,
    this.userId,
    this.status,
    this.rating,
    this.isDraft,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}
