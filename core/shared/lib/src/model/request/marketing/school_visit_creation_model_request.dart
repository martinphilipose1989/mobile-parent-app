import 'dart:convert';

SchoolCreationModelRequest schoolCreationModelRequestFromJson(String str) => SchoolCreationModelRequest.fromJson(json.decode(str));

String schoolCreationModelRequestToJson(SchoolCreationModelRequest data) => json.encode(data.toJson());

class SchoolCreationModelRequest {
    String? schoolVisitDate;
    String? schoolVisitTime;
    String? comment;
    int? createdBy;

    SchoolCreationModelRequest({
        this.schoolVisitDate,
        this.schoolVisitTime,
        this.comment,
        this.createdBy,
    });

    factory SchoolCreationModelRequest.fromJson(Map<String, dynamic> json) => SchoolCreationModelRequest(
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