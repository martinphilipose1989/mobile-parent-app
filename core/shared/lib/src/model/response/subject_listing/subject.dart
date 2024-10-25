class Subject {
    int? id;
    int? schoolId;
    int? schoolBrandId;
    int? subjectId;
    int? isCompulsory;
    int? isOptionalCompulsory;
    int? orderNo;
    int? academicYearId;
    int? statusId;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic createdById;
    dynamic updatedById;
    String? schoolName;
    String? subjectName;
    String? academicYear;
    String? brandName;
    String? boardName;
    String? courseName;
    String? streamName;
    String? gradeName;
    String? termName;
    dynamic optionNumber;

    Subject({
        this.id,
        this.schoolId,
        this.schoolBrandId,
        this.subjectId,
        this.isCompulsory,
        this.isOptionalCompulsory,
        this.orderNo,
        this.academicYearId,
        this.statusId,
        this.createdAt,
        this.updatedAt,
        this.createdById,
        this.updatedById,
        this.schoolName,
        this.subjectName,
        this.academicYear,
        this.brandName,
        this.boardName,
        this.courseName,
        this.streamName,
        this.gradeName,
        this.termName,
        this.optionNumber,
    });

}