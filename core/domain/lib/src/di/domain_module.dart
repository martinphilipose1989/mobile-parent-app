import 'package:domain/domain.dart';
import 'package:domain/src/usecase/user/auth_usecase.dart';
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
  GetStorePaymentUsecase getStorePayment(FinanceRepository repository) {
    return GetStorePaymentUsecase(repository);
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
  GetAdmissionListUsecase getAdmissionListUsecase(
      AdmissionRepository admissionRepository) {
    return GetAdmissionListUsecase(admissionRepository);
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
  AuthUsecase authUsecase(UserRepository userRepository) {
    return AuthUsecase(userRepository: userRepository);
  }
}
