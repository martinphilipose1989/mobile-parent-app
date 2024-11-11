import 'dart:io';

import 'package:domain/domain.dart';

abstract class TransportRepository {


  Future<Either<NetworkError, GetStudentProfileResponse>> getStudentProfile(
      {required int studentId});

  Future<Either<NetworkError, TripResponse>> getMyDutyList(
      {required int pageNo, required int dayId});

  Future<Either<NetworkError, BusStopResponseModel>> getBusStopsList(
      {required String routeId, required int dayId});

  Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs(
      {required int routeId, required int stopId});


}
