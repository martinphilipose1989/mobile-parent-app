class SendCommunicationModel {
  int? status;
  SendCommunicationData? data;
  String? message;

  SendCommunicationModel({
    this.status,
    this.data,
    this.message,
  });
}

class SendCommunicationData {
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

  SendCommunicationData({
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
