class CreateIntimationRequestModel {
  int? globalUserId;
  int? globalStudentId;
  String? fromDate;
  String? toDate;
  int? status;
  int? initimationType;
  String? note;
  String? fileAttachment;
  String? approvalFlag;
  int? approvedById;

  CreateIntimationRequestModel({
    this.globalUserId,
    this.globalStudentId,
    this.fromDate,
    this.toDate,
    this.status,
    this.initimationType,
    this.note,
    this.fileAttachment,
    this.approvalFlag,
    this.approvedById,
  });

}

