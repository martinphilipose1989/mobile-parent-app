import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class FinanceRepository {
  Future<Either<NetworkError, GetsibglingListModel>> getSiblingsList(
      {required int studentId, required List<int> lobIDs});

  Future<Either<NetworkError, GetAcademicYearModel>> getAcademicYear(
      {required String type, required List students});

  Future<Either<NetworkError, GetTokenGeneratorModel>> getTokenGenerator(
      {required int segmentLobId});

  Future<Either<NetworkError, GetValidateOnPayModel>> getValidatePayNow(
      {required int paymentMode, required List studentFeeIds});

  Future<Either<NetworkError, GetStorePaymentModel>> getStorePayment(
      {required StorePaymentModelRequest storePaymentModelRequest});

  Future<Either<NetworkError, GetGuardianStudentDetailsModel>>
      getGuardianStudentDetails({required int mobileNo});

  Future<Either<NetworkError, GetPendingFeesModel>> getPendingFees(
      {required String type,
      required List students,
      required List<int> academicYear,
      required int applicableTo,
      int? brandId,
      int? entityId});

  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List studentIds, required List<int> academicYearIds});

  Future<Either<NetworkError, GetTransactionTypeModel>> getTransactionType(
      {required int id});

  Future<Either<NetworkError, GetTransactiontypefeesCollectedModel>>
      getTransactionTypeFeesCollected(
          {required List<int> students, required List<int> academicYear});

  Future<Either<NetworkError, GetPaymentOrderResponseModel>> getPaymentOrder(
      {required PaymentOrderModel paymentOrderModel});

  Future<Either<NetworkError, GetStoreImageModel>> setStoreImage(
      {required File file, required String fileName});

  Future<Either<NetworkError, GetPaymentStatusModel>> getPaymentStatus(
      {required String orderId});

  Future<Either<NetworkError, dynamic>> cancelPaymentRequest(
      {required String paymentGateway, required String orderId});

  Future<Either<NetworkError, Uint8List>> downloadTransactionHistory(
      {required String id, required String fileType});

  Future<Either<NetworkError, Uint8List>> downloadFeeTypeTransactions(
      {required String urlKey});

  Future<Either<NetworkError, Uint8List>> downloadStudentLedger(
      {required StudentLedgerDownloadRequest body});

  Future<Either<NetworkError, NewEnrolmentResponse>> createNewEnrolment(
      {required NewEnrolmentCreate newEnrolmentCreate});

  Future<Either<NetworkError, TermsAndConditionsFile>> getTermsAndConditionFile(
      {required String url});

  Future<Either<NetworkError, UndertakingResponse>> underTakingStudent(
      {required UndertakingRequest body});
}
