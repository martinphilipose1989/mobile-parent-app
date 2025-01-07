import 'dart:convert';
import 'dart:io';

import 'package:app/feature/notification/pushnotification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static init() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("AuthorizationStatus" "User granted permission");
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
   print("Denied" "User denied permission");
    }

    /// when app in foreground
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage? message) {
      print("Info"
            "Got a message whilst in the foreground! ' ${message?.notification?.title} data ${message?.data} ");
        RemoteNotification? notification = message?.notification;
        AndroidNotification? android = message?.notification?.android;
        AppleNotification? ios = message?.notification?.apple;

   print("FirebaseMessaging.onMessage"
            "android?.imageUrl ${android?.imageUrl} ios ${ios?.imageUrl}");

        String? imageUrl;
        if (Platform.isAndroid) {
          imageUrl = android?.imageUrl;
        } else if (Platform.isIOS) {
          imageUrl = ios?.imageUrl;
        }

        /// show local notification
        if (notification != null &&
            android != null &&
            message != null &&
            Platform.isAndroid) {
       PushNotification inotification=   PushNotification(
              id: notification.hashCode,
              title: notification.title,
              body: notification.body,
              // imageUrl: imageUrl,
              // payload: json.encode(message.data)
       );
        }
      },
    );

    /// when app is on background
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    ///  when user open notification from background state
    FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage? message) {
        if (message != null) {
          handleMessage(message: message);
        }
      },
    );
  }

  static void handleMessage(
      {required RemoteMessage message, bool flag = false}) {
    // if (message.data[AppStringConstants.redirect] != null) {
    //   navigateToScreen(
    //     screenName: message.data[AppStringConstants.redirect],
    //     data: message.data,
    //     flag: flag,
    //   );
    // }
  }
  static Future<void> backgroundHandler(RemoteMessage message) async {
    print("Info"
        "backgroundHandler ${message.notification!.title} ${message.data}");
  }
  static void navigateToScreen(
      {required String screenName,
        required Map<String, dynamic> data,
        bool flag = false}) async {
    // final currentRouteName = AppNavigatorObserver().currentRoute?.settings.name;
    // final userId = await SharedPrefHelper.getUserId();
    // final userType = await SharedPrefHelper.getUserType();

  //   if (navigatorKey.currentContext != null) {
  //     switch (screenName) {
  //       case RouteConstants.bookAppointment:
  //         if (userId.isNotEmpty && currentRouteName != screenName) {
  //           final isPending = data['bookDate'] == null || data['bookDate'] == "";
  //           final appointmentArgs = AppointmentDetailsArgs(
  //               scheduleOrReschedule: isPending
  //                   ? Strings.of(navigatorKey.currentContext!).book_appointment
  //                   : Strings.of(navigatorKey.currentContext!).reschedule,
  //               customerId: data['customerId'],
  //               customerName: data['customerName'],
  //               mobileNumber: data['customerMobNumber'],
  //               chassisNumber: data['chassisNumber'],
  //               modelNumber: data['tractorModel'],
  //               dateOfDelivery: data['tractorDeliveryDate'].toString(),
  //               bookDate: isPending
  //                   ? ""
  //                   : (data['bookDate'] != null && data['bookDate'].isNotEmpty
  //                   ? data['bookDate'].toString()
  //                   : ""),
  //               deliveryType: data['deliveryType']);
  //           if (flag) {
  //             Navigator.pushNamedAndRemoveUntil(
  //               navigatorKey.currentContext!,
  //               RouteConstants.bookAppointment,
  //               arguments: appointmentArgs,
  //                   (route) => false,
  //             );
  //           } else {
  //             Navigator.pushNamed(
  //                 navigatorKey.currentContext!, RouteConstants.bookAppointment,
  //                 arguments: appointmentArgs);
  //           }
  //         }
  //         break;
  //       case RouteConstants.userProfile:
  //         if (userId.isNotEmpty && currentRouteName != screenName) {
  //           if (flag) {
  //             Navigator.pushNamedAndRemoveUntil(
  //               navigatorKey.currentContext!,
  //               RouteConstants.userProfile,
  //                   (route) => false,
  //             );
  //           } else {
  //             Navigator.pushNamed(
  //               navigatorKey.currentContext!,
  //               RouteConstants.userProfile,
  //             );
  //           }
  //         }
  //         break;
  //       case AppStringConstants.browser:
  //         if (userType == AppStringConstants.installer) {
  //           Navigator.pushNamedAndRemoveUntil(
  //               navigatorKey.currentContext!,
  //               RouteConstants.installationNotification,
  //               ModalRoute.withName(RouteConstants.installationHome));
  //         } else {
  //           Navigator.pushNamedAndRemoveUntil(
  //               navigatorKey.currentContext!,
  //               RouteConstants.installationNotification,
  //               ModalRoute.withName(RouteConstants.dealerDashboardPage));
  //         }
  //
  //         break;
  //
  //       default:
  //         break;
  //     }
  //   } else {
  //     Logger.logInfo("Info", "Current context is null");
  //   }
  // }

}}



