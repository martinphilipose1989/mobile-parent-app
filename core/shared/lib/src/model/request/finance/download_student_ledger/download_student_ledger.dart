class StudentLedgerDownloadRequest {
  String? fileType;

  String? feesType;

  List<int>? studentFeesId;

  List<int>? transaction;

  bool? sendMail;

  StudentLedgerDownloadRequest(
      {this.fileType,
      this.feesType,
      this.studentFeesId,
      this.transaction,
      this.sendMail});
}
