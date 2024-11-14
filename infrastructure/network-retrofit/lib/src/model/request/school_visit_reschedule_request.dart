import 'dart:convert';

RescheduleSchoolVisitRequest rescheduleSchoolVisitFromJson(String str) => RescheduleSchoolVisitRequest.fromJson(json.decode(str));

String rescheduleSchoolVisitToJson(RescheduleSchoolVisitRequest data) => json.encode(data.toJson());

class RescheduleSchoolVisitRequest {
    String? schoolVisitDate;
    String? slotId;
    String? comment;
    int? createdBy;

    RescheduleSchoolVisitRequest({
        this.schoolVisitDate,
        this.slotId,
        this.comment,
        this.createdBy,
    });

    factory RescheduleSchoolVisitRequest.fromJson(Map<String, dynamic> json) => RescheduleSchoolVisitRequest(
        schoolVisitDate: json["date"],
        slotId: json["new_slot_id"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "date": schoolVisitDate,
        "new_slot_id": slotId,
        "comment": comment,
    };
}