import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateParentDetailsUsecase<T> extends BaseUseCase<BaseError,
    UpdateParentDetailsUsecaseParams, BaseInfo<T>> {
  final RegistrationRepository _registrationRepository;

  UpdateParentDetailsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, BaseInfo<T>>> execute({
    required UpdateParentDetailsUsecaseParams params,
  }) {
    return _registrationRepository.updateParentDetails(
      enquiryID: params.enquiryID,parentInfo: params.parentInfo
    );
  }
}

class UpdateParentDetailsUsecaseParams extends Params {
  final String enquiryID;
  final ParentInfoEntity parentInfo;
  UpdateParentDetailsUsecaseParams({
    required this.enquiryID,
    required this.parentInfo
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}