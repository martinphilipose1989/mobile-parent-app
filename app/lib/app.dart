import 'package:app/flavors/flavor_config.dart';
import 'package:dependency_injection/dependency_injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/notification.dart';
// import 'package:push_notification/notification.dart';
import 'package:services/services.dart';

import 'dependencies.dart';

import 'flavors/firebase_config.dart';
import 'myapp.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(DependencyConfigurationContext());
  // final alice = getIt<Alice>();

// if(FlavorConfig.isQA())
//   if (Platform.isAndroid)
//     await Firebase.initializeApp(
//         options: FirebaseOptions(
//             apiKey: "AIzaSyDhrNcuys3B6YvkL22dhxJeaEbwSIbosDo",
//             appId: "1:79098057580:android:8592c86708a10a60a25949",
//             messagingSenderId: "79098057580",
//             projectId: "hubblehox-parent",
//           ///  iosBundleId:"com.hubblehox.hubbleorion",
//
//         )
//     );
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: FirebaseConfig.firebaseOptions,
    );
  }
  // if (Firebase.apps.isEmpty) {
  //   await Firebase.initializeApp(
  //  // name: "hubblehox-parent",
  //       options: FirebaseOptions(
  //           apiKey: "AIzaSyBhw2KUhoEL0rY4jtf7YUtyLdCzQhvY3eY",
  //           appId: "1:79098057580:android:8592c86708a10a60a25949",
  //           messagingSenderId: "79098057580",
  //           projectId: "hubblehox-parent",
  //           iosBundleId:"com.hubblehox.hubbleorion",
  //
  //       )
  //   );
  // } else {
  //   print("Firebase already initialized");
  // }

  FirebaseMessaging.instance.getToken().then((value) {
    if (value != null) {
      SharedPreferenceHelper.saveString("token", value);
    } else {}
  }).catchError((error) {});

  // if (kDebugMode) {
  //   try {
  //     final accessToken = await AccessFirebaseToken.getAccessToken();
  //    print("accessToken" "accessToken $accessToken");
  //   } catch (e) {
  //     Logger.logInfo("Error", AppStringConstants.noInternet);
  //   }
  //}

  // await PushNotificationService.init();
  //alice.setNavigatorKey(navigatorKey);
  // alice.setNavigatorKey(navigatorKey);
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
