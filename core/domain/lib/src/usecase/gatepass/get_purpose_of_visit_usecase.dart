import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetPurposeOfVisitListUsecase extends BaseUseCase<NetworkError,
    GetPurposeOfVisitListUsecaseParams, MdmCoReasonResponseModel> {
  final GatepassRepository _gatepassRepository;

  GetPurposeOfVisitListUsecase({required GatepassRepository gatepassRepository})
      : _gatepassRepository = gatepassRepository;

  @override
  Future<Either<NetworkError, MdmCoReasonResponseModel>> execute(
      {required GetPurposeOfVisitListUsecaseParams params}) {
    return _gatepassRepository.getPurposeOfVisitList();
  }
}

class GetPurposeOfVisitListUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
