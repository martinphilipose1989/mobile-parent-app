import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RequestNotificationPermissionUseCase extends BaseUseCase<BaseError,
    RequestNotificationPermissionUseCaseParams, bool> {
  final NotificationRepository _notificationRepository;

  RequestNotificationPermissionUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, bool>> execute(
      {required RequestNotificationPermissionUseCaseParams params}) {
    return _notificationRepository.requestNotificationPermission();
  }
}

class RequestNotificationPermissionUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
