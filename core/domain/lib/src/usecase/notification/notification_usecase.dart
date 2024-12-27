import 'package:domain/domain.dart';
import 'package:domain/src/repository/notification/notification_repository.dart';

import '../base/base_usecase.dart';

class NotificationUsecase extends BaseUseCase<BaseError,
    NotificationUsecaseParams, NotificationResponseModel> {
  final NotificationRepository notificationRepository;

  NotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<BaseError, NotificationResponseModel>> execute({required NotificationUsecaseParams params}) {
  return notificationRepository.getNotification(
      notificationRequestModel: NotificationRequestModel(userId: params.userId,
      userType: params.userType, type: params.type,
      limit: params.limit,
      page: params.page)
  );
  }
}

class NotificationUsecaseParams extends Params{
 final  int? userId;
 final int? userType;
 final  String? type;
 final int? limit;
  final int? page;

 NotificationUsecaseParams({required this.userId, required this.userType, required this.type, required this.limit,
  required this.page});

 @override
  Either<AppError, bool> verify() {
  return right(true);
  }
}