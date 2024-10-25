import 'dart:convert';

CancelCompetencyTestRequest cancelCompetencyTestRequestFromJson(String str) => CancelCompetencyTestRequest.fromJson(json.decode(str));

String cancelCompetencyTestRequestToJson(CancelCompetencyTestRequest data) => json.encode(data.toJson());

class CancelCompetencyTestRequest {
    String? reason;
    String? comment;

    CancelCompetencyTestRequest({
        this.reason,
        this.comment,
    });

    factory CancelCompetencyTestRequest.fromJson(Map<String, dynamic> json) => CancelCompetencyTestRequest(
        reason: json["reason"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
        "comment": comment,
    };
}