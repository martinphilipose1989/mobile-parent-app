import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/attendance/attendance_list1/attendance_details_view_model.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_model.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_model.dart';
import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history_fees_type/payment_history_fees_model.dart';
import 'package:app/feature/payments/payment_history_student_ledger/payment_history_student_ledger_model.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/feature/payments/payments_pages/payments_model.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/feature/review_page/rate_page_view.dart';
import 'package:app/feature/review_page/rate_view_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/feature/webview/webview_view_model.dart';
import 'package:app/utils/commonTime/common_time_model.dart';
import 'package:app/utils/common_calendar/common_calendar_model.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_model.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';
import '../../feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import '../../feature/disciplinarySlip/disciplinary_details_view_model.dart';
import '../../feature/tickets/ticket_list_view_model.dart';

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
  (ref) => DashboardPageModel(getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetGuardianStudentDetailsUsecase>()),
);

final paymentsModelProvider = ChangeNotifierProvider.autoDispose<PaymentsModel>(
  (ref) => PaymentsModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetGuardianStudentDetailsUsecase>(),
      getIt.get<GetAcademicYearUsecase>(),
      getIt.get<GetPendingFeesUsecase>(),
      getIt.get<GetSchoolNamesUsecase>()),
);

final paymentsPageModelProvider =
    ChangeNotifierProvider.autoDispose<PaymentsPageModel>(
  (ref) => PaymentsPageModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetValidatePayNowUseCase>(),
      getIt.get<GetPaymentOrderUsecase>(),
      getIt.get<GetCouponsUsecase>()),
);

final otpPageModelProvider = ChangeNotifierProvider.autoDispose<OtpPageModel>(
  (ref) => OtpPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final admissionsProvider =
    ChangeNotifierProvider.autoDispose<AdmissionsViewModel>(
  (ref) => AdmissionsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final attendanceDetailsProvider =
    ChangeNotifierProvider.autoDispose<AttendanceDetailsViewModel>(
  (ref) =>
      AttendanceDetailsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final attendanceCalenderProvider =
    ChangeNotifierProvider.autoDispose<AttendanceCalenderViewModel>(
  (ref) =>
      AttendanceCalenderViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final disciplinarySlipProvider =
    ChangeNotifierProvider.autoDispose<DisplinaryDetailsViewModel>(
  (ref) =>
      DisplinaryDetailsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final ticketListProvider =
ChangeNotifierProvider.autoDispose<TicketListViewModel>(
      (ref) => TicketListViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);


final admissionsDetailsProvider =
    ChangeNotifierProvider.autoDispose<AdmissionsDetailsViewModel>(
  (ref) =>
      AdmissionsDetailsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final registrationsDetailsProvider =
    ChangeNotifierProvider.autoDispose<RegistrationsDetailsViewModel>(
  (ref) =>
      RegistrationsDetailsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final enquiriesPageModelProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesPageModel>(
  (ref) => EnquiriesPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final enquiriesDetailsPageModelProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesDetailsPageModel>(
  (ref) =>
      EnquiriesDetailsPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final enquiriesTimelinePageModelProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesTimelinePageModel>(
  (ref) =>
      EnquiriesTimelinePageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final editEnquiriesDetailsPageModelProvider =
    ChangeNotifierProvider.autoDispose<EditEnquiriesDetailsPageModel>(
  (ref) =>
      EditEnquiriesDetailsPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final scheduleSchoolTourPageModelProvider =
    ChangeNotifierProvider.autoDispose<ScheduleSchoolTourPageModel>(
  (ref) =>
      ScheduleSchoolTourPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final commonCalendarModelProvider =
    ChangeNotifierProvider.autoDispose<CommonCalendarModel>(
  (ref) => CommonCalendarModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final commonTimeModelProvider =
    ChangeNotifierProvider.autoDispose<CommonTimeModel>(
  (ref) => CommonTimeModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final detailsViewSchoolTourPageModelProvider =
    ChangeNotifierProvider.autoDispose<DetailsViewSchoolTourPageModel>(
  (ref) => DetailsViewSchoolTourPageModel(
      getIt.get<FlutterExceptionHandlerBinder>()),
);

final cancelSchoolTourPageModelProvider =
    ChangeNotifierProvider.autoDispose<CancelSchoolTourPageModel>(
  (ref) =>
      CancelSchoolTourPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

// Common widgets providers

final commonStepperProvider =
    ChangeNotifierProvider.autoDispose<CommonStepperModel>(
  (ref) => CommonStepperModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final commonChipListProvider =
    ChangeNotifierProvider.autoDispose<CommonChipListViewModel>(
  (ref) => CommonChipListViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final enquiriesAdmissionsJourneyProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesAdmissionsJourneyViewModel>(
        (ref) => EnquiriesAdmissionsJourneyViewModel(
            getIt.get<FlutterExceptionHandlerBinder>()));

final chequePageModelProvider =
    ChangeNotifierProvider.autoDispose<ChequePageModel>((ref) =>
        ChequePageModel(
            getIt.get<FlutterExceptionHandlerBinder>(),
            getIt.get<GetStorePaymentUsecase>(),
            getIt.get<GetTokenGeneratorUsecase>(),
            getIt.get<ChooseFileUseCase>(),
            getIt.get<GetStoreImageUsecase>()));

final paymentHistoryProvider =
    ChangeNotifierProvider.autoDispose<PaymentHistoryModel>((ref) =>
        PaymentHistoryModel(
            getIt.get<FlutterExceptionHandlerBinder>(),
            getIt.get<GetAcademicYearUsecase>(),
            getIt.get<GetTransactionTypeFeesCollectedUsecase>(),
            getIt.get<GetPendingFeesUsecase>()));

final paymentHistoryTransactionProvider =
    ChangeNotifierProvider.autoDispose<PaymentHistoryTransactionModel>(
        (ref) => PaymentHistoryTransactionModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetTransactionTypeUsecase>(),
            ));

final paymentHistoryFeesProvider =
    ChangeNotifierProvider.autoDispose<PaymentHistoryFeesModel>(
        (ref) => PaymentHistoryFeesModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
            ));

final paymentHistoryStudentLedgerProvider =
    ChangeNotifierProvider.autoDispose<PaymentHistoryStudentLedgerModel>(
        (ref) => PaymentHistoryStudentLedgerModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
            ));

final webViewProvider = ChangeNotifierProvider.autoDispose<WebviewModel>(
    (ref) => WebviewModel(getIt.get<FlutterExceptionHandlerBinder>(),
        getIt.get<GetPaymentStatusUsecase>()));

final ratePageModelProvider =
    ChangeNotifierProvider.autoDispose<RatePageModel>((ref) => RatePageModel(
          getIt.get<FlutterExceptionHandlerBinder>(),
        ));

final communicationPageModelProvider =
    ChangeNotifierProvider.autoDispose<CommunicationPageModel>(
        (ref) => CommunicationPageModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
            ));
