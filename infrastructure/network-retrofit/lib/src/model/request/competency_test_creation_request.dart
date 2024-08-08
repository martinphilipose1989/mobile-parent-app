import 'dart:convert';

CompetencyTestCreationRequest competencyTestCreationRequestFromJson(String str) => CompetencyTestCreationRequest.fromJson(json.decode(str));

String competencyTestCreationRequestToJson(CompetencyTestCreationRequest data) => json.encode(data.toJson());

class CompetencyTestCreationRequest {
    DateTime? competencyTestDate;
    String? competencyTestTime;
    String? mode;
    int? createdBy;

    CompetencyTestCreationRequest({
        this.competencyTestDate,
        this.competencyTestTime,
        this.mode,
        this.createdBy,
    });

    factory CompetencyTestCreationRequest.fromJson(Map<String, dynamic> json) => CompetencyTestCreationRequest(
        competencyTestDate: json["competency_test_date"] == null ? null : DateTime.parse(json["competency_test_date"]),
        competencyTestTime: json["competency_test_time"],
        mode: json["mode"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "competency_test_date": "${competencyTestDate!.year.toString().padLeft(4, '0')}-${competencyTestDate!.month.toString().padLeft(2, '0')}-${competencyTestDate!.day.toString().padLeft(2, '0')}",
        "competency_test_time": competencyTestTime,
        "mode": mode,
        "created_by": createdBy,
    };
}