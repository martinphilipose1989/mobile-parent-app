import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ConfigurePushNotificationUseCase extends BaseUseCase<BaseError,
    ConfigurePushNotificationUseCaseParams, void> {
  final NotificationRepository _notificationRepository;

  ConfigurePushNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required ConfigurePushNotificationUseCaseParams params}) {
    return _notificationRepository.configurePushNotification();
  }
}

class ConfigurePushNotificationUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
