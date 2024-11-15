class CreateCommunicationLogRequest {
  String? communicationId;
  String? comment;
  String? attachmentDetails;
  String? userId;
  String? status;
  int? rating;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDraft;

  CreateCommunicationLogRequest({
    this.communicationId,
    this.comment,
    this.attachmentDetails,
    this.userId,
    this.status,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.isDraft,
  });

  CreateCommunicationLogRequest copyWith({
    String? communicationId,
    String? comment,
    String? attachmentDetails,
    String? userId,
    String? status,
    int? rating,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDraft,
  }) =>
      CreateCommunicationLogRequest(
        communicationId: communicationId ?? this.communicationId,
        comment: comment ?? this.comment,
        attachmentDetails: attachmentDetails ?? this.attachmentDetails,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        rating: rating ?? this.rating,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDraft: isDraft ?? this.isDraft,
      );
}
