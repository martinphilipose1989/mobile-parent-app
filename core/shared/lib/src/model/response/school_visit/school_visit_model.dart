class SchoolVisitDetail {
    String? id;
    String? enquiryId;
    String? schoolVisitDate;
    String? slot;
    String? slotId;
    String? comment;
    String? status;
    String? createdBy;
    List<dynamic>? activities;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? cancelComment;
    String? cancelReason;  

    SchoolVisitDetail({
        this.id,
        this.enquiryId,
        this.schoolVisitDate,
        this.slot,
        this.slotId,
        this.comment,
        this.status,
        this.createdBy,
        this.activities,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.cancelComment,
        this.cancelReason
    });

}