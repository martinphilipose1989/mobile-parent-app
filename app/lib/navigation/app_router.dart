import 'package:app/feature/payments/payments.dart';
import 'package:app/feature/payments_page/payments_page.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/tabbar/tabbar_page.dart';
import 'package:app/molecules/payments/payment_details.dart';
import 'package:app/molecules/payments_page.dart/cheque_page.dart';
import 'package:app/molecules/payments_page.dart/coupon_list.dart';
import 'package:flutter/cupertino.dart';

import '../feature/splash/splash_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.tabbar:
        return CupertinoPageRoute(
            builder: (context) => const TabbarPage(),
            settings: const RouteSettings(name: RoutePaths.tabbar));
      case RoutePaths.payments:
        return CupertinoPageRoute(
            builder: (context) => const Payments(),
            settings: const RouteSettings(name: RoutePaths.payments));
      case RoutePaths.paymentDetails:
        return CupertinoPageRoute(
            builder: (context) => const PaymentDetailScreen(),
            settings: const RouteSettings(name: RoutePaths.paymentDetails));
      case RoutePaths.paymentsPage:
        return CupertinoPageRoute(
            builder: (context) => const PaymentsPage(),
            settings: const RouteSettings(name: RoutePaths.paymentsPage));
      case RoutePaths.couponList:
        return CupertinoPageRoute(
            builder: (context) => const CouponList(),
            settings: const RouteSettings(name: RoutePaths.couponList));
      case RoutePaths.chequePayment:
        return CupertinoPageRoute(
            builder: (context) => Chequepage(
                  pageModel: settings.arguments as PaymentsPageModel,
                ),
            settings: const RouteSettings(name: RoutePaths.chequePayment));
      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
