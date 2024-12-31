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

  GetGuardianStudentDetailsStudentModel(
      {this.id, this.studentDisplayName, this.crtEnrOn, this.urlKey});
}

class GetGuardianStudentDetailsMetaModel {
  GetGuardianStudentDetailsMetaModel();
}
