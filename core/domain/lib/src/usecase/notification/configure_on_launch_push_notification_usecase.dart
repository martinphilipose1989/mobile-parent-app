import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ConfigureOnLaunchPushNotificationUseCase extends BaseUseCase<BaseError,
    ConfigureOnLaunchPushNotificationUseCaseParams, void> {
  final NotificationRepository _notificationRepository;

  ConfigureOnLaunchPushNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required ConfigureOnLaunchPushNotificationUseCaseParams params}) {
    return _notificationRepository.configureOnLaunchPushNotification();
  }
}

class ConfigureOnLaunchPushNotificationUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
