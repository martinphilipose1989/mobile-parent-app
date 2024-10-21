import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class AuthUsecase extends BaseUseCase<BaseError, AuthUsecaseParams, bool> {
  final UserRepository _userRepository;

  AuthUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Either<BaseError, bool>> execute(
      {required AuthUsecaseParams params}) async {
    return Future.value(
      (await _userRepository.login()).fold((l) => Left(l), (result) async {
        return _userRepository.storeAccessToken(result);
      }),
    );
  }
}

class AuthUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
