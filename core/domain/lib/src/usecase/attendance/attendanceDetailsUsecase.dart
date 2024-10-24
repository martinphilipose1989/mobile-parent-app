import 'package:domain/domain.dart';
import 'package:domain/src/repository/attendance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class AttendanceDetailUsecase extends BaseUseCase<BaseError,AttendanceDetailUsecaseParams ,AttendanceDetailsResponseModel> {

  final AttendanceRepository attendanceRepository;

  AttendanceDetailUsecase({required this.attendanceRepository});

  @override
  Future<Either<BaseError, AttendanceDetailsResponseModel>> execute({required AttendanceDetailUsecaseParams params}) {
    return attendanceRepository.getAttendanceDetails(model: params.attendanceDetailsRequestModel);

  }



}
class AttendanceDetailUsecaseParams extends Params {
  AttendanceDetailsRequestModel attendanceDetailsRequestModel;


  AttendanceDetailUsecaseParams( this.attendanceDetailsRequestModel);

  @override
  Either<AppError, bool> verify() {
    return right(true);
  }
}