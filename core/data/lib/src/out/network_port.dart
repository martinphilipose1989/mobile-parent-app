import 'dart:io';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/gatepass/get_visitor_details_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class NetworkPort {
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
      int? entityId,
      int? brandId});

  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List studentIds, required List<int> academicYearIds});

  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList(
      {required String phone,
      required int pageNumber,
      int pageSize = 10,
      required String status});

  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail(
      {required String enquiryID});

  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline(
      {required String enquiryID});

  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney(
      {required String enquiryID, required String type});

  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail(
      {required String enquiryID});

  Future<Either<NetworkError, PsaResponse>> getPsaDetail(
      {required String enquiryID});

  Future<Either<NetworkError, IVTBase>> getIvtDetail(
      {required String enquiryID});

  Future<Either<NetworkError, NewAdmissionBase>> updateNewAdmissionDetail(
      {required String enquiryID,
      required NewAdmissionDetailEntity newAdmissionDetail});

  Future<Either<NetworkError, IVTBase>> updateIvtDetail(
      {required String enquiryID, required IvtDetailResponseEntity ivtDetails});

  Future<Either<NetworkError, PsaResponse>> updatePsaDetail(
      {required String enquiryID, required PsaDetailResponseEntity psaDetail});

  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail(
      {required String enquiryID, required String infoType});

  Future<Either<NetworkError, SingleResponse>> updateParentDetails(
      {required String enquiryID, required ParentInfoEntity parentInfo});

  Future<Either<NetworkError, SingleResponse>> updateContactDetails(
      {required String enquiryID,
      required ContactDetailsEntity contactDetails});

  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails(
      {required String enquiryID,
      required MedicalDetailsEntity medicalDetails});

  Future<Either<NetworkError, SingleResponse>> updateBankDetails(
      {required String enquiryID, required BankDetailsEntity bankDetails});

  Future<Either<NetworkError, Slots>> getSchoolVisitSlots(
      {required String enquiryID, required String date});

  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail(
      {required String enquiryID});

  Future<Either<NetworkError, SchoolVisitDetailBase>> createSchoolVisit(
      {required String enquiryID,
      required SchoolCreationRequest schoolCreationRequest});

  Future<Either<NetworkError, SchoolVisitDetailBase>> rescheduleSchoolVisit(
      {required String enquiryID,
      required RescheduleSchoolVisitRequest schoolCreationRequest});

  Future<Either<NetworkError, SchoolVisitDetailBase>> cancelSchoolVisit(
      {required String enquiryID,
      required SchoolVisitCancelRequest cancelSchoolRequest});

  Future<Either<NetworkError, AdmissionListBaseModel>> getAdmissionList(
      {required String phone,
      required int pageNumber,
      int pageSize = 10,
      required String status});

  Future<Either<NetworkError, Slots>> getCompetencyTestSlots(
      {required String enquiryID, required date});

  Future<Either<NetworkError, CompetencyTestDetailBase>>
      getCompetencyTestDetail({
    required String enquiryID,
  });

  Future<Either<NetworkError, CompetencyTestDetailBase>> createCompetencyTest(
      {required String enquiryID,
      required CompetencyTestCreationRequest competencyTestCreationRequest});

  Future<Either<NetworkError, CompetencyTestDetailBase>>
      rescheduleCompetencyTest(
          {required String enquiryID,
          required CompetencyTestRescheduleRequest
              competencyTestCreationRequest});

  Future<Either<NetworkError, CompetencyTestDetailBase>> cancelCompetencyTest(
      {required String enquiryID,
      required CancelCompetencyTestRequest cancelCompetencyTestRequest});

  Future<Either<NetworkError, EnquiryFileUploadBase>> uploadEnquiryDocument(
      {required String enquiryID,
      required String documentID,
      required File file});

  Future<Either<NetworkError, DownloadEnquiryFileBase>> downloadEnquiryDocument(
      {required String enquiryID,
      required String documentID,
      required String download});

  Future<Either<NetworkError, DeleteEnquiryFileBase>> deleteEnquiryDocument(
      {required String enquiryID,
      required String documentID,
      required String delete,
      required String verify});

  Future<Either<NetworkError, MdmAttributeBaseModel>> getMdmAttribute(
      {required String infoType, int? id});

  Future<Either<NetworkError, CityAndStateResponse>> getCityAndStateByPincode(
      {required String pincode});

  Future<Either<NetworkError, Uint8List>> downloadFile(
      {required String fileUrl});

  Future<Either<NetworkError, SiblingProfileResponse>> getSiblingDetail(
      {required GetSiblingDetailRequest getSiblingDetailRequest});

  Future<Either<NetworkError, SubjectDetailResponse>> selectOptionalSubject(
      {required List<SubjectSelectionRequest> subjectSelectionRequest,
      required String enquiryID});

  Future<Either<NetworkError, VasOptionResponse>> addVASOption(
      {required String enquiryID, required VasOptionRequest vasOptionRequest});

  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody});

  Future<Either<NetworkError, TokenIntrospectionResponse>> getTokenResponse(
      {required String token,
      required String clientId,
      required String clientSecret});

  Future<Either<NetworkError, SubjectListResponse>> getSubjectList(
      {required SubjectListingRequest subjectListingRequest});

  Future<Either<NetworkError, PsaEnrollmentDetailResponseModel>>
      getPsaEnrollmentDetail({required VasDetailRequest vasDetailRequest});

  Future<Either<NetworkError, CafeteriaEnrollmentResponseModel>>
      getCafeteriaEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest});

  Future<Either<NetworkError, SummerCampEnrollmentResponseModel>>
      getSummerCampEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest});

  Future<Either<NetworkError, KidsClubEnrollmentResponseModel>>
      getKidsClubEnrollmentDetail({required VasDetailRequest vasDetailRequest});

  Future<Either<NetworkError, TransportEnrollmentResponseModel>>
      getTransportEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest});

  Future<Either<NetworkError, VasOptionResponse>> calculateFees(
      {required VasEnrollmentFeeCalculationRequest feeCalculationRequest});

  Future<Either<NetworkError, VasOptionResponse>> addVasDeatil(
      {required String enquiryID,
      required String type,
      required VasEnrollmentRequest vasEnrollmentRequest});

  Future<Either<NetworkError, VasOptionResponse>> removeVasDeatil(
      {required String enquiryID, required String type});

  Future<Either<NetworkError, VasOptionResponse>> makePaymentRequest(
      {required String enquiryID});

  Future<Either<NetworkError, FetchStopResponseModel>> fetchStops(
      {required FetchStopRequest fetchStopRequest});

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

  Future<Either<NetworkError, UserRolePermissionResponse>>
      getUserRolePermissions({required UserRolePermissionRequest request});

  Future<Either<NetworkError, MoveToNextStageEnquiryResponse>>
      moveToNextStageEnquiry({required String enquiryId});

  Future<Either<NetworkError, UploadFileResponseModel>> uploadProfileImage({
    required File file,
    String module = "GATE",
  });

  Future<Either<NetworkError, CreateGatepassResponseModel>>
      createVisitorGatePass({required CreateGatePassModel request});

  Future<Either<NetworkError, MdmCoReasonResponseModel>>
      getPurposeOfVisitList();

  Future<Either<NetworkError, VisitorDetailsResponseModel>> getVisitorDetails({required GetVisitorDetailsUseCaseParams params});
}
