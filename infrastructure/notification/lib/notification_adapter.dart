import 'dart:async';
import 'dart:convert';

import 'package:data/data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final StreamController<String> selectNotificationSubject =
    StreamController<String>();

class NotificationAdapter implements NotificationPort {
  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  var androidPlatformChannelSpecifics;
  var iOSPlatformChannelSpecifics;

  StreamController<NotificationMessage> notificationController =
      StreamController<NotificationMessage>();

  @override
  Future<Either<LocalError, void>> cancelAllLocalNotification() async {
    return Right(await _flutterLocalNotificationsPlugin?.cancelAll());
  }

  @override
  Future<Either<LocalError, void>> configureOnLaunchPushNotification() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      AmpersandRemoteMessage remoteMessage =
          initialMessage.mapToDsRemoteMessage();

      NotificationMessage notification =
          NotificationMessage.fromFirebaseNotification(
              remoteMessage, NotificationMessageTypeEnum.onLaunch);

      selectNotificationSubject.add(
        jsonEncode(notification.payload),
      );
    }
    return const Right(null);
  }

  @override
  Future<Either<LocalError, void>> configurePushNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage>> $message ${message.messageId}");

      if (message.messageId?.isNotEmpty ?? false) {
        AmpersandRemoteMessage remoteMessage = message.mapToDsRemoteMessage();

        NotificationMessage notification =
            NotificationMessage.fromFirebaseNotification(
                remoteMessage, NotificationMessageTypeEnum.onMessage);

        notificationController.add(notification);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp>> $message");

      AmpersandRemoteMessage remoteMessage = message.mapToDsRemoteMessage();

      NotificationMessage notification =
          NotificationMessage.fromFirebaseNotification(
              remoteMessage, NotificationMessageTypeEnum.onMessage);

      selectNotificationSubject.add(
        jsonEncode(notification.payload),
      );
    });
    FirebaseMessaging.instance.subscribeToTopic("all");
    return const Right(null);
  }

  @override
  Future<Either<LocalError, String>> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();

    return Right(token ?? "");
  }

  @override
  Future<Either<LocalError, void>> init() async {
    if (_flutterLocalNotificationsPlugin == null) {
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'PARENT1', // channel_id
        'PARENT', // channel_name
        description: '', // channel_description
        importance: Importance.max,
        showBadge: true,
        playSound: true,
      );
      _flutterLocalNotificationsPlugin
          ?.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      androidPlatformChannelSpecifics = AndroidNotificationDetails(
          channel.id, channel.name,
          channelDescription: channel.description,
          icon: 'ic_launcher',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          largeIcon: const DrawableResourceAndroidBitmap('ic_launcher'));

      iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

      var initializationSettingsAndroid =
          const AndroidInitializationSettings('ic_launcher');

      var initializationSettingsIOS = const DarwinInitializationSettings();

      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      _flutterLocalNotificationsPlugin?.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (data) {
        if (data.payload != null) {
          selectNotificationSubject.add(data.payload ?? "");
        }
      });
    }
    return const Right(null);
  }

  @override
  Future<Either<LocalError, Stream<NotificationMessage>>>
      listenPushNotification() async {
    return Right(notificationController.stream);
  }

  @override
  Future<Either<LocalError, bool>> requestNotificationPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    return Right(
        settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional);
  }

  @override
  Future<Either<LocalError, void>> schedule(int id, String title, String body,
      DateTime scheduledDate, Map<String, dynamic> payload) async {
    try {
      await _flutterLocalNotificationsPlugin?.show(
        id,
        title,
        body,
        NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iOSPlatformChannelSpecifics),
        payload: jsonEncode(payload),
      );
    } on Exception catch (exception) {
      print(exception.toString());
    }

    return const Right(null);
  }

  @override
  Future<Either<LocalError, void>> unSubscribeToNotification() async {
    return Right(await FirebaseMessaging.instance.deleteToken());
  }
}

extension RemoteMessageExt on RemoteMessage {
  AmpersandRemoteMessage mapToDsRemoteMessage() {
    return AmpersandRemoteMessage(
        collapseKey: collapseKey,
        from: from,
        messageId: messageId,
        messageType: messageType,
        ttl: ttl,
        data: data,
        notification: AmpersandRemoteNotification(
          title: notification?.title ?? "",
          body: notification?.body ?? "",
        ));
  }
}
