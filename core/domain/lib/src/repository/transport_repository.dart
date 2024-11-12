import 'package:domain/domain.dart';
import 'package:domain/src/usecase/transport/get_student_attandence_usecase.dart';

abstract class TransportRepository {
  Future<Either<NetworkError, GetStudentProfileResponse>> getStudentProfile(
      {required GetStudentProfileUsecaseParams params});

  Future<Either<NetworkError, TripResponse>> getMyDutyList(
      {required int pageNo,
      required int dayId,
      required int studentId,
      required String app});

  Future<Either<NetworkError, BusStopResponseModel>> getBusStopsList(
      {required String routeId, required int dayId, required String app});

  Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs(
      {required int routeId, required int stopId});

  Future<Either<NetworkError, GetStudentAttendance>> getStudentAttendance({required GetStudentAttendanceUsecaseParams params});
}
