import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetBrandUsecase
    extends BaseUseCase<NetworkError, GetBrandUsecaseParams, BrandResponse> {
  final EnquiryRepository enquiryRepository;

  GetBrandUsecase({required this.enquiryRepository});

  @override
  Future<Either<NetworkError, BrandResponse>> execute(
      {required GetBrandUsecaseParams params}) {
    return enquiryRepository.getBrandList();
  }
}

class GetBrandUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
