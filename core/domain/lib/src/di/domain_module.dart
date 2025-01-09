import 'package:domain/domain.dart';
import 'package:domain/src/usecase/finance/new_enrolment_usecase.dart';

import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  GetAcademicYearUsecase getAcademicYear(FinanceRepository repository) {
    return GetAcademicYearUsecase(repository);
  }

  @lazySingleton
  GetTokenGeneratorUsecase getTokenGenerator(FinanceRepository repository) {
    return GetTokenGeneratorUsecase(repository);
  }

  @lazySingleton
  GetValidatePayNowUseCase getValidatePayNow(FinanceRepository repository) {
    return GetValidatePayNowUseCase(repository);
  }

  @lazySingleton
  NotificationUsecase notificationUsecase(
      NotificationRepository notificationRepository) {
    return NotificationUsecase(notificationRepository: notificationRepository);
  }

  @lazySingleton
  GetStorePaymentUsecase getStorePayment(FinanceRepository repository) {
    return GetStorePaymentUsecase(repository);
  }

  @lazySingleton
  AttendanceDetailUsecase getAttendanceDetails(
      AttendanceRepository repository) {
    return AttendanceDetailUsecase(
      attendanceRepository: repository,
    );
  }

  @lazySingleton
  AttendanceCountUsecase getAttendanceList(AttendanceRepository repository) {
    return AttendanceCountUsecase(
      attendanceRepository: repository,
    );
  }

  @lazySingleton
  StudentDetailUseCase getStudentDetails(AdminRepository repo) {
    return StudentDetailUseCase(repo);
  }

  @lazySingleton
  GetGuardianStudentDetailsUsecase getGuardianStudentDetails(
      FinanceRepository repository) {
    return GetGuardianStudentDetailsUsecase(repository);
  }

  @lazySingleton
  GetPendingFeesUsecase getPendingFees(FinanceRepository repository) {
    return GetPendingFeesUsecase(repository);
  }

  @lazySingleton
  GetSchoolNamesUsecase getSchoolNames(FinanceRepository repository) {
    return GetSchoolNamesUsecase(repository);
  }

  @lazySingleton
  GetEnquiryListUsecase getEnquiryListUseCase(
      EnquiryRepository enquiryRepository) {
    return GetEnquiryListUsecase(enquiryRepository);
  }

  @lazySingleton
  GetEnquiryDetailUseCase getEnquiryDetailUseCase(
      EnquiryRepository enquiryRepository) {
    return GetEnquiryDetailUseCase(enquiryRepository);
  }

  @lazySingleton
  GetEnquiryTimeLineUseCase getEnquiryTimeLineUseCase(
      EnquiryRepository enquiryRepository) {
    return GetEnquiryTimeLineUseCase(enquiryRepository);
  }

  @lazySingleton
  GetAdmissionJourneyUsecase getAdmissionJourneyUsecase(
      EnquiryRepository enquiryRepository) {
    return GetAdmissionJourneyUsecase(enquiryRepository);
  }

  @lazySingleton
  GetMydutyListUsecase getMyDutyListUsecase(TransportRepository transportRepo) {
    return GetMydutyListUsecase(transportRepository: transportRepo);
  }

  @lazySingleton
  GetAllBusStopsUsecase allBusStopsUsecase(TransportRepository transportRepo) {
    return GetAllBusStopsUsecase(transportRepository: transportRepo);
  }

  // @lazySingleton
  // FetchStopLogsUsecase fetchStopLogsUsecase(
  //     TransportRepository transportRepo) {
  //   return   FetchStopLogsUsecase(  transportRepository: transportRepo,);
  // }
  @lazySingleton
  GetStudentProfileUsecase getStudentProfileUseCase(
      TransportRepository transportRepo) {
    return GetStudentProfileUsecase(transportRepository: transportRepo);
  }

  @lazySingleton
  GetStudentAttendanceUseCase getStudentAttendanceUseCase(
      TransportRepository transportRepo) {
    return GetStudentAttendanceUseCase(transportRepository: transportRepo);
  }

  @lazySingleton
  GetAdmissionListUsecase getAdmissionListUsecase(
      AdmissionRepository admissionRepository) {
    return GetAdmissionListUsecase(admissionRepository);
  }

  @lazySingleton
  GetStaffListUsecase staffListusecase(TransportRepository transportRepo) {
    return GetStaffListUsecase(transportRepository: transportRepo);
  }

  @lazySingleton
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase(
      EnquiryRepository enquiryRepository) {
    return GetNewAdmissionDetailUseCase(enquiryRepository);
  }

  @lazySingleton
  GetPsaDetailUsecase getPsaDetailUsecase(EnquiryRepository enquiryRepository) {
    return GetPsaDetailUsecase(enquiryRepository);
  }

  @lazySingleton
  GetIvtDetailUsecase getIvtDetailUsecase(EnquiryRepository enquiryRepository) {
    return GetIvtDetailUsecase(enquiryRepository);
  }

  @lazySingleton
  DownloadEnquiryDocumentUsecase downloadEnquiryDocumentUsecase(
      EnquiryRepository enquiryRepository) {
    return DownloadEnquiryDocumentUsecase(enquiryRepository);
  }

  @lazySingleton
  DeleteEnquiryDocumentUsecase deleteEnquiryDocumentUsecase(
      EnquiryRepository enquiryRepository) {
    return DeleteEnquiryDocumentUsecase(enquiryRepository);
  }

  @lazySingleton
  UploadEnquiryDocumentUsecase uploadEnquiryDocumentUsecase(
      EnquiryRepository enquiryRepository) {
    return UploadEnquiryDocumentUsecase(enquiryRepository);
  }

  @lazySingleton
  CreateCompetencyTestUsecase createCompetencyTestUsecase(
      CompetencyTestRepository competencyTestRepository) {
    return CreateCompetencyTestUsecase(competencyTestRepository);
  }

  @lazySingleton
  RescheduleCompetencyTestUseCase rescheduleCompetencyTestUseCase(
      CompetencyTestRepository competencyTestRepository) {
    return RescheduleCompetencyTestUseCase(competencyTestRepository);
  }

  @lazySingleton
  CancelCompetencyTestUsecase cancelCompetencyTestUsecase(
      CompetencyTestRepository competencyTestRepository) {
    return CancelCompetencyTestUsecase(competencyTestRepository);
  }

  @lazySingleton
  GetCompetencyTestDetailUseCase getCompetencyTestDetailUseCase(
      CompetencyTestRepository competencyTestRepository) {
    return GetCompetencyTestDetailUseCase(competencyTestRepository);
  }

  @lazySingleton
  CreateSchoolVisitUseCase createSchoolVisitUseCase(
      SchoolVisitRepository schoolVisitRepository) {
    return CreateSchoolVisitUseCase(schoolVisitRepository);
  }

  @lazySingleton
  RescheduleSchoolVisitUseCase rescheduleSchoolVisitUseCase(
      SchoolVisitRepository schoolVisitRepository) {
    return RescheduleSchoolVisitUseCase(schoolVisitRepository);
  }

  @lazySingleton
  CancelSchoolVisitUsecase cancelSchoolVisitUsecase(
      SchoolVisitRepository schoolVisitRepository) {
    return CancelSchoolVisitUsecase(schoolVisitRepository);
  }

  @lazySingleton
  GetSchoolVisitDetailUseCase getSchoolVisitDetailUseCase(
      SchoolVisitRepository schoolVisitRepository) {
    return GetSchoolVisitDetailUseCase(schoolVisitRepository);
  }

  @lazySingleton
  GetRegistrationDetailUsecase getRegistrationDetailUsecase(
      RegistrationRepository registrationRepository) {
    return GetRegistrationDetailUsecase(registrationRepository);
  }

  @lazySingleton
  GetSchoolVisitSlotsUsecase getSchoolVisitSlotsUsecase(
      SchoolVisitRepository schoolVisitRepository) {
    return GetSchoolVisitSlotsUsecase(schoolVisitRepository);
  }

  @lazySingleton
  GetCompetencyTestSlotsUsecase getCompetencyTestSlotsUsecase(
      CompetencyTestRepository competencyTestRepository) {
    return GetCompetencyTestSlotsUsecase(competencyTestRepository);
  }

  @lazySingleton
  UpdatePsaDetailUsecase updatePsaDetailUsecase(
      EnquiryRepository enquiryRepository) {
    return UpdatePsaDetailUsecase(enquiryRepository);
  }

  @lazySingleton
  UpdateIvtDetailUsecase updateIvtDetailUsecase(
      EnquiryRepository enquiryRepository) {
    return UpdateIvtDetailUsecase(enquiryRepository);
  }

  @lazySingleton
  UpdateNewAdmissionUsecase updateNewAdmissionUsecase(
      EnquiryRepository enquiryRepository) {
    return UpdateNewAdmissionUsecase(enquiryRepository);
  }

  @lazySingleton
  GetMdmAttributeUsecase getMdmAttributeUsecase(
      EnquiryRepository enquiryRepository) {
    return GetMdmAttributeUsecase(enquiryRepository);
  }

  @lazySingleton
  GetCityStateByPincodeUsecase getCityStateByPincodeUsecase(
      EnquiryRepository enquiryRepository) {
    return GetCityStateByPincodeUsecase(enquiryRepository);
  }

  @lazySingleton
  UpdateParentDetailsUsecase updateParentDetailsUsecase(
      RegistrationRepository registrationRepository) {
    return UpdateParentDetailsUsecase(registrationRepository);
  }

  @lazySingleton
  UpdateContactDetailsUsecase updateContactDetailsUsecase(
      RegistrationRepository registrationRepository) {
    return UpdateContactDetailsUsecase(registrationRepository);
  }

  @lazySingleton
  UpdateBankDetailsUsecase updateBankDetailsUsecase(
      RegistrationRepository registrationRepository) {
    return UpdateBankDetailsUsecase(registrationRepository);
  }

  @lazySingleton
  UpdateMedicalDetailsUsecase updateMedicalDetailsUsecase(
      RegistrationRepository registrationRepository) {
    return UpdateMedicalDetailsUsecase(registrationRepository);
  }

  @lazySingleton
  DownloadFileUsecase downloadFileUsecase(EnquiryRepository enquiryRepository) {
    return DownloadFileUsecase(enquiryRepository);
  }

  @lazySingleton
  GetSiblingDetailsUsecase getSiblingDetailsUsecase(
      RegistrationRepository registrationRepository) {
    return GetSiblingDetailsUsecase(registrationRepository);
  }

  @lazySingleton
  SelectOptionalSubjectUsecase selectOptionalSubjectUsecase(
      RegistrationRepository registrationRepository) {
    return SelectOptionalSubjectUsecase(registrationRepository);
  }

  @lazySingleton
  AddVasOptionUsecase addVasOptionUsecase(
      RegistrationRepository registrationRepository) {
    return AddVasOptionUsecase(registrationRepository);
  }

  @lazySingleton
  GetSubjectListUsecase getSubjectListUsecase(
      RegistrationRepository registrationRepository) {
    return GetSubjectListUsecase(registrationRepository);
  }

  @lazySingleton
  GetPsaEnrollmentDetailUsecase getPsaEnrollmentDetailUsecase(
      RegistrationRepository registrationRepository) {
    return GetPsaEnrollmentDetailUsecase(registrationRepository);
  }

  @lazySingleton
  GetCafeteriaEnrollmentDetailUsecase getCafeteriaEnrollmentDetailUsecase(
      RegistrationRepository registrationRepository) {
    return GetCafeteriaEnrollmentDetailUsecase(registrationRepository);
  }

  AuthUsecase authUsecase(UserRepository userRepository) {
    return AuthUsecase(userRepository: userRepository);
  }

  @lazySingleton
  RequestGatepassUsecase createGatePassUsecaseProvider(
      GatepassRepository gatePassRepository) {
    return RequestGatepassUsecase(gatePassRepository: gatePassRepository);
  }

  @lazySingleton
  GetKidsClubEnrollmentDetailUsecase getKidsClubEnrollmentDetail(
      RegistrationRepository registrationRepository) {
    return GetKidsClubEnrollmentDetailUsecase(registrationRepository);
  }

  @lazySingleton
  GetSummerCampEnrollmentDetailUsecase getSummerCampEnrollmentDetail(
      RegistrationRepository registrationRepository) {
    return GetSummerCampEnrollmentDetailUsecase(registrationRepository);
  }

  @lazySingleton
  GetTransportEnrollmentDetailUsecase getTransportEnrollmentDetailUsecase(
      RegistrationRepository registrationRepository) {
    return GetTransportEnrollmentDetailUsecase(registrationRepository);
  }

  @lazySingleton
  CalculateFeesUsecase calculateFeesUsecase(
      RegistrationRepository registrationRepository) {
    return CalculateFeesUsecase(registrationRepository);
  }

  @lazySingleton
  AddVasDetailUsecase addVasDetailUsecase(
      RegistrationRepository registrationRepository) {
    return AddVasDetailUsecase(registrationRepository);
  }

  @lazySingleton
  CreateIntimationUsecase createIntimationUsecase(
      TransportRepository transportRepository) {
    return CreateIntimationUsecase(transportRepository: transportRepository);
  }

  @lazySingleton
  UploadIntimationFileUseCase uploadIntimationFileUsecase(
      TransportRepository transportRepository) {
    return UploadIntimationFileUseCase(transportRepository);
  }

  @lazySingleton
  RemoveVasDetailUsecase removeVasDetailUsecase(
      RegistrationRepository registrationRepository) {
    return RemoveVasDetailUsecase(registrationRepository);
  }

  @lazySingleton
  MakePaymentRequestUsecase makePaymentRequestUsecase(
      RegistrationRepository registrationRepository) {
    return MakePaymentRequestUsecase(registrationRepository);
  }

  FetchStopLogsUsecase fetchStopLogsUsecase(
      TransportRepository transportRepository) {
    return FetchStopLogsUsecase(transportRepository: transportRepository);
  }

  @lazySingleton
  FetchStopsUsecase fetchStopsUsecase(
      RegistrationRepository registrationRepository) {
    return FetchStopsUsecase(registrationRepository);
  }

  GetTransactionTypeUsecase getTransactionType(FinanceRepository repository) {
    return GetTransactionTypeUsecase(repository);
  }

  @lazySingleton
  GetTransactionTypeFeesCollectedUsecase getTransactionTypeFeesCollected(
      FinanceRepository repository) {
    return GetTransactionTypeFeesCollectedUsecase(repository);
  }

  @lazySingleton
  ChooseFileUseCase pickFile(AttachmentRepository repository) {
    return ChooseFileUseCase(attachmentRepository: repository);
  }

  @lazySingleton
  GetPaymentOrderUsecase getPaymentOrder(FinanceRepository repository) {
    return GetPaymentOrderUsecase(repository);
  }

  @lazySingleton
  GetStoreImageUsecase setStoreImage(FinanceRepository repository) {
    return GetStoreImageUsecase(repository);
  }

  @lazySingleton
  GetPaymentStatusUsecase getPaymentStatus(FinanceRepository repository) {
    return GetPaymentStatusUsecase(repository);
  }

  @lazySingleton
  GetCouponsUsecase getCoupons(AdminRepository repository) {
    return GetCouponsUsecase(repository);
  }

  @lazySingleton
  TicketListingUsecase getTicketsList(TicketingRepository repository) {
    return TicketListingUsecase(repository);
  }

  @lazySingleton
  CreateCategoryUseCase createCategory(MDMRepository repository) {
    return CreateCategoryUseCase(repository);
  }

  @lazySingleton
  CreateSubCategoryUseCase createSubCategory(MDMRepository repository) {
    return CreateSubCategoryUseCase(repository);
  }

  @lazySingleton
  CreateNewCommunicationUsecase createCommunication(
      TicketingRepository repository) {
    return CreateNewCommunicationUsecase(repository);
  }

  @lazySingleton
  FindByCategorySubCategoryUsecase findByCategorySubCategory(
      TicketingRepository repository) {
    return FindByCategorySubCategoryUsecase(repository);
  }

  @lazySingleton
  CreateCommunicationLogUsecase createCommunicationLog(
      TicketingRepository repository) {
    return CreateCommunicationLogUsecase(repository);
  }

  @lazySingleton
  SendCommunicationUsecase sendCommunication(TicketingRepository repository) {
    return SendCommunicationUsecase(repository);
  }

  @lazySingleton
  CreateTicketUsecase createTicket(TicketingRepository repository) {
    return CreateTicketUsecase(repository);
  }

  @lazySingleton
  DisciplinarySlipListUsecase getDisciplinaryList(
      DisciplinarySlipRepository repo) {
    return DisciplinarySlipListUsecase(repo);
  }

  @lazySingleton
  CreateAcknowledgementUsecase createAcknowledge(
      DisciplinarySlipRepository repo) {
    return CreateAcknowledgementUsecase(disciplinarySlipRepository: repo);
  }

  @lazySingleton
  CoReasonsListUsecase coReasons(DisciplinarySlipRepository repo) {
    return CoReasonsListUsecase(disciplinarySlipRepository: repo);
  }

  @lazySingleton
  TokenresponseUsecase getTokenResponse(UserRepository userRepository) {
    return TokenresponseUsecase(userRepository: userRepository);
  }

  @lazySingleton
  GetUserRoleBasePermissionUsecase getUserRoleBasePermissionUsecase(
      UserRepository userRepository) {
    return GetUserRoleBasePermissionUsecase(
      userRepository: userRepository,
    );
  }

  @lazySingleton
  GetUserDetailsUsecase getUserDetailsUsecase(UserRepository userRepository) {
    return GetUserDetailsUsecase(userRepository: userRepository);
  }

  @lazySingleton
  MoveToNextStageUsecase moveToNextStageUsecase(
      EnquiryRepository enquiryRepository) {
    return MoveToNextStageUsecase(enquiryRepository: enquiryRepository);
  }

  @lazySingleton
  UploadVisitorProfileUsecase uploadVisitorProfileUsecase(
      GatepassRepository gatePassRepository) {
    return UploadVisitorProfileUsecase(gatePassRepository: gatePassRepository);
  }

  @lazySingleton
  GetPurposeOfVisitListUsecase getPurposeOfVisitListUsecase(
      GatepassRepository gatePassRepository) {
    return GetPurposeOfVisitListUsecase(gatePassRepository: gatePassRepository);
  }

  @lazySingleton
  CreateGatepassUsecase createGatepassNUsecase(
      GatepassRepository gatePassRepository) {
    return CreateGatepassUsecase(gatePassRepository: gatePassRepository);
  }

  @lazySingleton
  GetVisitorDetailsUseCase getVisitorDetailsUseCase(
      GatepassRepository gatePassRepository) {
    return GetVisitorDetailsUseCase(gatePassRepository: gatePassRepository);
  }

  @lazySingleton
  GetBrandUsecase getBrandUsecase(EnquiryRepository enquiryRepository) {
    return GetBrandUsecase(enquiryRepository: enquiryRepository);
  }

  @lazySingleton
  GetAdmissionVasUsecase getAdmissionVasUsecase(
      RegistrationRepository registrationRepository) {
    return GetAdmissionVasUsecase(
        registrationRepository: registrationRepository);
  }

  @lazySingleton
  LogoutUsecase logoutUsecase(UserRepository userRepository) {
    return LogoutUsecase(userRepository: userRepository);
  }

  @lazySingleton
  CancelPaymentUsecase cancelPaymentUsecase(
      FinanceRepository financeRepository) {
    return CancelPaymentUsecase(financeRepository: financeRepository);
  }

  @lazySingleton
  DownloadStudentLedgerUsecase downloadStudentLedgerUsecase(
      FinanceRepository financeRepository) {
    return DownloadStudentLedgerUsecase(financeRepository: financeRepository);
  }

  @lazySingleton
  DownloadFeeTypeUsecase downloadFeeTypeUsecase(
      FinanceRepository financeRepository) {
    return DownloadFeeTypeUsecase(financeRepository: financeRepository);
  }

  @lazySingleton
  DownloadTransactionHistoryUsecase downloadTransactionHistoryUsecase(
      FinanceRepository financeRepository) {
    return DownloadTransactionHistoryUsecase(
        financeRepository: financeRepository);
  }

  @lazySingleton
  NewEnrolmentUsecase newEnrolmentUsecase(FinanceRepository financeRepository) {
    return NewEnrolmentUsecase(financeRepository: financeRepository);
  }

  @lazySingleton
 Sendtokenusecase sendTokenUsecase(AdminRepository adminRepository) {
    return  Sendtokenusecase(adminRepository: adminRepository );
  }


}
