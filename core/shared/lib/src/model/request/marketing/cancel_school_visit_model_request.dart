import 'dart:convert';

SchoolVisitCancelModelRequest schoolVisitCancelModelRequestFromJson(String str) => SchoolVisitCancelModelRequest.fromJson(json.decode(str));

String schoolVisitCancelModelRequestToJson(SchoolVisitCancelModelRequest data) => json.encode(data.toJson());

class SchoolVisitCancelModelRequest {
    String? reason;
    String? comment;

    SchoolVisitCancelModelRequest({
        this.reason,
        this.comment,
    });

    factory SchoolVisitCancelModelRequest.fromJson(Map<String, dynamic> json) => SchoolVisitCancelModelRequest(
        reason: json["reason"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
        "comment": comment,
    };
}