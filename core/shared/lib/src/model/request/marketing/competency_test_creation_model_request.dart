import 'dart:convert';

CompetencyTestCreationModelRequest competencyTestCreationModelRequestFromJson(String str) => CompetencyTestCreationModelRequest.fromJson(json.decode(str));

String competencyTestCreationModelRequestToJson(CompetencyTestCreationModelRequest data) => json.encode(data.toJson());

class CompetencyTestCreationModelRequest {
    DateTime? competencyTestDate;
    String? competencyTestTime;
    String? mode;
    int? createdBy;

    CompetencyTestCreationModelRequest({
        this.competencyTestDate,
        this.competencyTestTime,
        this.mode,
        this.createdBy,
    });

    factory CompetencyTestCreationModelRequest.fromJson(Map<String, dynamic> json) => CompetencyTestCreationModelRequest(
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