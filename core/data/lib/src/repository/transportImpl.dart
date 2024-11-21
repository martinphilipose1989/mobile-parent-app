import 'package:data/data.dart';
import 'package:domain/src/usecase/transport/create_intimation_usecase.dart';
import 'package:domain/src/usecase/transport/get_student_attandence_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class TransportRepositoryimpl extends TransportRepository{
  NetworkPort networkPort;

  TransportRepositoryimpl(this.networkPort);

  @override
  Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs({required int routeId, required String platform}) {
    // TODO: implement fetchStopLogs
    return networkPort.fetchStopLogs(routeId: routeId, platform: platform, );  }

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

  @override
  Future<Either<NetworkError, StaffListResponseModel>> getStaffList({required GetStaffListUseCaseParams staffListusecaseparams}) {
   return networkPort.getStaffList(params: staffListusecaseparams);
  }

  @override
  Future<Either<NetworkError, CreateIntimationResponseModel>> createIntimation({required CreateIntimationUseCaseParams createIntimationUseCase}) {
    // TODO: implement createIntimation
   return networkPort.createIntimation(requestModel: CreateIntimationRequestModel(globalUserId:createIntimationUseCase.globalUserId ,globalStudentId: createIntimationUseCase.globalStudentId,fromDate: createIntimationUseCase.fromDate,
     toDate: createIntimationUseCase.toDate,status: createIntimationUseCase.status,
     initimationType:createIntimationUseCase.initimationType,
     note: createIntimationUseCase.note,
     fileAttachment:createIntimationUseCase.fileAttachment ,
     approvalFlag:createIntimationUseCase.approvalFlag ,
     approvedById: createIntimationUseCase.approvedById,));
  }

  @override
  Future<Either<NetworkError, UploadIntimationFileResponseModel>> uploadIntimationFile({required UploadIntimationFileUseCaseParams params}) {
   return networkPort.uploadIntimationFile(documentID: params.id, file: params.file);
  }
  
}