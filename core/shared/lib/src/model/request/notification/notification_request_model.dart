class NotificationRequestModel {
  int? userId;
  int? userType;
  String? type;
  int? limit;
  int? page;

  NotificationRequestModel({
   required this.userId,
   required this.userType,
   required this.type,
   required this.limit,
   required this.page,
  });

}
