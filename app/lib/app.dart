// import 'package:alice/alice.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependencies.dart';
import 'feature/notification/push_notification_service.dart';
import 'myapp.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(DependencyConfigurationContext());
  // final alice = getIt<Alice>();

  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyDhrNcuys3B6YvkL22dhxJeaEbwSIbosDo",
    appId: "1:79098057580:android:8592c86708a10a60a25949",
    messagingSenderId: "79098057580",
    projectId: "hubblehox-parent",
  ),);

  FirebaseMessaging.instance.getToken().then((value) {
    if (value != null) {
      print("FCM Token" "FCM Token: $value");
    } else {
    print("Error" "Failed to get FCM token");
    }
  }).catchError((error) {
print("Exception" "Error getting FCM token: $error");
  });

  // if (kDebugMode) {
  //   try {
  //     final accessToken = await AccessFirebaseToken.getAccessToken();
  //    print("accessToken" "accessToken $accessToken");
  //   } catch (e) {
  //     Logger.logInfo("Error", AppStringConstants.noInternet);
  //   }
  //}

  await PushNotificationService.init();
  //alice.setNavigatorKey(navigatorKey);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    if (FlavorConfig.isPROD() || FlavorConfig.isQA()) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
    runApp(const ProviderScope(child: MyApp()));
  });
}
