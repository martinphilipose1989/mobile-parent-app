import 'package:domain/domain.dart';
import 'package:domain/src/usecase/marketing/upload_enquiry_document_usecase.dart';
import 'package:domain/src/usecase/transport/get_staff_list_usecase.dart';
import 'package:domain/src/usecase/transport/get_student_attandence_usecase.dart';
import 'package:domain/src/usecase/transport/upload_intimation_file.dart';

import '../usecase/transport/create_intimation_usecase.dart';

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
      {required int routeId,required String platform});

  Future<Either<NetworkError, GetStudentAttendance>> getStudentAttendance({required GetStudentAttendanceUsecaseParams params});

  Future<Either<NetworkError, StaffListResponseModel>> getStaffList(
      {required GetStaffListUseCaseParams staffListusecaseparams});



  Future<Either<NetworkError, CreateIntimationResponseModel>>createIntimation(
      {required CreateIntimationUseCaseParams createIntimationUseCase});



  Future<Either<NetworkError, UploadIntimationFileResponseModel>>uploadIntimationFile(
      {required UploadIntimationFileUseCaseParams params});




}
