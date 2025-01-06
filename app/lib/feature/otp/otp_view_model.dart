import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class OtpPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final AuthUsecase authUsecase;
  OtpPageModel(this.exceptionHandlerBinder, this.authUsecase);
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
  final formKey = GlobalKey<FormState>();

  void login() {
    final AuthUsecaseParams params = AuthUsecaseParams();

    exceptionHandlerBinder.handle(block: () {
      final requestManager = RequestManager(
        params,
        createCall: () => authUsecase.execute(params: params),
      );

      requestManager.asFlow().listen(
        (result) {
          switch (result.status) {
            case Status.loading:
              // Show loading UI if needed
              break;
            case Status.reloading:
              // Handle reloading state (if applicable)
              break;
            case Status.success:
              Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
                  RoutePaths.tabbar, (route) => false);
              break;
            case Status.error:
              // Handle error, show error UI or messages
              // CommonPopups().showError(vn
              //   AppService.navigatorKey!.currentContext!,
              //   "${result.dealSafeAppError?.error.message}",
              //   (shouldRoute) {},
              // );
              break;
            case Status.none:
              break;
          }
        },
        onError: (error) {
          // Handle any additional stream errors
          CommonPopups().showError(
            navigatorKey.currentContext!,
            'An unexpected error occurred.',
            (shouldRoute) {},
          );
        },
      ).onError((error) {
        final expetion = error as LocalError;
        if (expetion.errorType == ErrorType.appAuthUserCancelled) {
          CommonPopups().showError(
            navigatorKey.currentContext!,
            "User cancelled authentication",
            (shouldRoute) {},
          );
        } else {
          CommonPopups().showError(
            navigatorKey.currentContext!,
            error.error.message,
            (shouldRoute) {},
          );
        }
      });
    }).execute();
  }

  @override
  void dispose() {
    emailContoller.dispose();
    selectedValue.close();
    openBottomSheet.close();
    otpExpired.close();

    super.dispose();
  }
}
