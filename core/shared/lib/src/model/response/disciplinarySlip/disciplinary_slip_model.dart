// class DisciplinaryListModel {
//   int status;
//   DisciplinaryData data;
//   String message;
//   bool success;
//
//   DisciplinaryListModel({
//     required this.status,
//     required this.data,
//     required this.message,
//     required this.success,
//   });
//
// }
//
// class DisciplinaryData {
//   List<SlipInfo> data;
//
//
//   DisciplinaryData({
//     required this.data,
//
//   });
//
// }
//
// class SlipInfo {
//   int id;
//   int academicYearId;
//   int studentId;
//   int disciplinarySlipId;
//   int infractionId;
//   int disciplinaryActionId;
//   DateTime? date;
//   String time;
//   String description;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<AcknowledgementDetail> acknowledgementDetails;
//
//   SlipInfo({
//     required this.id,
//     required this.academicYearId,
//     required this.studentId,
//     required this.disciplinarySlipId,
//     required this.infractionId,
//     required this.disciplinaryActionId,
//     required this.date,
//     required this.time,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.acknowledgementDetails,
//   });
//
// }
//
// class AcknowledgementDetail {
//   int id;
//   int studentWarningId;
//   int userId;
//   String acknowledgementRole;
//   DateTime acknowledgementDate;
//
//   AcknowledgementDetail({
//     required this.id,
//     required this.studentWarningId,
//     required this.userId,
//     required this.acknowledgementRole,
//     required this.acknowledgementDate,
//   });
//
// }
//
//
//
class DisciplinaryListModel {
  int status;
  DisciplinaryData  data;
  String message;
  bool success;

  DisciplinaryListModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

}

class DisciplinaryData  {
  List<SlipInfo> data;


  DisciplinaryData ({
    required this.data,

  });

}

class SlipInfo {
  int id;
  int academicYearId;
  int studentId;
  int disciplinarySlipId;
  int infractionId;
  int disciplinaryActionId;
  DateTime date;
  String time;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<AcknowledgementDetail> acknowledgementDetails;
  String disciplinarySlip;
  String disciplinarySlipDescription;
  String infraction;
  String disciplinaryAction;

  SlipInfo({
    required this.id,
    required this.academicYearId,
    required this.studentId,
    required this.disciplinarySlipId,
    required this.infractionId,
    required this.disciplinaryActionId,
    required this.date,
    required this.time,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.acknowledgementDetails,
    required this.disciplinarySlip,
    required this.disciplinarySlipDescription,
    required this.infraction,
    required this.disciplinaryAction,
  });

}

class AcknowledgementDetail {
  int id;
  int studentWarningId;
  int userId;
  String acknowledgementRole;
  DateTime acknowledgementDate;

  AcknowledgementDetail({
    required this.id,
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
  });

}



