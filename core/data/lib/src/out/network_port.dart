import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, GetsibglingListModel>> getSiblingsList(
      {required int studentId, required List<int> lobIDs});

  Future<Either<NetworkError, GetAcademicYearModel>> getAcademicYear(
      {required String type, required List<int> students});

  Future<Either<NetworkError, GetTokenGeneratorModel>> getTokenGenerator(
      {required int segmentLobId});

  Future<Either<NetworkError, GetValidateOnPayModel>> getValidatePayNow(
      {required int paymentMode, required List<int> studentFeeIds});

  Future<Either<NetworkError, GetStorePaymentModel>> getStorePayment(
      {required StorePaymentModelRequest storePaymentModelRequest});

  Future<Either<NetworkError, GetGuardianStudentDetailsModel>>
      getGuardianStudentDetails({required int mobileNo});

  Future<Either<NetworkError, GetPendingFeesModel>> getPendingFees(
      {required String type,
      required List<int> students,
      required List<int> academicYear,
      required int applicableTo,
      int? entityId,
      int? brandId});

  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List<int> studentIds, required List<int> academicYearIds});

  Future<Either<NetworkError, GetTransactionTypeModel>> getTransactionType(
      {required int id});

  Future<Either<NetworkError, GetTransactiontypefeesCollectedModel>>
      getTransactionTypeFeesCollected(
          {required List<int> students, required List<int> academicYear});

  Future<Either<NetworkError, GetPaymentOrderResponseModel>> getPaymentOrder(
      {required PaymentOrderModel paymentOrderModel});

  Future<Either<NetworkError, GetStoreImageModel>> setStoreImage(
      {required file, required fileName});

  Future<Either<NetworkError, GetPaymentStatusModel>> getPaymentStatus(
      {required String orderId});

  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds});

  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page});

  Future<Either<NetworkError, MsgCategoryModel>> createCategory();
  Future<Either<NetworkError, MsgSubCategoryModel>> createSubCategory();
}
