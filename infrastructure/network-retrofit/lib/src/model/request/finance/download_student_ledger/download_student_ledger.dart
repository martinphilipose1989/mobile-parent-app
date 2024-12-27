import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'download_student_ledger.g.dart';

@JsonSerializable()
class StudentLedgerDownloadRequestEntity
    implements
        BaseLayerDataTransformer<StudentLedgerDownloadRequestEntity,
            StudentLedgerDownloadRequest> {
  @JsonKey(name: "file_type")
  String? fileType;
  @JsonKey(name: "fees_type")
  String? feesType;
  @JsonKey(name: "student_fees_id")
  List<int>? studentFeesId;
  @JsonKey(name: "transaction")
  List<int>? transaction;
  @JsonKey(name: "send_mail")
  bool? sendMail;

  StudentLedgerDownloadRequestEntity(
      {this.fileType,
      this.feesType,
      this.studentFeesId,
      this.transaction,
      this.sendMail});

  factory StudentLedgerDownloadRequestEntity.fromJson(
          Map<String, dynamic> json) =>
      _$StudentLedgerDownloadRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentLedgerDownloadRequestEntityToJson(this);

  @override
  StudentLedgerDownloadRequestEntity restore(
      StudentLedgerDownloadRequest data) {
    return StudentLedgerDownloadRequestEntity(
        fileType: data.fileType,
        feesType: data.feesType,
        studentFeesId: data.studentFeesId,
        transaction: data.transaction,
        sendMail: data.sendMail);
  }

  @override
  StudentLedgerDownloadRequest transform() {
    return StudentLedgerDownloadRequest(
        feesType: feesType,
        fileType: fileType,
        sendMail: sendMail,
        studentFeesId: studentFeesId,
        transaction: transaction);
  }
}
