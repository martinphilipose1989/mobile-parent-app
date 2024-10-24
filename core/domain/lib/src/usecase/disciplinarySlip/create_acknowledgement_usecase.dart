import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CreateAcknowledgementUsecase extends BaseUseCase<BaseError,
CreateAcknowledgementUsecaseParams, AcknowlegementResponseModel> {
  DisciplinarySlipRepository disciplinarySlipRepository;


  CreateAcknowledgementUsecase({required this.disciplinarySlipRepository});

  @override
  Future<Either<BaseError, AcknowlegementResponseModel>> execute({required CreateAcknowledgementUsecaseParams params}) {
  return disciplinarySlipRepository.createAcknowledgeMent(model: params.acknowlegementRequestModel);
  }

}

class CreateAcknowledgementUsecaseParams extends Params{
  AcknowlegementRequestModel acknowlegementRequestModel;

  CreateAcknowledgementUsecaseParams(this.acknowlegementRequestModel);

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}