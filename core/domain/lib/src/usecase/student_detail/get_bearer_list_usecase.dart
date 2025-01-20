import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetBearerListUsecase extends BaseUseCase<NetworkError,
    GetBearerListUsecaseParams, GetBearerListResponse> {
  final AdminRepository adminRepository;

  GetBearerListUsecase({required this.adminRepository});

  @override
  Future<Either<NetworkError, GetBearerListResponse>> execute(
      {required GetBearerListUsecaseParams params}) {
    return adminRepository.getBearerList(studentId: params.studentId, platform: params.platform);
  }
}

class GetBearerListUsecaseParams extends Params {
  final int studentId;
  final String platform;

  GetBearerListUsecaseParams( {required this.platform,required this.studentId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
