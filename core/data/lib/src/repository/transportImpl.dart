import 'package:data/data.dart';
import 'package:domain/src/usecase/transport/get_student_attandence_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class TransportRepositoryimpl extends TransportRepository{
  NetworkPort networkPort;

  TransportRepositoryimpl(this.networkPort);

  // @override
  // Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs({required int routeId, required int stopId}) {
  //   // TODO: implement fetchStopLogs
  //   return networkPort.fetchStopLogs(routeId: routeId, stopId: stopId);  }

  @override
  Future<Either<NetworkError, BusStopResponseModel>> getBusStopsList({required String routeId, required int dayId,required String app}) {
return networkPort.getBusStopsList(routeId: routeId, dayId: dayId, app: app);
  }

  @override
  Future<Either<NetworkError, TripResponse>> getMyDutyList({required int pageNo, required int dayId,required int studentId,required String app}) {
 return networkPort.getMyDutyList(page: pageNo, dayId: dayId, studentId: studentId, app: app);
  }

  @override
  Future<Either<NetworkError, GetStudentProfileResponse>> getStudentProfile({required GetStudentProfileUsecaseParams params}) {
    return networkPort.getStudentProfile(params:params);
  }

  @override
  Future<Either<NetworkError, GetStudentAttendance>> getStudentAttendance({required GetStudentAttendanceUsecaseParams params}) {
    return networkPort.getStudentAttendance(params:params);
  }
  
}