import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetStudentAttendanceUseCase extends BaseUseCase<NetworkError,
    GetStudentAttendanceUsecaseParams, GetStudentAttendance> {
  final TransportRepository transportRepository;

  GetStudentAttendanceUseCase({required this.transportRepository});

  @override
  Future<Either<NetworkError, GetStudentAttendance>> execute(
      {required GetStudentAttendanceUsecaseParams params}) {
    return transportRepository.getStudentAttendance(params: params);
  }
}

class GetStudentAttendanceUsecaseParams extends Params {
  final int studentId;

  GetStudentAttendanceUsecaseParams({super.reloading, required this.studentId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
