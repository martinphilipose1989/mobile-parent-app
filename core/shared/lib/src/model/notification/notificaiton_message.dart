import 'dart:io';

import 'package:shared/src/const/notification_type_enum.dart';

import 'remote_message.dart';

class NotificationMessage {
  String? id;
  NotificationMessageTypeEnum? notificationMessageType;
  Map<String, dynamic>? payload;
  String? title;
  String? body;

  NotificationMessage(
      {this.id,
      this.title,
      this.body,
      this.notificationMessageType,
      this.payload});

  factory NotificationMessage.fromFirebaseNotification(
      AmpersandRemoteMessage message,
      NotificationMessageTypeEnum notificationMessageTypeEnum) {
    try {
      if (Platform.isAndroid) {
        //   Map<String, dynamic> data = message.data ?? {};

        String title = message.notification?.title ?? "";
        String body = message.notification?.body ?? "";

        //   Map<String, dynamic> payload = {};

        return NotificationMessage(
            id: message.messageId,
            notificationMessageType: notificationMessageTypeEnum,
            //    payload: payload,
            title: title,
            body: body);
      } else {
        //  Map<String, dynamic> data = message.data ?? {};

        String title = message.notification?.title ?? "";
        String body = message.notification?.body ?? "";
        //   Map<String, dynamic> payload = {};

        return NotificationMessage(
            id: message.messageId,
            notificationMessageType: notificationMessageTypeEnum,
            // payload: payload,
            title: title,
            body: body);
      }
    } catch (exception) {
      print(exception.toString());
      rethrow;
    }
  }
}

extension DefaultMap<K, V> on Map<K, V> {
  V? getOrElse(K key, V defaultValue) {
    if (containsKey(key)) {
      return ((this[key] == null) ||
              (defaultValue is String
                  ? (this[key] != null && (this[key] as String).isEmpty)
                  : false))
          ? defaultValue
          : this[key];
    } else {
      return defaultValue;
    }
  }
}
