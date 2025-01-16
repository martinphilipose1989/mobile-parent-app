import 'dart:io';

import 'package:app/env/env_dev.dart';
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
          messagingSenderId: EnvDev.androidSenderId,
          projectId: EnvDev.androidProjectId,
        );
      } else if (Platform.isIOS) {
        return FirebaseOptions(
          apiKey: "IOS_DEV_API_KEY",
          appId: "IOS_DEV_APP_ID",
          messagingSenderId: "IOS_DEV_SENDER_ID",
          projectId: "IOS_DEV_PROJECT_ID",
          iosBundleId: "IOS_DEV_BUNDLE_ID",
        );
      }
    } else if (FlavorConfig.isQA()) {
      if (Platform.isAndroid) {
        return FirebaseOptions(
          apiKey:EnvQA.androidApiKey,
          //"AIzaSyDhrNcuys3B6YvkL22dhxJeaEbwSIbosDo",
          //"ANDROID_QA_API_KEY",
          appId: EnvQA.androidAppId,
      //    "1:79098057580:android:8592c86708a10a60a25949",
          //"ANDROID_QA_APP_ID",
          messagingSenderId: EnvQA.androidSenderId,
       //   "79098057580",
          //"ANDROID_QA_SENDER_ID",
          projectId: EnvQA.androidProjectId
          //"ANDROID_QA_PROJECT_ID",
        );
      } else if (Platform.isIOS) {
        return FirebaseOptions(
          apiKey: "AIzaSyBhw2KUhoEL0rY4jtf7YUtyLdCzQhvY3eY",
          appId: EnvQA.androidAppId,
          messagingSenderId: EnvQA.androidSenderId,
          projectId: EnvQA.androidProjectId,
          iosBundleId: "com.hubblehox.hubbleorion",
        );
      }
    } else if (FlavorConfig.isPROD()) {
      if (Platform.isAndroid) {
        return FirebaseOptions(
          apiKey: "ANDROID_PROD_API_KEY",
          appId: "ANDROID_PROD_APP_ID",
          messagingSenderId: "ANDROID_PROD_SENDER_ID",
          projectId: "ANDROID_PROD_PROJECT_ID",
        );
      } else if (Platform.isIOS) {
        return FirebaseOptions(
          apiKey: "IOS_PROD_API_KEY",
          appId: "IOS_PROD_APP_ID",
          messagingSenderId: "IOS_PROD_SENDER_ID",
          projectId: "IOS_PROD_PROJECT_ID",
          iosBundleId: "IOS_PROD_BUNDLE_ID",
        );
      }
    }

    throw Exception("Flavor or Platform not supported");
  }
}
