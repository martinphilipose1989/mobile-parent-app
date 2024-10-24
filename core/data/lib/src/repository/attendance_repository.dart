import '../../data.dart';

class AttendanceRepositoryImpl implements AttendanceRepository{
  NetworkPort networkPort;

  AttendanceRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, AttendanceCountResponseModel>> getAttendanceCount({required AttendanceCountRequestModel model}) {
 return networkPort.getAttendanceCount(attendanceRequestModel: model);
  }

  @override
  Future<Either<NetworkError, AttendanceDetailsResponseModel>> getAttendanceDetails({required AttendanceDetailsRequestModel model}) {
   return networkPort.getAttendancedetail(attendanceRequestModel: model);
  }
  
}