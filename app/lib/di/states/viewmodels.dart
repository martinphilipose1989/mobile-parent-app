import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/attendance/attendance_list1/attendance_details_view_model.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/cancel_competency_test/cancel_competency_test_page_model.dart';
import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/feature/create_ticket/create_ticket_view_model.dart';
import 'package:app/feature/competency_test_detail/details_view_competency_test_page_model.dart';
import 'package:app/feature/create_qrcode/create_qrcode_viewmodel.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_model.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_model.dart';
import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/feature/gate_pass/create_edit_gate_pass/create_edit_gate_pass_viewmodel.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_viewmodel.dart';
import 'package:app/feature/new_enrolment/new_enrolment_viewmodel.dart';
import 'package:app/feature/notification/notification_viewmodel.dart';
import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history_fees_type/payment_history_fees_model.dart';
import 'package:app/feature/payments/payment_history_student_ledger/payment_history_student_ledger_model.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/feature/payments/payments_pages/payments_model.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/feature/review_page/rate_view_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_view_model.dart';
import 'package:app/feature/vas/kids_club/kids_club_view_model.dart';
import 'package:app/feature/vas/psa/psa_view_model.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_view_model.dart';
import 'package:app/feature/vas/transport/transport_view_model.dart';
import 'package:app/feature/webview/webview_view_model.dart';
import 'package:app/molecules/create_intimation/create_intimation_view_model.dart';
import 'package:app/utils/commonTime/common_time_model.dart';
import 'package:app/utils/common_calendar/common_calendar_model.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_model.dart';
import 'package:app/utils/user_viewmodel.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';
import '../../feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import '../../feature/disciplinarySlip/disciplinary_details_view_model.dart';
import '../../feature/tickets/ticket_list_view_model.dart';
import '../../feature/bus_route_list/bus_route_list_page_viewmodel.dart';
import '../../feature/my_duty/my_duty_page_viewmodel.dart';
import '../../feature/student_profile/student_profile_page_viewmodel.dart';

import '../../utils/common_widgets/dialog/staff_list_view_model.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"),
      exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
      authUsecase: getIt.get<AuthUsecase>(),
      getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>()),
);

final tabbarViewModelProvider =
    ChangeNotifierProvider.autoDispose<TabbarViewModel>(
  (ref) => TabbarViewModel(
      exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
      getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>()),
);

final dashboardViewModelProvider =
    ChangeNotifierProvider.autoDispose<DashboardPageModel>(
  (ref) => DashboardPageModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetGuardianStudentDetailsUsecase>(),
      getIt.get<TokenresponseUsecase>(),
      getIt.get<GetUserRoleBasePermissionUsecase>(),
      getIt.get<GetUserDetailsUsecase>(),
 getIt.get<Sendtokenusecase>(),
));

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
      getIt.get<GetCouponsUsecase>(),
      getIt.get<GetUserDetailsUsecase>()),
);

final createIntimationProvider =
    ChangeNotifierProvider.autoDispose<CreateIntimationViewModel>(
  (ref) => CreateIntimationViewModel(
      chooseFileUseCase: getIt.get<ChooseFileUseCase>(),
      flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
      exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
      createIntimationUsecase: getIt.get<CreateIntimationUsecase>(),
      uploadIntimationFileUseCase: getIt.get<UploadIntimationFileUseCase>(),
      getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>()),
);

final otpPageModelProvider = ChangeNotifierProvider.autoDispose<OtpPageModel>(
  (ref) => OtpPageModel(
      getIt.get<FlutterExceptionHandlerBinder>(), getIt.get<AuthUsecase>()),
);

final admissionsProvider =
    ChangeNotifierProvider.autoDispose<AdmissionsViewModel>(
  (ref) => AdmissionsViewModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetAdmissionListUsecase>(),
    getIt.get<FlutterToastErrorPresenter>(),
  ),
);

final attendanceDetailsProvider =
    ChangeNotifierProvider.autoDispose<AttendanceDetailsViewModel>(
  (ref) => AttendanceDetailsViewModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<AttendanceDetailUsecase>(),
      getIt.get<StudentDetailUseCase>()),
);

final attendanceCalenderProvider =
    ChangeNotifierProvider.autoDispose<AttendanceCalenderViewModel>(
  (ref) => AttendanceCalenderViewModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<AttendanceCountUsecase>(),
    getIt.get<StudentDetailUseCase>(),
  ),
);

final disciplinarySlipProvider =
    ChangeNotifierProvider.autoDispose<DisplinaryDetailsViewModel>((ref) =>
        DisplinaryDetailsViewModel(
            getIt.get<FlutterExceptionHandlerBinder>(),
            getIt.get<DisciplinarySlipListUsecase>(),
            getIt.get<CreateAcknowledgementUsecase>(),
            getIt.get<CoReasonsListUsecase>(),
            getIt.get<StudentDetailUseCase>()));

final ticketListProvider =
    ChangeNotifierProvider.autoDispose<TicketListViewModel>(
  (ref) => TicketListViewModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<TicketListingUsecase>(),
      getIt.get<SendCommunicationUsecase>(),
      getIt.get<GetUserDetailsUsecase>()),
);

final createTicketProvider =
    ChangeNotifierProvider.autoDispose<CreateTicketViewModel>(
  (ref) => CreateTicketViewModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<CreateCategoryUseCase>(),
      getIt.get<CreateSubCategoryUseCase>(),
      getIt.get<FindByCategorySubCategoryUsecase>(),
      getIt.get<CreateTicketUsecase>()),
);

final admissionsDetailsProvider = AutoDisposeChangeNotifierProviderFamily<
    AdmissionsDetailsViewModel, EnquiryDetailArgs>(
  (ref, args) => AdmissionsDetailsViewModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetAdmissionJourneyUsecase>(),
    getIt.get<GetEnquiryDetailUseCase>(),
    args,
    getIt.get<FlutterToastErrorPresenter>(),
    getIt.get<MoveToNextStageUsecase>(),
    getIt.get<MakePaymentRequestUsecase>(),
    getIt.get<GetUserDetailsUsecase>(),
  ),
);

final registrationsDetailsProvider =
    ChangeNotifierProvider.autoDispose<RegistrationsDetailsViewModel>(
  (ref) => RegistrationsDetailsViewModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetRegistrationDetailUsecase>(),
      getIt.get<GetNewAdmissionDetailUseCase>(),
      getIt.get<GetIvtDetailUsecase>(),
      getIt.get<GetPsaDetailUsecase>(),
      getIt.get<GetEnquiryDetailUseCase>(),
      getIt.get<UpdateParentDetailsUsecase>(),
      getIt.get<UpdateMedicalDetailsUsecase>(),
      getIt.get<UpdateBankDetailsUsecase>(),
      getIt.get<UpdateContactDetailsUsecase>(),
      getIt.get<UpdatePsaDetailUsecase>(),
      getIt.get<UpdateIvtDetailUsecase>(),
      getIt.get<UpdateNewAdmissionUsecase>(),
      getIt.get<GetMdmAttributeUsecase>(),
      getIt.get<DownloadEnquiryDocumentUsecase>(),
      getIt.get<UploadEnquiryDocumentUsecase>(),
      getIt.get<DeleteEnquiryDocumentUsecase>(),
      getIt.get<DownloadFileUsecase>(),
      getIt.get<GetSiblingDetailsUsecase>(),
      getIt.get<SelectOptionalSubjectUsecase>(),
      getIt.get<AddVasOptionUsecase>(),
      getIt.get<RemoveVasDetailUsecase>(),
      getIt.get<MakePaymentRequestUsecase>(),
      getIt.get<GetSubjectListUsecase>(),
      getIt.get<GetCityStateByPincodeUsecase>(),
      getIt.get<ChooseFileUseCase>(),
      getIt.get<FlutterToastErrorPresenter>(),
      getIt.get<MoveToNextStageUsecase>(),
      getIt.get<GetAdmissionVasUsecase>()),
);

final enquiriesPageModelProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesPageModel>(
  (ref) => EnquiriesPageModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetEnquiryListUsecase>(),
      getIt.get<GetAdmissionListUsecase>(),
      getIt.get<FlutterToastErrorPresenter>()),
);

final enquiriesDetailsPageModelProvider =
    AutoDisposeChangeNotifierProviderFamily<EnquiriesDetailsPageModel,
        EnquiryDetailArgs>(
  (ref, args) => EnquiriesDetailsPageModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetNewAdmissionDetailUseCase>(),
    getIt.get<GetIvtDetailUsecase>(),
    getIt.get<GetPsaDetailUsecase>(),
    getIt.get<GetEnquiryDetailUseCase>(),
    getIt.get<GetMdmAttributeUsecase>(),
    getIt.get<UploadEnquiryDocumentUsecase>(),
    getIt.get<DeleteEnquiryDocumentUsecase>(),
    getIt.get<DownloadEnquiryDocumentUsecase>(),
    getIt.get<UpdatePsaDetailUsecase>(),
    getIt.get<UpdateIvtDetailUsecase>(),
    getIt.get<UpdateNewAdmissionUsecase>(),
    getIt.get<DownloadFileUsecase>(),
    args,
    getIt.get<ChooseFileUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
    getIt.get<MoveToNextStageUsecase>(),
    getIt.get<GetBrandUsecase>(),
  ),
);

final enquiriesTimelinePageModelProvider =
    ChangeNotifierProvider.autoDispose<EnquiriesTimelinePageModel>(
  (ref) => EnquiriesTimelinePageModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetEnquiryTimeLineUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
  ),
);

final editEnquiriesDetailsPageModelProvider =
    ChangeNotifierProvider.autoDispose<EditEnquiriesDetailsPageModel>(
  (ref) =>
      EditEnquiriesDetailsPageModel(getIt.get<FlutterExceptionHandlerBinder>()),
);

final scheduleSchoolTourPageModelProvider =
    ChangeNotifierProvider.autoDispose<ScheduleSchoolTourPageModel>(
  (ref) => ScheduleSchoolTourPageModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<CreateSchoolVisitUseCase>(),
    getIt.get<GetSchoolVisitSlotsUsecase>(),
    getIt.get<RescheduleSchoolVisitUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
    getIt.get<GetEnquiryDetailUseCase>(),
  ),
);

final scheduleCompetencyTestPageModelProvider =
    ChangeNotifierProvider.autoDispose<CompetencyTestModel>(
  (ref) => CompetencyTestModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<CreateCompetencyTestUsecase>(),
    getIt.get<GetCompetencyTestSlotsUsecase>(),
    getIt.get<RescheduleCompetencyTestUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
    getIt.get<GetEnquiryDetailUseCase>(),
  ),
);

final detailsViewCompetencyTestPageModelProvider =
    ChangeNotifierProvider.autoDispose<DetailsViewCompetencyTestPageModel>(
  (ref) => DetailsViewCompetencyTestPageModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetCompetencyTestDetailUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
  ),
);

final cancelCompetencyTestPageModelProvider =
    ChangeNotifierProvider.autoDispose<CancelCompetencyPageModel>(
  (ref) => CancelCompetencyPageModel(
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<CancelCompetencyTestUsecase>(),
    getIt.get<FlutterToastErrorPresenter>(),
  ),
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
    getIt.get<FlutterExceptionHandlerBinder>(),
    getIt.get<GetSchoolVisitDetailUseCase>(),
    getIt.get<FlutterToastErrorPresenter>(),
  ),
);

final cancelSchoolTourPageModelProvider =
    ChangeNotifierProvider.autoDispose<CancelSchoolTourPageModel>(
  (ref) => CancelSchoolTourPageModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<CancelSchoolVisitUsecase>(),
      getIt.get<GetMdmAttributeUsecase>(),
      getIt.get<FlutterToastErrorPresenter>()),
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
            flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
            exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
            getAcademicYearUsecase: getIt.get<GetAcademicYearUsecase>(),
            getTransactionTypeFeesCollectedUsecase:
                getIt.get<GetTransactionTypeFeesCollectedUsecase>(),
            getPendingFeesUsecase: getIt.get<GetPendingFeesUsecase>(),
            downloadFeeTypeUsecase: getIt.get<DownloadFeeTypeUsecase>(),
            downloadStudentLedgerUsecase:
                getIt.get<DownloadStudentLedgerUsecase>(),
            downloadTransactionHistoryUsecase:
                getIt.get<DownloadTransactionHistoryUsecase>()));

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

final webViewProvider =
    ChangeNotifierProvider.autoDispose<WebviewModel>((ref) => WebviewModel(
          exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
          cancelPaymentUsecase: getIt.get<CancelPaymentUsecase>(),
          flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
          getPaymentStatusUsecase: getIt.get<GetPaymentStatusUsecase>(),
        ));

final ratePageModelProvider = ChangeNotifierProvider.autoDispose<RatePageModel>(
    (ref) => RatePageModel(
        getIt.get<FlutterExceptionHandlerBinder>(),
        getIt.get<SendCommunicationUsecase>(),
        getIt.get<GetUserDetailsUsecase>()));

final communicationPageModelProvider =
    ChangeNotifierProvider.autoDispose<CommunicationPageModel>((ref) =>
        CommunicationPageModel(
            getIt.get<FlutterExceptionHandlerBinder>(),
            getIt.get<CreateCommunicationLogUsecase>(),
            getIt.get<SendCommunicationUsecase>(),
            getIt.get<GetUserDetailsUsecase>()));
final enquiriesAdmissionsJourneyProvider =
    AutoDisposeChangeNotifierProviderFamily<EnquiriesAdmissionsJourneyViewModel,
        EnquiryDetailArgs>(
  (ref, args) => EnquiriesAdmissionsJourneyViewModel(
      getIt.get<FlutterExceptionHandlerBinder>(),
      getIt.get<GetAdmissionJourneyUsecase>(),
      getIt.get<GetEnquiryDetailUseCase>(),
      args,
      getIt.get<FlutterToastErrorPresenter>(),
      getIt.get<MoveToNextStageUsecase>()),
);

final createQrcodeViewModelProvider =
    ChangeNotifierProvider.autoDispose<CreateQrcodeViewModel>((ref) =>
        CreateQrcodeViewModel(
            flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
            requestGatepassUsecase: getIt.get<RequestGatepassUsecase>(),
            exceptionHandlerBinder:
                getIt.get<FlutterExceptionHandlerBinder>()));

final createEditGatePassViewModelProvider =
    ChangeNotifierProvider.autoDispose<CreateEditGatePassViewModel>(
  (ref) => CreateEditGatePassViewModel(
    getMdmAttributeUsecase: getIt.get<GetMdmAttributeUsecase>(),
    flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
    uploadVisitorProfileUsecase: getIt.get<UploadVisitorProfileUsecase>(),
    getPurposeOfVisitListUsecase: getIt.get<GetPurposeOfVisitListUsecase>(),
    createGatepassUsecase: getIt.get<CreateGatepassUsecase>(),
    chooseFileUseCase: getIt.get<ChooseFileUseCase>(),
    exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
    getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>(),
  ),
);

final visitorDetailsViewModelProvider =
    ChangeNotifierProvider.autoDispose<VisitorDetailsViewModel>((ref) =>
        VisitorDetailsViewModel(
            getVisitorDetailsUseCase: getIt.get<GetVisitorDetailsUseCase>(),
            exceptionHandlerBinder:
                getIt.get<FlutterExceptionHandlerBinder>()));

final cafeteriaPageModelProvider =
    ChangeNotifierProvider.autoDispose<CafeteriaDetailViewModel>(
        (ref) => CafeteriaDetailViewModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetCafeteriaEnrollmentDetailUsecase>(),
              getIt.get<CalculateFeesUsecase>(),
              getIt.get<AddVasDetailUsecase>(),
              getIt.get<FlutterToastErrorPresenter>(),
            ));

final psaPageModelProvider =
    ChangeNotifierProvider.autoDispose<PsaDetailViewModel>(
        (ref) => PsaDetailViewModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetPsaEnrollmentDetailUsecase>(),
              getIt.get<CalculateFeesUsecase>(),
              getIt.get<AddVasDetailUsecase>(),
              getIt.get<FlutterToastErrorPresenter>(),
            ));

final kidsClubPageModelProvider =
    ChangeNotifierProvider.autoDispose<KidsClubViewModel>(
        (ref) => KidsClubViewModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetKidsClubEnrollmentDetailUsecase>(),
              getIt.get<CalculateFeesUsecase>(),
              getIt.get<AddVasDetailUsecase>(),
              getIt.get<FlutterToastErrorPresenter>(),
            ));

final summerCampPageModelProvider =
    ChangeNotifierProvider.autoDispose<SummerCampDetailViewModel>(
        (ref) => SummerCampDetailViewModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetSummerCampEnrollmentDetailUsecase>(),
              getIt.get<CalculateFeesUsecase>(),
              getIt.get<AddVasDetailUsecase>(),
              getIt.get<FlutterToastErrorPresenter>(),
            ));

final transportPageModelProvider =
    ChangeNotifierProvider.autoDispose<TransportDetailViewModel>(
        (ref) => TransportDetailViewModel(
              getIt.get<FlutterExceptionHandlerBinder>(),
              getIt.get<GetTransportEnrollmentDetailUsecase>(),
              getIt.get<CalculateFeesUsecase>(),
              getIt.get<AddVasDetailUsecase>(),
              getIt.get<FetchStopsUsecase>(),
              getIt.get<FlutterToastErrorPresenter>(),
            ));
//bus_route
final busRouteListPageViewModelProvider =
    ChangeNotifierProvider.autoDispose<BusRouteListPageViewModel>(
  (ref) => BusRouteListPageViewModel(
      flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
      exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
      getAllBusStopsUsecase: getIt.get<GetAllBusStopsUsecase>(),
      getStudentAttendanceUseCase: getIt.get<GetStudentAttendanceUseCase>(),
      fetchStopLogsUsecase: getIt.get<FetchStopLogsUsecase>()),
);
final staffListViewModelProvider = ChangeNotifierProvider
    .autoDispose<StaffListViewModel>((ref) => StaffListViewModel(
          flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
          exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
          getStaffListUsecase: getIt.get<GetStaffListUsecase>(),
        ));

final myDutyPageViewModelProvider = ChangeNotifierProvider
    .autoDispose<MyDutyPageViewModel>((ref) => MyDutyPageViewModel(
          getMydutyListUsecase: getIt.get<GetMydutyListUsecase>(),
          flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
          exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
        ));

final studentProfilePageViewModelProvider =
    ChangeNotifierProvider.autoDispose<StudentProfilePageViewModel>(
  (ref) => StudentProfilePageViewModel(
    getStudentProfileUsecase: getIt.get<GetStudentProfileUsecase>(),
    flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
    exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
  ),
);

final userViewModelProvider = ChangeNotifierProvider.autoDispose<UserViewModel>(
  (ref) => UserViewModel(
      getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>(),
      logoutUsecase: getIt.get<LogoutUsecase>()),
);

final notificationProvider =
    ChangeNotifierProvider.autoDispose<NotificationPageViewModel>(
  (ref) => NotificationPageViewModel(
    exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
    flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
    notificationUsecase: getIt.get<NotificationUsecase>(),
    getUserDetailsUsecase: getIt.get<GetUserDetailsUsecase>(),
  ),
);

final newEnrolmentViewModelProvider =
    ChangeNotifierProvider.autoDispose<NewEnrolmentViewModel>(
  (ref) => NewEnrolmentViewModel(
    newEnrolmentUsecase: getIt.get<NewEnrolmentUsecase>(),
    flutterToastErrorPresenter: getIt.get<FlutterToastErrorPresenter>(),
    exceptionHandlerBinder: getIt.get<FlutterExceptionHandlerBinder>(),
    studentDetailsUsecase: getIt.get<StudentDetailUseCase>(),
  ),
);
