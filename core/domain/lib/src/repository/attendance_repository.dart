import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class AttendanceRepository{
  Future<Either<NetworkError,AttendanceCountResponseModel>> getAttendanceCount(
  {required AttendanceCountRequestModel model});

  Future<Either<NetworkError,AttendanceDetailsResponseModel>> getAttendanceDetails(
      {required AttendanceDetailsRequestModel model});


}