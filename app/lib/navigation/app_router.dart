import 'package:app/feature/admissions/admissions_page.dart';
import 'package:app/feature/admissions_details/admissions_details_page.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page.dart';
import 'package:app/feature/enquiries/enquiries_page.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page.dart';
import 'package:app/feature/otp/otp_page.dart';
import 'package:app/feature/payments/payments.dart';
import 'package:app/feature/payments_page/payments_page.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/registration_details/registrations_details_page.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page.dart';
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
      case RoutePaths.otpPage:
        return CupertinoPageRoute(
            builder: (context) => const OtpPage(),
            settings: const RouteSettings(name: RoutePaths.otpPage));
      case RoutePaths.trackerAdmissions:
        return CupertinoPageRoute(
            builder: (context) => const AdmissionsPage(),
            settings: const RouteSettings(name: RoutePaths.trackerAdmissions));
      case RoutePaths.admissionsDetails:
        return CupertinoPageRoute(
            builder: (context) => const AdmissionsDetailsPage(),
            settings: const RouteSettings(name: RoutePaths.admissionsDetails));
      case RoutePaths.registrationDetails:
        return CupertinoPageRoute(
            builder: (context) => RegistrationsDetailsPage(
                  routeFrom: settings.arguments as String,
                ),
            settings:
                const RouteSettings(name: RoutePaths.registrationDetails));

      // for enquiruies from dashboard

      case RoutePaths.enquiriesPage:
        return CupertinoPageRoute(
            builder: (context) => const EnquiriesPage(),
            settings: const RouteSettings(name: RoutePaths.enquiriesPage));

      case RoutePaths.enquiriesDetailsPage:
        return CupertinoPageRoute(
            builder: (context) => const EnquiriesDetailsPage(),
            settings:
                const RouteSettings(name: RoutePaths.enquiriesDetailsPage));

      case RoutePaths.enquiriesTimelinePage:
        return CupertinoPageRoute(
            builder: (context) => const EnquiriesTimelinePage(),
            settings:
                const RouteSettings(name: RoutePaths.enquiriesTimelinePage));

      case RoutePaths.editEnquiriesDetailsPage:
        return CupertinoPageRoute(
            builder: (context) => const EditEnquiriesDetailsPage(),
            settings:
                const RouteSettings(name: RoutePaths.editEnquiriesDetailsPage));

      case RoutePaths.scheduleSchoolTourPage:
        return CupertinoPageRoute(
            builder: (context) => const ScheduleSchoolTourPage(),
            settings:
                const RouteSettings(name: RoutePaths.scheduleSchoolTourPage));

      case RoutePaths.detailsViewSchoolTourPage:
        return CupertinoPageRoute(
            builder: (context) => const DetailsViewSchoolTourPage(),
            settings: const RouteSettings(
                name: RoutePaths.detailsViewSchoolTourPage));

      case RoutePaths.cancelSchoolTourPage:
        return CupertinoPageRoute(
            builder: (context) => const CancelSchoolTourPage(),
            settings:
                const RouteSettings(name: RoutePaths.cancelSchoolTourPage));

      case RoutePaths.enquiriesAdmissionsJourneyPage:
        return CupertinoPageRoute(
            builder: (context) => const EnquiriesAdmissionsJourneyPage(),
            settings: const RouteSettings(
                name: RoutePaths.enquiriesAdmissionsJourneyPage));

      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
