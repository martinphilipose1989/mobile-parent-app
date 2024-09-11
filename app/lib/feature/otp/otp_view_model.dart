import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class OtpPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  OtpPageModel(this.exceptionHandlerBinder);
  late TabController tabController;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailContoller = TextEditingController();
  final BehaviorSubject<bool> openBottomSheet =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> otpExpired = BehaviorSubject<bool>.seeded(false);
  late AnimationController controller;
  int levelClock = 62;

  String get phoneNo => mobileController.text.isEmpty
      ? emailContoller.text
      : mobileController.text;

  @override
  void dispose() {
    emailContoller.dispose();
    selectedValue.close();
    openBottomSheet.close();
    otpExpired.close();

    super.dispose();
  }
}
