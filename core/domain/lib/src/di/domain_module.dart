import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/marketing/cancel_competency_test_usecase.dart';
import 'package:domain/src/usecase/marketing/cancel_school_visit_usecase.dart';
import 'package:domain/src/usecase/marketing/create_competency_test_usecase.dart';
import 'package:domain/src/usecase/marketing/create_school_visit_usecase.dart';
import 'package:domain/src/usecase/marketing/delete_enquiry_document_usecase.dart';
import 'package:domain/src/usecase/marketing/download_enquiry_document.dart';
import 'package:domain/src/usecase/marketing/ger_registration_detail_usecase.dart';
import 'package:domain/src/usecase/marketing/get_competency_test_detail_usecase.dart';
import 'package:domain/src/usecase/marketing/get_enquiry_detail_usecase.dart';
import 'package:domain/src/usecase/marketing/get_enquiry_timeline_usecase.dart';
import 'package:domain/src/usecase/marketing/get_school_visit_detail_usecase.dart';
import 'package:domain/src/usecase/marketing/reschedule_competency_test_usecase.dart';
import 'package:domain/src/usecase/marketing/reschedule_school_visit_usecase.dart';
import 'package:domain/src/usecase/marketing/upload_enquiry_document_usecase.dart';
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
  GetEnquiryListUsecase getEnquiryListUseCase(EnquiryRepository enquiryRepository) {
    return GetEnquiryListUsecase(enquiryRepository);
  }

  @lazySingleton
  GetEnquiryDetailUseCase getEnquiryDetailUseCase (EnquiryRepository enquiryRepository) {
    return GetEnquiryDetailUseCase(enquiryRepository);
  }

  @lazySingleton
  GetEnquiryTimeLineUseCase getEnquiryTimeLineUseCase (EnquiryRepository enquiryRepository) {
    return GetEnquiryTimeLineUseCase(enquiryRepository);
  }

  @lazySingleton
  GetAdmissionJourneyUsecase getAdmissionJourneyUsecase(EnquiryRepository enquiryRepository) {
    return GetAdmissionJourneyUsecase(enquiryRepository);
  }

  @lazySingleton
  GetAdmissionListUsecase getAdmissionListUsecase(AdmissionRepository admissionRepository) {
    return GetAdmissionListUsecase(admissionRepository);
  }

  @lazySingleton
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase(EnquiryRepository enquiryRepository) {
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
  DownloadEnquiryDocumentUsecase downloadEnquiryDocumentUsecase (EnquiryRepository enquiryRepository){
    return DownloadEnquiryDocumentUsecase(enquiryRepository);
  }

  @lazySingleton
  DeleteEnquiryDocumentUsecase deleteEnquiryDocumentUsecase (EnquiryRepository enquiryRepository){
    return DeleteEnquiryDocumentUsecase(enquiryRepository);
  }

  @lazySingleton
  UploadEnquiryDocumentUsecase uploadEnquiryDocumentUsecase (EnquiryRepository enquiryRepository) {
    return UploadEnquiryDocumentUsecase(enquiryRepository);
  }
  
  @lazySingleton
  CreateCompetencyTestUsecase createCompetencyTestUsecase (CompetencyTestRepository competencyTestRepository) {
    return CreateCompetencyTestUsecase(competencyTestRepository);
  }

  @lazySingleton
  RescheduleCompetencyTestUseCase rescheduleCompetencyTestUseCase (CompetencyTestRepository competencyTestRepository) {
    return RescheduleCompetencyTestUseCase(competencyTestRepository);
  }

  @lazySingleton
  CancelCompetencyTestUsecase cancelCompetencyTestUsecase (CompetencyTestRepository competencyTestRepository) {
    return CancelCompetencyTestUsecase(competencyTestRepository);
  }

  @lazySingleton
  GetCompetencyTestDetailUseCase getCompetencyTestDetailUseCase (CompetencyTestRepository competencyTestRepository) {
    return GetCompetencyTestDetailUseCase(competencyTestRepository);
  }

  @lazySingleton
  CreateSchoolVisitUseCase createSchoolVisitUseCase (SchoolVisitRepository schoolVisitRepository) {
    return CreateSchoolVisitUseCase(schoolVisitRepository);
  }

  @lazySingleton
  RescheduleSchoolVisitUseCase rescheduleSchoolVisitUseCase (SchoolVisitRepository schoolVisitRepository) {
    return RescheduleSchoolVisitUseCase(schoolVisitRepository);
  }

  @lazySingleton
  CancelSchoolVisitUsecase cancelSchoolVisitUsecase (SchoolVisitRepository schoolVisitRepository) {
    return CancelSchoolVisitUsecase(schoolVisitRepository);
  }

  @lazySingleton
  GetSchoolVisitDetailUseCase getSchoolVisitDetailUseCase (SchoolVisitRepository schoolVisitRepository) {
    return GetSchoolVisitDetailUseCase(schoolVisitRepository);
  }

  @lazySingleton
  GetRegistrationDetailUsecase getRegistrationDetailUsecase (RegistrationRepository registrationRepository) {
    return GetRegistrationDetailUsecase(registrationRepository);
  }
}