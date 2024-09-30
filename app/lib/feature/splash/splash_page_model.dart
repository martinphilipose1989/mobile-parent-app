import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;
  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  late Timer future;

  SplashViewModel(@factoryParam this.myBaseUrl, this.exceptionHandlerBinder) {
    future = Timer(const Duration(seconds: 2), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  void test() {
    exceptionHandlerBinder.handle(block: () {
      debugPrint("exceptionHandlerBinder start");
      throw const FormatException("Something is wrong");
    }).execute();
  }

  @override
  void dispose() {
    future.cancel();
    _navigateToDashboardController.close();
    super.dispose();
  }
}
