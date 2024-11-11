import 'stop_response.dart';

class TransportRouteStopMapping {
  String? id;

  int? orderNo;

  String? approxTime;

  String? createdAt;

  String? updatedAt;

  Stop? stop;

  TransportRouteStopMapping(
      {this.id,
      this.orderNo,
      this.approxTime,
      this.createdAt,
      this.updatedAt,
      this.stop});
}
