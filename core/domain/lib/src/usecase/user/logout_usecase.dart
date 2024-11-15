import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class LogoutUsecase extends BaseUseCase<LocalError, LogoutUsecaseParams, bool> {
  final UserRepository _userRepository;

  LogoutUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<LocalError, bool>> execute(
      {required LogoutUsecaseParams params}) async {
    return Future.value(
      (await _userRepository.logOut()).fold(
        (l) => Left(l),
        (result) async {
          return _userRepository.clearSession();
        },
      ),
    );
  }
}

class LogoutUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
