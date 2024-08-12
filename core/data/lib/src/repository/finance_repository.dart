import 'package:domain/domain.dart';

import '../out/network_port.dart';

class FinanceRepositoryImpl extends FinanceRepository {
  final NetworkPort networkPort;

  FinanceRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, GetsibglingListModel>> getSiblingsList(
      {required int studentId, required List<int> lobIDs}) {
    return networkPort.getSiblingsList(studentId: studentId, lobIDs: lobIDs);
  }

  @override
  Future<Either<NetworkError, GetAcademicYearModel>> getAcademicYear(
      {required String type, required List<int> students}) {
    return networkPort.getAcademicYear(type: type, students: students);
  }

  @override
  Future<Either<NetworkError, GetTokenGeneratorModel>> getTokenGenerator(
      {required int segmentLobId}) {
    return networkPort.getTokenGenerator(segmentLobId: segmentLobId);
  }

  @override
  Future<Either<NetworkError, GetValidateOnPayModel>> getValidatePayNow(
      {required int paymentMode, required List<int> studentFeeIds}) {
    return networkPort.getValidatePayNow(
        paymentMode: paymentMode, studentFeeIds: studentFeeIds);
  }

  @override
  Future<Either<NetworkError, GetStorePaymentModel>> getStorePayment(
      {required StorePaymentModelRequest storePaymentModelRequest}) {
    return networkPort.getStorePayment(
        storePaymentModelRequest: storePaymentModelRequest);
  }

  @override
  Future<Either<NetworkError, GetGuardianStudentDetailsModel>>
      getGuardianStudentDetails({required int mobileNo}) {
    return networkPort.getGuardianStudentDetails(mobileNo: mobileNo);
  }

  @override
  Future<Either<NetworkError, GetPendingFeesModel>> getPendingFees(
      {required String type,
      required List<int> students,
      required List<int> academicYear,
      required int applicableTo}) {
    return networkPort.getPendingFees(
        type: type,
        students: students,
        academicYear: academicYear,
        applicableTo: applicableTo);
  }

  @override
  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List<int> studentIds, required List<int> academicYearIds}) {
    return networkPort.getSchoolNames(
        studentIds: studentIds, academicYearIds: academicYearIds);
  }
}
