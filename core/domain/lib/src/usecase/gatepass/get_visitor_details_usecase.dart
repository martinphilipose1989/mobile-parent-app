import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetVisitorDetailsUseCase extends BaseUseCase<NetworkError,
    GetVisitorDetailsUseCaseParams, VisitorDetailsResponseModel> {
  final GatepassRepository _gatePassRepository;

  GetVisitorDetailsUseCase({required GatepassRepository gatePassRepository})
      : _gatePassRepository = gatePassRepository;

  @override
  Future<Either<NetworkError, VisitorDetailsResponseModel>> execute(
      {required GetVisitorDetailsUseCaseParams params}) {
    return _gatePassRepository.getVisitorDetails(params: params);
  }
}

class GetVisitorDetailsUseCaseParams extends Params {
  final String? mobile;
  final dynamic studentId;

  GetVisitorDetailsUseCaseParams({
    super.reloading,
    required this.mobile,
    required this.studentId,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
