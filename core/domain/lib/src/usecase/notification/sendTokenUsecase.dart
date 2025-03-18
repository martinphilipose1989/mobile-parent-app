import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

import '../base/base_usecase.dart';

class Sendtokenusecase extends BaseUseCase<BaseError, SendTokenUseCaseParams,
    SendTokenResponseModel> {
  final AdminRepository adminRepository;

  Sendtokenusecase({required this.adminRepository});

  @override
  Future<Either<BaseError, SendTokenResponseModel>> execute(
      {required SendTokenUseCaseParams params}) {
    return adminRepository.sendToken(
      id: params.userid,
      token: SendTokenRequestEntity(
          tokenEntity: TokenEntity(appToken: params.appToken)),
    );
  }
}

class SendTokenUseCaseParams extends Params {
  final int? userid;
  final String? appToken;

  SendTokenUseCaseParams({required this.userid, required this.appToken});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
