import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ScheduleLocalNotificationUseCase extends BaseUseCase<BaseError,
    ScheduleLocalNotificationUseCaseParams, void> {
  final NotificationRepository _notificationRepository;

  ScheduleLocalNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<BaseError, void>> execute(
      {required ScheduleLocalNotificationUseCaseParams params}) async {
    return _notificationRepository.schedule(
        id: params.id,
        title: params.title,
        body: params.body,
        payload: params.payload,
        scheduledDate: params.scheduledDate);
  }
}

class ScheduleLocalNotificationUseCaseParams extends Params {
  final int id;
  final String title;
  final String body;
  final DateTime scheduledDate;
  final Map<String, dynamic> payload;

  ScheduleLocalNotificationUseCaseParams(
      {required this.id,
      required this.title,
      required this.body,
      required this.scheduledDate,
      required this.payload});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
