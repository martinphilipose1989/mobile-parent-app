import 'dart:convert';

SchoolVisitCancelRequest schoolVisitCancelRequestFromJson(String str) => SchoolVisitCancelRequest.fromJson(json.decode(str));

String schoolVisitCancelRequestToJson(SchoolVisitCancelRequest data) => json.encode(data.toJson());

class SchoolVisitCancelRequest {
    String? reason;
    String? comment;

    SchoolVisitCancelRequest({
        this.reason,
        this.comment,
    });

    factory SchoolVisitCancelRequest.fromJson(Map<String, dynamic> json) => SchoolVisitCancelRequest(
        reason: json["reason"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
        "comment": comment,
    };
}