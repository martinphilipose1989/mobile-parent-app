class GetsibglingListModel {
  final bool? success;
  final GetsibglingListDataModel? data;
  final Meta? meta;
  final String? message;

  GetsibglingListModel({
    this.success,
    this.data,
    this.meta,
    this.message,
  });
}

class GetsibglingListDataModel {
  final List<Student>? students;

  GetsibglingListDataModel({
    this.students,
  });
}

class Student {
  final int? id;
  final String? studentDisplayName;
  final String? crtEnrOn;
  final String? boardName;
  final String? mobileNo;

  Student({
    this.id,
    this.studentDisplayName,
    this.crtEnrOn,
    this.boardName,
    this.mobileNo,
  });
}

class Meta {
  Meta();
}
