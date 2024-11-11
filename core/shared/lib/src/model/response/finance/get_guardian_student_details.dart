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
  final String? studentDisplayName;
  final String? crtEnrOn;

  GetGuardianStudentDetailsStudentModel({
    this.id,
    this.studentDisplayName,
    this.crtEnrOn,
  });
}

class GetGuardianStudentDetailsMetaModel {
  GetGuardianStudentDetailsMetaModel();
}
