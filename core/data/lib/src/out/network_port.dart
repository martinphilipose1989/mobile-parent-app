import 'package:domain/domain.dart';

import 'dart:io';

import 'package:network_retrofit/network_retrofit.dart';


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
      required int applicableTo});

  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List<int> studentIds, required List<int> academicYearIds});
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10});
  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail({required String enquiryID});
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline({required String enquiryID});
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID,required String type});
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID});
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID});
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID});

  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType});
  Future<Either<NetworkError, BaseInfo<T>>> updateParentDetails<T>({required String enquiryID, required ParentInfoEntity parentInfo});
  Future<Either<NetworkError, BaseInfo<T>>> updateContactDetails<T>({required String enquiryID, required ContactDetailsEntity contactDetails});
  Future<Either<NetworkError, BaseInfo<T>>> updateMedicalDetails<T>({required String enquiryID, required MedicalDetailsEntity medicalDetails});
  Future<Either<NetworkError, BaseInfo<T>>> updateBankDetails<T>({required String enquiryID, required  BankDetailsEntity bankDetails});  

  Future<Either<NetworkError,Slots>> getSchoolVisitSlots({required String enquiryID,required String date});
  Future<Either<NetworkError,SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID});
  Future<Either<NetworkError,SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolRequest});
  
  Future<Either<NetworkError,AdmissionListBaseModel>> getAdmissionList({required String phone,required int pageNumber,int pageSize = 10});
  
  Future<Either<NetworkError,Slots>> getCompetencyTestSlots({required String enquiryID,required date});
  Future<Either<NetworkError,CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID,});
  Future<Either<NetworkError,CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> cancelCompetencyTest({required String competencyTest,required CancelCompetencyTestRequest cancelCompetencyTestRequest});

  Future<Either<NetworkError,EnquiryFileUploadBase>> uploadEnquiryDocument({required String enquiryID,required String documentID,required File file});
  Future<Either<NetworkError,DownloadEnquiryFileBase>> downloadEnquiryDocument({required String enquiryID,required String documentID});
  Future<Either<NetworkError,DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID,required String documentID});
  
}
  
