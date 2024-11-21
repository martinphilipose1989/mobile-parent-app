class CreateIntimationResponseModel {
  int? status;
 Intimation? data;
  String? message;
  bool? success;

  CreateIntimationResponseModel({
    this.status,
    this.data,
    this.message,
    this.success,
  });

}

class Intimation {
  int? globalUserId;
  int? globalStudentId;
  DateTime? fromDate;
  DateTime? toDate;
  int? status;
  int? initimationType;
  String? note;
  String? fileUploadPath;
  String? approvalFlag;
  int? approvedById;
  dynamic createdBy;
  dynamic updatedBy;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  Intimation({
    this.globalUserId,
    this.globalStudentId,
    this.fromDate,
    this.toDate,
    this.status,
    this.initimationType,
    this.note,
    this.fileUploadPath,
    this.approvalFlag,
    this.approvedById,
    this.createdBy,
    this.updatedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

}
