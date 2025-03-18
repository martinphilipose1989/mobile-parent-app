import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCityStateByPincodeUsecase extends BaseUseCase<BaseError,
    GetCityStateByPincodeUsecaseParams, CityAndStateResponse> {
  final EnquiryRepository _enquiryRepository;

  GetCityStateByPincodeUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, CityAndStateResponse>> execute({
    required GetCityStateByPincodeUsecaseParams params,
  }) {
    return _enquiryRepository.getCityAndStateByPincode(
      pincode: params.pincode
    );
  }
}

class GetCityStateByPincodeUsecaseParams extends Params {
  final String pincode;
  GetCityStateByPincodeUsecaseParams({
    required this.pincode,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}