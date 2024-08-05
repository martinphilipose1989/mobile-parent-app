import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_model.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_model.dart';
import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/feature/payments/payments_model.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/utils/commonTime/common_time_model.dart';
import 'package:app/utils/common_calendar/common_calendar_model.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_model.dart';
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

final otpPageModelProvider = ChangeNotifierProvider.autoDispose<OtpPageModel>(
  (ref) => OtpPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final admissionsProvider =
    ChangeNotifierProvider.autoDispose<AdmissionsViewModel>(
  (ref) => AdmissionsViewModel(getIt.get<FlutterExceptionHandlerBinder>()),
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
      getIt.get<FlutterExceptionHandlerBinder>()),
);
