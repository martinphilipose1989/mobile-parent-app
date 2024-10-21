class DisciplinaryListModel {
  int status;
  Data data;
  String message;
  bool success;

  DisciplinaryListModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

}

class Data {
  List<dynamic> data;
  DisciplinarySlipMeta meta;

  Data({
    required this.data,
    required this.meta,
  });

}

class DisciplinarySlipMeta {
  int total;
  int pageSize;
  int numOfPages;

  DisciplinarySlipMeta({
    required this.total,
    required this.pageSize,
    required this.numOfPages,
  });

}
