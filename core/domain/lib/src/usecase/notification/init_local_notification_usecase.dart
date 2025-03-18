import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class InitLocalNotificationUseCase
    extends BaseUseCase<BaseError, InitLocalNotificationUseCaseParams, void> {
  final NotificationRepository _notificationRepository;

  InitLocalNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required InitLocalNotificationUseCaseParams params}) {
    return _notificationRepository.initLocalNotification();
  }
}

class InitLocalNotificationUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
