import 'dart:convert';

SchoolCreationRequest contactInfoFromJson(String str) => SchoolCreationRequest.fromJson(json.decode(str));

String contactInfoToJson(SchoolCreationRequest data) => json.encode(data.toJson());

class SchoolCreationRequest {
    String? schoolVisitDate;
    String? schoolVisitTime;
    String? comment;
    int? createdBy;

    SchoolCreationRequest({
        this.schoolVisitDate,
        this.schoolVisitTime,
        this.comment,
        this.createdBy,
    });

    factory SchoolCreationRequest.fromJson(Map<String, dynamic> json) => SchoolCreationRequest(
        schoolVisitDate: json["school_visit_date"],
        schoolVisitTime: json["school_visit_time"],
        comment: json["comment"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "school_visit_date": schoolVisitDate,
        "school_visit_time": schoolVisitTime,
        "comment": comment,
        "created_by": createdBy,
    };
}