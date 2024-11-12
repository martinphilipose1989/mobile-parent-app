import 'package:data/data.dart';

class TransportRepositoryimpl extends TransportRepository{
  NetworkPort networkPort;

  TransportRepositoryimpl(this.networkPort);

  @override
  Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs({required int routeId, required int stopId}) {
    // TODO: implement fetchStopLogs
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, BusStopResponseModel>> getBusStopsList({required String routeId, required int dayId,required String app}) {
return networkPort.getBusStopsList(routeId: routeId, dayId: dayId, app: app);
  }

  @override
  Future<Either<NetworkError, TripResponse>> getMyDutyList({required int pageNo, required int dayId,required int studentId,required String app}) {
 return networkPort.getMyDutyList(page: pageNo, dayId: dayId, studentId: studentId, app: app);
  }

  @override
  Future<Either<NetworkError, GetStudentProfileResponse>> getStudentProfile({required int studentId}) {
    // TODO: implement getStudentProfile
    throw UnimplementedError();
  }
  
}