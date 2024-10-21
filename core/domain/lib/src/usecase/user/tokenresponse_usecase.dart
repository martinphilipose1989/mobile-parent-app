import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class TokenresponseUsecase extends BaseUseCase<NetworkError,
    TokenresponseUsecaseParams, TokenIntrospectionResponse> {
  final UserRepository _userRepository;

  TokenresponseUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Either<NetworkError, TokenIntrospectionResponse>> execute(
      {required TokenresponseUsecaseParams params}) {
    return _userRepository.getTokenResponse();
  }
}

class TokenresponseUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
