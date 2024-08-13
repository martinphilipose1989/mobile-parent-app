import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetRegistrationDetailUsecase<T> extends BaseUseCase<BaseError,
    GetRegistrationDetailUsecaseParams, BaseInfo<T>> {
  final RegistrationRepository _registrationRepository;

  GetRegistrationDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, BaseInfo<T>>> execute({
    required GetRegistrationDetailUsecaseParams params,
  }) {
    return _registrationRepository.getRegistrationDetail(
      enquiryID: params.enquiryID,infoType: params.infoType
    );
  }
}

class GetRegistrationDetailUsecaseParams extends Params {
  final String enquiryID;
  final String infoType;
  GetRegistrationDetailUsecaseParams({
    required this.enquiryID,
    required this.infoType
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}