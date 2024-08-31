class CompetencyTestRescheduleRequest{
  String? date;
  String? newSlotId;
  String? mode;
  
  CompetencyTestRescheduleRequest({
      this.date,
      this.newSlotId,
      this.mode,
  });

  factory CompetencyTestRescheduleRequest.fromJson(Map<String, dynamic> json) => CompetencyTestRescheduleRequest(
      date: json["date"],
      newSlotId: json["new_slot_id"],
      mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
      "date": date,
      "new_slot_id": newSlotId,
      "mode": mode,
  };
}