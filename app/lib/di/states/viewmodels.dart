import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/payments/payments_model.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"),
      getIt.get<FlutterExceptionHandlerBinder>()),
);

final tabbarViewModelProvider =
    ChangeNotifierProvider.autoDispose<TabbarViewModel>(
  (ref) => TabbarViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final dashboardViewModelProvider =
    ChangeNotifierProvider.autoDispose<DashboardPageModel>(
  (ref) => DashboardPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final paymentsModelProvider = ChangeNotifierProvider.autoDispose<PaymentsModel>(
  (ref) => PaymentsModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final paymentsPageModelProvider =
    ChangeNotifierProvider.autoDispose<PaymentsPageModel>(
  (ref) => PaymentsPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);
