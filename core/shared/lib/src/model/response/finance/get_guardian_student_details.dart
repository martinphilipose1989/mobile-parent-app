class GetGuardianStudentDetailsModel {
  final bool? success;
  final GetGuardianStudentDetailsDataModel? data;
  final GetGuardianStudentDetailsMetaModel? meta;
  final String? message;

  GetGuardianStudentDetailsModel({
    this.success,
    this.data,
    this.meta,
    this.message,
  });
}

class GetGuardianStudentDetailsDataModel {
  final List<GetGuardianStudentDetailsStudentModel>? students;

  GetGuardianStudentDetailsDataModel({
    this.students,
  });
}

class GetGuardianStudentDetailsStudentModel {
  dynamic id;
  String? studentDisplayName;
  String? crtEnrOn;
  String? urlKey;

  int? studentYearlyId;

  String? undertakingTakenOn;

  String? ipDuringUndertaking;

  bool? isUndertakingTaken;

  int? schoolId;

  int? boardId;

  String? boardName;

  int? gradeId;

  String? gradeName;

  int? shiftId;

  String? shiftName;

  int? divisionId;

  String? division;

  int? streamId;

  String? streamName;

  int? crtLobId;

  int? courseId;

  String? undertakingFile;

  GetGuardianStudentDetailsStudentModel(
      {this.id,
      this.studentDisplayName,
      this.crtEnrOn,
      this.urlKey,
      this.studentYearlyId,
      this.undertakingTakenOn,
      this.ipDuringUndertaking,
      this.isUndertakingTaken,
      this.schoolId,
      this.boardId,
      this.boardName,
      this.gradeId,
      this.gradeName,
      this.shiftId,
      this.shiftName,
      this.divisionId,
      this.division,
      this.streamId,
      this.streamName,
      this.crtLobId,
      this.courseId,
      this.undertakingFile});
}

class GetGuardianStudentDetailsMetaModel {
  GetGuardianStudentDetailsMetaModel();
}
