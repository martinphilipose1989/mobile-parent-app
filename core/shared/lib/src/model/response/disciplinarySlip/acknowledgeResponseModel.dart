class AcknowlegementResponseModel {
  int status;
  AcknowledgeData data;
  String message;
  bool success;

  AcknowlegementResponseModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

}

class AcknowledgeData {
  int studentWarningId;
  int userId;
  String acknowledgementRole;
  DateTime acknowledgementDate;
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  AcknowledgeData({
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

}
