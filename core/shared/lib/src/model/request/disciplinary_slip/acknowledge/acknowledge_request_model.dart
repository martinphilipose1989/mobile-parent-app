class AcknowlegementRequestModel {
  int studentWarningId;
  int userId;
  String acknowledgementRole;
  DateTime acknowledgementDate;

  AcknowlegementRequestModel({
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
  });

}
