import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';

import '../model/alert_texts.dart';

class FlutterAlertErrorPresenter<T extends AlertTexts>
    extends AlertErrorPresenter<T> {
  FlutterAlertErrorPresenter(
      {super.alertTitle = "", super.positiveButtonText = ""});

  @override
  void show(Exception throwable, BuildContext context, AlertTexts data) {
    final snackBar = SnackBar(
      content: Text(data.message),
      // duration: super.duration.toFlutter(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


