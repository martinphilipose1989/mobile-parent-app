import 'package:domain/domain.dart';
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
}
