class NotificationResponseModel {
  int? status;
 NotificationData? data;
  String? message;

  NotificationResponseModel({
    this.status,
    this.data,
    this.message,
  });

}

class  NotificationData{
  List<NotificationDetail>? data;
  int? totalCount;

  NotificationData({
    this.data,
    this.totalCount,
  });

}

class NotificationDetail {
  String? id;
  dynamic readAt;
  int? userId;
  int? userType;
  int? groupId;
  Mode? mode;
  String? communicationMasterId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NotificationDetail({
  required  this.id,
   required this.readAt,
    required this.userId,
   required this.userType,
   required this.groupId,
   required this.mode,
    required this.communicationMasterId,
   required this.createdAt,
   required this.updatedAt,
   required this.v,
  });

}


class Mode {
  ModeContent? modeContent;

  Mode({required this.modeContent,
  });

}

class   ModeContent {
  String? subject;
  String? content;

  ModeContent({
    this.subject,
    this.content,
  });

}
