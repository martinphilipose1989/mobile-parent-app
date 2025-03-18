import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UnSubscribePushNotificationUseCase extends BaseUseCase<BaseError,
    UnSubscribePushNotificationUseCaseParams, void> {
  final NotificationRepository _notificationRepository;

  UnSubscribePushNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required UnSubscribePushNotificationUseCaseParams params}) {
    return _notificationRepository.unSubscribeToNotification();
  }
}

class UnSubscribePushNotificationUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
