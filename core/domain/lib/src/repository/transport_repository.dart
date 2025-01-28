import 'package:domain/domain.dart';

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
      {required int routeId, required String platform});

  Future<Either<NetworkError, GetStudentAttendance>> getStudentAttendance(
      {required GetStudentAttendanceUsecaseParams params});

  Future<Either<NetworkError, StaffListResponseModel>> getStaffList(
      {required GetStaffListUseCaseParams staffListusecaseparams});

  Future<Either<NetworkError, CreateIntimationResponseModel>> createIntimation(
      {required CreateIntimationUseCaseParams createIntimationUseCase});

  Future<Either<NetworkError, UploadIntimationFileResponseModel>>
      uploadIntimationFile({required UploadIntimationFileUseCaseParams params});
}
