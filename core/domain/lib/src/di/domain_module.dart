import 'package:domain/domain.dart';
import 'package:domain/src/usecase/communication/create_category_usecase.dart';
import 'package:domain/src/usecase/communication/create_communication_log_usecase.dart';
import 'package:domain/src/usecase/communication/create_new_communication.dart';
import 'package:domain/src/usecase/communication/create_sub_category_usecase.dart';
import 'package:domain/src/usecase/communication/find_by_category_sub_category_usecase.dart';
import 'package:domain/src/usecase/communication/send_communication_usecase.dart';
import 'package:domain/src/usecase/communication/ticket_listing_usecase.dart';
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
}
