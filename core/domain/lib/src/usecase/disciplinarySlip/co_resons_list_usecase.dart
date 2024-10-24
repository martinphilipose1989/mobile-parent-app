import '../../../domain.dart';
import '../base/base_usecase.dart';

class CoReasonsListUsecase extends BaseUseCase<BaseError,
    CoReasonsListParams, CoReasonsListResponseModel> {
  DisciplinarySlipRepository disciplinarySlipRepository;
  CoReasonsListUsecase({required this.disciplinarySlipRepository});
  @override
  Future<Either<BaseError, CoReasonsListResponseModel>> execute({required CoReasonsListParams params}) {
  return disciplinarySlipRepository.getCoReasons();
  }


}

class CoReasonsListParams extends Params{
  CoReasonsListParams();
  @override
  Either<AppError, bool> verify() {
   return right(true);
  }


}