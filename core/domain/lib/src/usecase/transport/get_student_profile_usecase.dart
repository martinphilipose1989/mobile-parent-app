import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetStudentProfileUsecase extends BaseUseCase<NetworkError,
    GetStudentProfileUsecaseParams, GetStudentProfileResponse> {
  final TransportRepository transportRepository;

  GetStudentProfileUsecase({required this.transportRepository});

  @override
  Future<Either<NetworkError, GetStudentProfileResponse>> execute(
      {required GetStudentProfileUsecaseParams params}) {
    return transportRepository.getStudentProfile(params: params);
  }
}

class GetStudentProfileUsecaseParams extends Params {
  final int studentId;

  GetStudentProfileUsecaseParams({super.reloading, required this.studentId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
