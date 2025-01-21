import 'dart:developer';
import 'dart:typed_data';

import 'package:app/feature/admissions/admissions_page.dart';
import 'package:app/feature/admissions_details/admissions_details_page.dart';
import 'package:app/feature/attendance/attendance_calender/attendence_calender_page.dart';
import 'package:app/feature/attendance/attendance_list1/attendence_detail_page.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page.dart';
import 'package:app/feature/cancel_competency_test/cancel_competency_test_page.dart';
import 'package:app/feature/cheque_page/cheque_page.dart';
import 'package:app/feature/create_ticket/create_ticket_page.dart';
import 'package:app/feature/communication/communication_page.dart';
import 'package:app/feature/competency_test_detail/details_view_competency_test_page.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page.dart';
import 'package:app/feature/enquiries/enquiries_page.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page.dart';
import 'package:app/feature/gate_pass/create_edit_gate_pass/create_edit_gate_pass_page.dart';
import 'package:app/feature/gate_pass/visitor_details/qr_details.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_page.dart';
import 'package:app/feature/new_enrolment/new_enrolment_page.dart';
import 'package:app/feature/notification/notification_page.dart';
import 'package:app/feature/otp/otp_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/feature/payments_page/payments_page.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/registration_details/registrations_details_page.dart';
import 'package:app/feature/review_page/rate_page.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page.dart';
import 'package:app/feature/student_detail/student_detail_page.dart';
import 'package:app/feature/student_profile_edit/student_profile_edit_page.dart';
import 'package:app/feature/tabbar/tabbar_page.dart';
import 'package:app/feature/tickets/ticket_list_page.dart';
import 'package:app/feature/webview/webview_page.dart';

import 'package:app/molecules/payment_history/payment_details.dart';
import 'package:app/molecules/payments_page.dart/coupon_list.dart';

import 'package:app/molecules/registration_details/registrations_widgets_read_only/v_a_s_details.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_page.dart';
import 'package:app/feature/vas/kids_club/kids_club_page.dart';
import 'package:app/feature/vas/psa/psa_page.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_page.dart';
import 'package:app/feature/vas/transport/transport_page.dart';

import '../feature/disciplinarySlip/disciplinary_detail_page.dart';
import '../feature/bus_route_list/bus_route_list_page_page.dart';
import '../feature/my_duty/my_duty_page.dart';
import '../feature/splash/splash_page.dart';
import '../feature/student_profile/student_profile_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.notification:
        return CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const NotificationPage(),
            settings: const RouteSettings(name: RoutePaths.notification));
      case RoutePaths.tabbar:
        return CupertinoPageRoute(
            builder: (context) => const TabbarPage(),
            settings: const RouteSettings(name: RoutePaths.tabbar));
      case RoutePaths.payments:
        return CupertinoPageRoute(
            builder: (context) => Payments(
                  paymentArguments: settings.arguments as PaymentArguments,
                ),
            settings: const RouteSettings(name: RoutePaths.payments));
      case RoutePaths.paymentDetails:
        return CupertinoPageRoute(
            builder: (context) => PaymentDetailScreen(
                  fee: settings.arguments as GetPendingFeesFeeModel,
                ),
            settings: const RouteSettings(name: RoutePaths.paymentDetails));
      case RoutePaths.paymentsPage:
        return CupertinoPageRoute(
            builder: (context) => PaymentsPage(
                  paymentPageeArguments:
                      settings.arguments as PaymentPageeArguments,
                ),
            settings: const RouteSettings(name: RoutePaths.paymentsPage));
      case RoutePaths.couponList:
        return CupertinoPageRoute(
            builder: (context) => CouponList(
                  getPendingFeesFeeModel:
                      settings.arguments as GetPendingFeesFeeModel,
                ),
            settings: const RouteSettings(name: RoutePaths.couponList));
      case RoutePaths.chequePayment:
        return CupertinoPageRoute(
            builder: (context) => ChequePage(
                  paymentsPageModel: settings.arguments as PaymentsPageModel,
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
            builder: (context) => AdmissionsDetailsPage(
                  admissionDetail: settings.arguments == null
                      ? EnquiryDetailArgs()
                      : settings.arguments as EnquiryDetailArgs,
                ),
            settings: const RouteSettings(name: RoutePaths.admissionsDetails));
      case RoutePaths.registrationDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => RegistrationsDetailsPage(
                  routeFrom: args['routeFrom'] ?? '',
                  enquiryDetailArgs:
                      args['enquiryDetailArgs'] ?? EnquiryDetailArgs(),
                  enquiryDetail: args["enquiryDetail"] as EnquiryDetail,
                  editRegistrationDetails:
                      args["editRegistrationDetails"] ?? false,
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
            builder: (context) => EnquiriesDetailsPage(
                  enquiryDetailArgs: settings.arguments == null
                      ? EnquiryDetailArgs()
                      : settings.arguments as EnquiryDetailArgs,
                ),
            settings:
                const RouteSettings(name: RoutePaths.enquiriesDetailsPage));
      case RoutePaths.attendanceDetailspage:
        return CupertinoPageRoute(
            builder: (context) => AttendanceDetailsPage(
                  attendanceDetailPageParameter:
                      settings.arguments as AttendanceDetailPageParameter,
                ),
            settings:
                const RouteSettings(name: RoutePaths.attendanceDetailspage));

      case RoutePaths.enquiriesTimelinePage:
        return CupertinoPageRoute(
            builder: (context) => EnquiriesTimelinePage(
                  enquiryDetail: settings.arguments == null
                      ? EnquiryDetailArgs()
                      : settings.arguments as EnquiryDetailArgs,
                ),
            settings:
                const RouteSettings(name: RoutePaths.enquiriesTimelinePage));

      case RoutePaths.disciplinarySlipPage:
        return CupertinoPageRoute(
            builder: (context) => const DisplinaryDetailsPage(),
            settings:
                const RouteSettings(name: RoutePaths.disciplinarySlipPage));

      case RoutePaths.attendanceCalender:
        return CupertinoPageRoute(
            builder: (context) => const AttendanceCalenderPage(),
            settings: const RouteSettings(name: RoutePaths.attendanceCalender));

      case RoutePaths.profileEdit:
        return CupertinoPageRoute(
            builder: (context) =>  StudentProfileEdit(studentData: settings.arguments as StudentDataArgs,),
            settings: const RouteSettings(name: RoutePaths.profileEdit));

      case RoutePaths.profile:
        return CupertinoPageRoute(
            builder: (context) =>  StudentDetailPage(),
            settings: const RouteSettings(name: RoutePaths.profile));

      case RoutePaths.ticketListPage:
        return CupertinoPageRoute(
            builder: (context) => const TicketListPage(),
            settings: const RouteSettings(name: RoutePaths.ticketListPage),
        );

      case RoutePaths.createTicketPage:
        return CupertinoPageRoute(
            builder: (context) => const CreateTicketPage(),
            settings: const RouteSettings(name: RoutePaths.createTicketPage));

      case RoutePaths.editEnquiriesDetailsPage:
        return CupertinoPageRoute(
            builder: (context) => const EditEnquiriesDetailsPage(),
            settings:
                const RouteSettings(name: RoutePaths.editEnquiriesDetailsPage));

      case RoutePaths.scheduleSchoolTourPage:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => ScheduleSchoolTourPage(
                  enquiryDetailArgs:
                      args['enquiryDetailArgs'] ?? EnquiryDetailArgs(),
                  schoolVisitDetail: args['schoolVisitDetail'],
                  isReschedule: args['isReschedule'] ?? false,
                ),
            settings:
                const RouteSettings(name: RoutePaths.scheduleSchoolTourPage));

      case RoutePaths.detailsViewSchoolTourPage:
        return CupertinoPageRoute(
            builder: (context) => DetailsViewSchoolTourPage(
                  enquiryDetail: settings.arguments == null
                      ? EnquiryDetailArgs()
                      : settings.arguments as EnquiryDetailArgs,
                ),
            settings: const RouteSettings(
                name: RoutePaths.detailsViewSchoolTourPage));

      case RoutePaths.cancelSchoolTourPage:
        final args = settings.arguments as List<dynamic>;
        return CupertinoPageRoute(
            builder: (context) => CancelSchoolTourPage(
                  enquiryDetailArgs: args[0] as EnquiryDetailArgs,
                  schoolVisitDetail: args[1] as SchoolVisitDetail,
                ),
            settings:
                const RouteSettings(name: RoutePaths.cancelSchoolTourPage));

      case RoutePaths.enquiriesAdmissionsJourneyPage:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => EnquiriesAdmissionsJourneyPage(
                  enquiryDetail: args["enquiryDetailArgs"],
                ),
            settings: const RouteSettings(
                name: RoutePaths.enquiriesAdmissionsJourneyPage));

      case RoutePaths.webview:
        return CupertinoPageRoute(
            builder: (context) => WebviewPage(
                  webviewArguments: settings.arguments as WebviewArguments,
                ),
            settings: const RouteSettings(name: RoutePaths.webview));

      case RoutePaths.scheduleCompetencyTest:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => ScheduleCompetencyTestPage(
                  enquiryDetailArgs:
                      args['enquiryDetailArgs'] ?? EnquiryDetailArgs(),
                  competencyTestDetails: args['competencyTestDetail'],
                  isReschedule: args['isReschedule'] ?? false,
                ),
            settings:
                const RouteSettings(name: RoutePaths.scheduleCompetencyTest));

      case RoutePaths.competencyTestDetailPage:
        return CupertinoPageRoute(
            builder: (context) => DetailsViewCompetencyTestPage(
                  enquiryDetail: settings.arguments == null
                      ? EnquiryDetailArgs()
                      : settings.arguments as EnquiryDetailArgs,
                ),
            settings:
                const RouteSettings(name: RoutePaths.competencyTestDetailPage));

      case RoutePaths.cancelCompetencyTestPage:
        final args = settings.arguments as List<dynamic>;
        return CupertinoPageRoute(
            builder: (context) => CancelCompetencyTestPage(
                  enquiryDetailArgs: args[0] as EnquiryDetailArgs,
                  competencyTestDetail: args[1] as CompetencyTestDetails,
                ),
            settings:
                const RouteSettings(name: RoutePaths.cancelCompetencyTestPage));

      case RoutePaths.cafeteriaDetailPage:
        final args = settings.arguments as VasDetailsArg;

        return CupertinoPageRoute(
            builder: (context) => CafeteriaPage(
                  enquiryDetailArgs:
                      args.enquiryDetailArgs ?? EnquiryDetailArgs(),
                ));

      case RoutePaths.psaDetailPage:
        final args = settings.arguments as VasDetailsArg;

        return CupertinoPageRoute(
            builder: (context) => PsaDetailPage(
                  enquiryDetailArgs:
                      args.enquiryDetailArgs ?? EnquiryDetailArgs(),
                ));

      case RoutePaths.kidsClubPage:
        final args = settings.arguments as VasDetailsArg;
        return CupertinoPageRoute(
          builder: (context) => KidsClubDeatilDetailPage(
            enquiryDetailArgs: args.enquiryDetailArgs ?? EnquiryDetailArgs(),
          ),
        );

      case RoutePaths.summerCampPage:
        final args = settings.arguments as VasDetailsArg;

        return CupertinoPageRoute(
          builder: (context) => SummerCampDetailPage(
            enquiryDetailArgs: args.enquiryDetailArgs ?? EnquiryDetailArgs(),
          ),
        );

      case RoutePaths.transportPage:
        final args = settings.arguments as VasDetailsArg;
        return CupertinoPageRoute(
          builder: (context) => TransportPage(
            enquiryDetailArgs: args.enquiryDetailArgs ?? EnquiryDetailArgs(),
          ),
        );

      case RoutePaths.visitorDetailsPage:
        return CupertinoPageRoute(
            builder: (context) => VisitorDetailsPage(
                params: settings.arguments as VisitorDetailsPageParams?),
            settings: const RouteSettings(
              name: RoutePaths.visitorDetailsPage,
            ));

      case RoutePaths.qrCodeDetailsPage:
        final arguments = settings.arguments as Uint8List;
        return CupertinoPageRoute(
          settings: RouteSettings(
              name: RoutePaths.qrCodeDetailsPage, arguments: arguments),
          builder: (context) => QrDetailsPage(qrImageBytes: arguments),
        );
      case RoutePaths.createEditGatePassPage:
        return CupertinoPageRoute(
          builder: (context) => const CreateEditGatePassPage(),
          settings: const RouteSettings(
            name: RoutePaths.createEditGatePassPage,
          ),
        );

      case RoutePaths.busRouteListPage:
        var args = settings.arguments as TripResultArgs?;
        return CupertinoPageRoute(
            settings: const RouteSettings(name: RoutePaths.busRouteListPage),
            builder: (context) => BusRouteListPage(tripArgs: args));
      case RoutePaths.myDutyPage:
        return CupertinoPageRoute(
          builder: (context) => const MyDutyPage(),
          settings: const RouteSettings(name: RoutePaths.myDutyPage),
        );
      case RoutePaths.studentProfilePage:
        final studentId = settings.arguments as int;
        return CupertinoPageRoute(
          builder: (context) => StudentProfilePage(studentId: studentId),
          settings: const RouteSettings(name: RoutePaths.studentProfilePage),
        );
      case RoutePaths.ratePage:
        String id = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => RatePage(id: id),
            settings: const RouteSettings(name: RoutePaths.ratePage));
      case RoutePaths.communicationPage:
        String id = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => CommunicationPage(id: id),
            settings: const RouteSettings(name: RoutePaths.communicationPage));
      case RoutePaths.notificationPage:
        return CupertinoPageRoute(
            builder: (context) => const NotificationPage(),
            settings: const RouteSettings(name: RoutePaths.notificationPage));
      case RoutePaths.vasDetailsPage:
        return CupertinoPageRoute(
            builder: (context) => VASDetails(),
            settings: RouteSettings(name: RoutePaths.vasDetailsPage));
      case RoutePaths.newEnrolmentPage:
        return CupertinoPageRoute(
            builder: (context) => NewEnrolmentPage(),
            settings: RouteSettings(name: RoutePaths.newEnrolmentPage));
      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
