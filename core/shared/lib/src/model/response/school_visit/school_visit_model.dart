class SchoolVisitDetail {
    String? id;
    String? enquiryId;
    DateTime? schoolVisitDate;
    String? schoolVisitTime;
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
        this.schoolVisitTime,
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