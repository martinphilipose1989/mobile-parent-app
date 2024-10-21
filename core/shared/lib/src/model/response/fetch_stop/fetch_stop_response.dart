import 'package:shared/shared.dart';

class FetchStopResponseModel {
    int? status;
    List<StopDetail>? data;
    String? message;

    FetchStopResponseModel({
        this.status,
        this.data,
        this.message,
    });

}