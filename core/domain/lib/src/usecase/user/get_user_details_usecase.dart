import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetUserDetailsUsecase
    extends BaseUseCase<LocalError, GetUserDetailsUsecaseParams, User> {
  final UserRepository _userRepository;

  GetUserDetailsUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<LocalError, User>> execute(
      {required GetUserDetailsUsecaseParams params}) {
    return _userRepository.getUserDetails();
  }
}

class GetUserDetailsUsecaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
