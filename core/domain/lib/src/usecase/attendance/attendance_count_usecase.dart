import 'package:domain/domain.dart';

import 'package:domain/src/usecase/base/base_usecase.dart';

class AttendanceCountUsecase extends BaseUseCase<BaseError,
    AttendanceCountUsecaseParams, AttendanceCountResponseModel> {
  final AttendanceRepository attendanceRepository;

  AttendanceCountUsecase({required this.attendanceRepository});

  @override
  Future<Either<BaseError, AttendanceCountResponseModel>> execute(
      {required AttendanceCountUsecaseParams params}) {
    return attendanceRepository.getAttendanceCount(
        model: params.attendanceCountRequestModel);
  }
}

class AttendanceCountUsecaseParams extends Params {
  AttendanceCountRequestModel attendanceCountRequestModel;

  AttendanceCountUsecaseParams({required this.attendanceCountRequestModel});

  @override
  Either<AppError, bool> verify() {
    return right(true);
  }
}
