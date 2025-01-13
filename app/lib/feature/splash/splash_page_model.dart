import 'dart:async';
import 'dart:developer';

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
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;
  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  late Timer future;
  final AuthUsecase authUsecase;
  final GetUserDetailsUsecase getUserDetailsUsecase;

  SplashViewModel(
    @factoryParam this.myBaseUrl, {
    required this.exceptionHandlerBinder,
    required this.authUsecase,
    required this.getUserDetailsUsecase,
  }) {
    if (logoutOnTokenExpiry.value != true) {
      getUserDetails();
    }
    future = Timer(const Duration(seconds: 2), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  void login() {
    final AuthUsecaseParams params = AuthUsecaseParams();

    exceptionHandlerBinder.handle(block: () {
      final requestManager = RequestManager(params,
          createCall: () => authUsecase.execute(params: params));

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
            "Unknown error occured",
            (shouldRoute) {},
          );
        }
      });
    }).execute();
  }

  BehaviorSubject<User> userSubject = BehaviorSubject();
  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        log("User details: ${data.data}");
        if (data.data != null) {
          userSubject.add(data.data!);
          Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
              RoutePaths.tabbar, (route) => false);
        }
      }
    }).onError((error) {
      if (error is LocalError) {
        log("STATUS ERROR LocalError");

        login();
      }
    });
  }

  @override
  void dispose() {
    future.cancel();
    _navigateToDashboardController.close();
    super.dispose();
  }
}
