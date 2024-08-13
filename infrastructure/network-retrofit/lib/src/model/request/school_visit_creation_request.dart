import 'dart:convert';

SchoolCreationRequest contactInfoFromJson(String str) => SchoolCreationRequest.fromJson(json.decode(str));

String contactInfoToJson(SchoolCreationRequest data) => json.encode(data.toJson());

class SchoolCreationRequest {
    String? schoolVisitDate;
    String? slotId;
    String? comment;
    int? createdBy;

    SchoolCreationRequest({
        this.schoolVisitDate,
        this.slotId,
        this.comment,
        this.createdBy,
    });

    factory SchoolCreationRequest.fromJson(Map<String, dynamic> json) => SchoolCreationRequest(
        schoolVisitDate: json["school_visit_date"],
        slotId: json["slot_id"],
        comment: json["comment"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "school_visit_date": schoolVisitDate,
        "slot_id": slotId,
        "comment": comment,
        "created_by": createdBy,
    };
}