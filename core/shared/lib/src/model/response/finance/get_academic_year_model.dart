class GetAcademicYearModel {
  final int? status;
  final List<YearData>? data;
  final String? message;

  GetAcademicYearModel({
    this.status,
    this.data,
    this.message,
  });
}

class YearData {
  final int? id;
  final String? name;

  YearData({
    this.id,
    this.name,
  });
}
