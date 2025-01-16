import 'dart:io';

import 'package:app/env/env_dev.dart';
import 'package:app/env/env_prod.dart';
import 'package:app/env/env_qa.dart';
import 'package:firebase_core/firebase_core.dart';

import 'flavor_config.dart';

class FirebaseConfig {
  static FirebaseOptions get firebaseOptions {
    if (FlavorConfig.isDEV()) {
      if (Platform.isAndroid) {
        return FirebaseOptions(
          apiKey: EnvDev.androidApiKey,
          appId: EnvDev.androidAppId,
          messagingSenderId: EnvDev.senderId,
          projectId: EnvDev.projectId,
        );
      } else if (Platform.isIOS) {
        return FirebaseOptions(
          apiKey: EnvDev.iosApiKey,
          appId: EnvDev.iosAppId,
          messagingSenderId: EnvDev.senderId,
          projectId: EnvDev.projectId,
        );
      }
    } else if (FlavorConfig.isQA()) {
      if (Platform.isAndroid) {
        return FirebaseOptions(
            apiKey: EnvQA.androidApiKey,
            //"AIzaSyDhrNcuys3B6YvkL22dhxJeaEbwSIbosDo",
            //"ANDROID_QA_API_KEY",
            appId: EnvQA.androidAppId,
            //    "1:79098057580:android:8592c86708a10a60a25949",
            //"ANDROID_QA_APP_ID",
            messagingSenderId: EnvQA.senderId,
            //   "79098057580",
            //"ANDROID_QA_SENDER_ID",
            projectId: EnvQA.projectId

            //"ANDROID_QA_PROJECT_ID",
            );
      } else if (Platform.isIOS) {
        return FirebaseOptions(
            apiKey: EnvQA.iosApiKey,
            appId: EnvQA.androidAppId,
            messagingSenderId: EnvQA.senderId,
            projectId: EnvQA.projectId);
      }
    } else if (FlavorConfig.isPROD()) {
      if (Platform.isAndroid) {
        return FirebaseOptions(
            apiKey: EnvProd.androidApiKey,
            appId: EnvProd.androidAppId,
            messagingSenderId: EnvProd.senderId,
            projectId: EnvProd.projectId);
      } else if (Platform.isIOS) {
        return FirebaseOptions(
          apiKey: EnvProd.iosApiKey,
          appId: EnvProd.iosAppId,
          messagingSenderId: EnvProd.senderId,
          projectId: EnvProd.projectId,
        );
      }
    }

    throw Exception("Flavor or Platform not supported");
  }
}
