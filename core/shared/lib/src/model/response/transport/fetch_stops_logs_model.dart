class FetchStopLogsModel {
  int? status;
  List<FetchStopLogsData>? data;
  String? message;

  FetchStopLogsModel({
    this.status,
    this.data,
    this.message,
  });
}

class FetchStopLogsData {
  String? id;
  int? routeId;
  int? stopId;
  String? stopStatus;
  String? time;
  DateTime? createdAt;
  DateTime? updatedAt;

  FetchStopLogsData({
    this.id,
    this.routeId,
    this.stopId,
    this.stopStatus,
    this.time,
    this.createdAt,
    this.updatedAt,
  });
}
