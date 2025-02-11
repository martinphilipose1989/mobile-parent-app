import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ListenNotificationUseCase extends BaseUseCase<BaseError,
    ListenNotificationUseCaseParams, Stream<NotificationMessage>> {
  final NotificationRepository _notificationRepository;

  ListenNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, Stream<NotificationMessage>>> execute(
      {required ListenNotificationUseCaseParams params}) {
    return _notificationRepository.listenPushNotification();
  }
}

class ListenNotificationUseCaseParams extends Params {
  ListenNotificationUseCaseParams();

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
