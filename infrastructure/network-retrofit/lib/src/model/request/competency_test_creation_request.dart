import 'dart:convert';

CompetencyTestCreationRequest competencyTestCreationRequestFromJson(String str) => CompetencyTestCreationRequest.fromJson(json.decode(str));

String competencyTestCreationRequestToJson(CompetencyTestCreationRequest data) => json.encode(data.toJson());

class CompetencyTestCreationRequest {
    String? competencyTestDate;
    String? slotId;
    String? mode;
    int? createdBy;

    CompetencyTestCreationRequest({
        this.competencyTestDate,
        this.slotId,
        this.mode,
        this.createdBy,
    });

    factory CompetencyTestCreationRequest.fromJson(Map<String, dynamic> json) => CompetencyTestCreationRequest(
        competencyTestDate: json["date"],
        slotId: json["slot_id"],
        mode: json["mode"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "date": competencyTestDate,
        "slot_id": slotId,
        "mode": mode,
    };
}