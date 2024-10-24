import 'package:data/data.dart';
import 'package:network_retrofit/src/model/request/communication/create_communication_log_model_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/create_ticket_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/find_by_category_subcategory_request.dart';
import 'package:network_retrofit/src/model/request/communication/get_ticket_list_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_academic_year_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_guardian_student_details_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_payment_status_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_pending_fees_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_school_name_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_siblings_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_token_generator_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_transaction_type_fees_collectes_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_validate_pay_now_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/additional_info_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/device_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/orders_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/payment_order_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/student_fee_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/fee_id_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/get_store_payment_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/payment_details_request.dart';
import 'package:network_retrofit/src/services/admin_retorfit_service.dart';
import 'package:network_retrofit/src/services/finance_retrofit_service.dart';
import 'package:network_retrofit/src/services/ticket_retrofit_service.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';
import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;
  final FinanceRetrofitService financeRetrofitService;
  final AdminRetorfitService adminRetorfitService;
  final TicketRetrofitService ticketRetrofitService;

  NetworkAdapter(
      {required this.apiService,
      required this.financeRetrofitService,
      required this.adminRetorfitService,
      required this.ticketRetrofitService});

  @override
  Future<Either<NetworkError, GetsibglingListModel>> getSiblingsList(
      {required int studentId, required List<int> lobIDs}) async {
    var response = await safeApiCall(apiService.getSiblingsList(
        GetSiblingsRequest(lobIDs: lobIDs, studentId: studentId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetAcademicYearModel>> getAcademicYear(
      {required String type, required List<int> students}) async {
    var response = await safeApiCall(financeRetrofitService.getAcademicYear(
        GetAcademicYearRequest(students: students, type: type)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetTokenGeneratorModel>> getTokenGenerator(
      {required int segmentLobId}) async {
    var response = await safeApiCall(apiService.getTokenGenerator(
        GetTokenGeneratorRequest(segmentLobId: segmentLobId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetValidateOnPayModel>> getValidatePayNow(
      {required int paymentMode, required List<int> studentFeeIds}) async {
    var response = await safeApiCall(financeRetrofitService.getValidatePayNow(
        GetValidatePayNowRequest(
            paymentMode: paymentMode, studentFeeIds: studentFeeIds)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetStorePaymentModel>> getStorePayment(
      {required StorePaymentModelRequest storePaymentModelRequest}) async {
    var response = await safeApiCall(financeRetrofitService.getStorePayment(
        GetStorePaymentRequest(
            chequeInFavour: storePaymentModelRequest.chequeInFavour,
            lobID: storePaymentModelRequest.lobId,
            paymentAmount: storePaymentModelRequest.paymentAmount,
            paymentMode: storePaymentModelRequest.paymentMode,
            forMobile: storePaymentModelRequest.forMobile,
            feeIds: storePaymentModelRequest.feeIds
                .map((e) => FeeId(
                    amountBeforeDiscount: e.amountBeforeDiscount,
                    couponId: e.couponId,
                    studentFeeId: e.studentFeeId,
                    collected: e.collected,
                    feeOrder: e.feeOrder))
                .toList(),
            paymentDetails: storePaymentModelRequest.paymentDetails
                .map((e) => PaymentDetail(
                    amount: e.amount,
                    chequeDate: e.chequeDate,
                    chequeImage: e.chequeImage,
                    chequeNo: e.chequeNo,
                    bankName: '',
                    issuerIfsc: e.issuerIfsc,
                    issuerName: e.issuerName,
                    paymentModeId: e.paymentModeId,
                    tokenNo: e.tokenNo,
                    feeId: e.feeId))
                .toList())));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetGuardianStudentDetailsModel>>
      getGuardianStudentDetails({required int mobileNo}) async {
    var response = await safeApiCall(apiService.getGuardianStudentDetails(
        GetGuardianStudentDetailsRequest(mobileNo: mobileNo)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetPendingFeesModel>> getPendingFees(
      {required String type,
      required List<int> students,
      required List<int> academicYear,
      required int applicableTo,
      int? entityId,
      int? brandId}) async {
    var response = await safeApiCall(financeRetrofitService.getPendingFees(
        GetPendingFeesRequest(
            type: type,
            students: students,
            academicYear: academicYear,
            applicableTo: applicableTo,
            brandId: brandId,
            entityId: entityId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List<int> studentIds,
      required List<int> academicYearIds}) async {
    var response = await safeApiCall(financeRetrofitService.getSchoolNames(
        SchoolNamesRequest(
            academicYearIds: academicYearIds, studentIds: studentIds)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetTransactionTypeModel>> getTransactionType(
      {required int id}) async {
    var response =
        await safeApiCall(financeRetrofitService.getTransactionType(id));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetTransactiontypefeesCollectedModel>>
      getTransactionTypeFeesCollected(
          {required List<int> students,
          required List<int> academicYear}) async {
    var response = await safeApiCall(financeRetrofitService
        .getTransactionTypeFeesCollected(GetTransactionTypeFeesCollectesRequest(
            students: students, academicYear: academicYear)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetPaymentOrderResponseModel>> getPaymentOrder(
      {required PaymentOrderModel paymentOrderModel}) async {
    var response = await safeApiCall(
        financeRetrofitService.getPaymentOrder(PaymentOrderRequestModel(
            orders: OrdersRequest(
      additionalInfo: AdditionalInfoRequest(
        customerContact:
            paymentOrderModel.orders?.additionalInfo?.customerContact,
        customerEmail: paymentOrderModel.orders?.additionalInfo?.customerEmail,
        customerName: paymentOrderModel.orders?.additionalInfo?.customerName,
      ),
      bankWalletMerchantId: paymentOrderModel.orders?.bankWalletMerchantId,
      currency: paymentOrderModel.orders?.currency,
      lobId: paymentOrderModel.orders?.lobId,
      paymentGateway: paymentOrderModel.orders?.paymentGateway,
      paymentModeId: paymentOrderModel.orders?.paymentModeId,
      receipt: paymentOrderModel.orders?.receipt,
      serviceProviderId: paymentOrderModel.orders?.serviceProviderId,
      studentFees: List.generate(
        paymentOrderModel.orders?.studentFees?.length ?? 0,
        (index) {
          return StudentFeeRequest(
              amount: paymentOrderModel.orders?.studentFees?[index].amount,
              feeId: paymentOrderModel.orders?.studentFees?[index].feeId,
              id: paymentOrderModel.orders?.studentFees?[index].id,
              couponId: paymentOrderModel.orders?.studentFees?[index].couponId,
              amountBeforeDiscount: paymentOrderModel
                  .orders?.studentFees?[index].amountBeforeDiscount);
        },
      ),
      transactionTypeId: paymentOrderModel.orders?.transactionTypeId,
      device: DeviceRequest(
          acceptHeader: paymentOrderModel.orders?.device?.acceptHeader,
          browserColorDepth:
              paymentOrderModel.orders?.device?.browserColorDepth,
          browserJavaEnabled:
              paymentOrderModel.orders?.device?.browserJavaEnabled,
          browserJavascriptEnabled:
              paymentOrderModel.orders?.device?.browserJavascriptEnabled,
          browserLanguage: paymentOrderModel.orders?.device?.browserLanguage,
          browserScreenHeight:
              paymentOrderModel.orders?.device?.browserScreenHeight,
          browserScreenWidth:
              paymentOrderModel.orders?.device?.browserScreenWidth,
          browserTz: paymentOrderModel.orders?.device?.browserTz,
          initChannel: paymentOrderModel.orders?.device?.initChannel,
          ip: paymentOrderModel.orders?.device?.ip,
          userAgent: paymentOrderModel.orders?.device?.userAgent),
      amount: paymentOrderModel.orders?.amount,
    ))));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetStoreImageModel>> setStoreImage(
      {required file, required fileName}) async {
    var response = await safeApiCall(
        financeRetrofitService.setStoreImage(file: file, fileName: fileName));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetPaymentStatusModel>> getPaymentStatus(
      {required String orderId}) async {
    var response = await safeApiCall(financeRetrofitService
        .getPaymentStatus(GetPaymentStatusRequest(orderId: orderId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds}) async {
    var response = await safeApiCall(adminRetorfitService.getCoupons(
        studentId: studentId,
        feeTypeIds: feeTypeIds,
        feeCategoryIds: feeCategoryIds,
        feeSubCategoryIds: feeSubCategoryIds));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page}) async {
    GetTicketListRequest getTicketListRequest =
        GetTicketListRequest(page: page, pageSize: pageSize);
    var response = await safeApiCall(ticketRetrofitService.getTicketsList(
        getTicketListRequest: getTicketListRequest));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, MsgCategoryModel>> createCategory() async {
    var response = await safeApiCall(apiService.createCategory());
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, MsgSubCategoryModel>> createSubCategory() async {
    var response = await safeApiCall(apiService.createSubCategory());
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, CreateCommunicationModel>>
      createCommunication() async {
    var response =
        await safeApiCall(ticketRetrofitService.createCommunication());
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, FindByCategorySubCategoryModel>>
      findByCategorySubCategory(
          {required int categoryId, required int subCategoryId}) async {
    FindByCategorySubCategoryRequest findByCategorySubCategoryRequest =
        FindByCategorySubCategoryRequest(
            categoryId: categoryId, subCategoryId: subCategoryId);
    var response = await safeApiCall(
        ticketRetrofitService.findByCategorySubCategory(
            findByCategorySubCategoryRequest:
                findByCategorySubCategoryRequest));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetCommunicationDetails>> createCommunicationLog(
      {required String communocationId}) async {
    var response = await safeApiCall(ticketRetrofitService
        .createCommunicationLog(communocationId: communocationId));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, SendCommunicationModel>> sendCommunication(
      {required CreateCommunicationLogRequest
          createCommunicationLogRequest}) async {
    CreateCommunicationLogRequestEntity createCommunicationLogRequestEntity =
        CreateCommunicationLogRequestEntity(
            attachmentDetails: createCommunicationLogRequest.attachmentDetails,
            comment: createCommunicationLogRequest.comment,
            communicationId: createCommunicationLogRequest.communicationId,
            createdAt: createCommunicationLogRequest.createdAt,
            isDraft: createCommunicationLogRequest.isDraft,
            rating: createCommunicationLogRequest.rating,
            status: createCommunicationLogRequest.status,
            updatedAt: createCommunicationLogRequest.updatedAt,
            userId: createCommunicationLogRequest.userId);
    var response = await safeApiCall(ticketRetrofitService.sendCommunication(
        createCommunicationLogRequestEntity:
            createCommunicationLogRequestEntity));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, CreateTicketModel>> createTicket(
      {required CreateTicketRequest createTicketRequest}) async {
    CreateTicketRequestEntity createTicketRequestEntity =
        CreateTicketRequestEntity(
            attachment: createTicketRequest.attachment,
            categoryId: createTicketRequest.categoryId,
            communication: createTicketRequest.communication,
            parentId: createTicketRequest.parentId,
            studentId: createTicketRequest.studentId,
            subcategoryId: createTicketRequest.subcategoryId,
            ticketTitle: createTicketRequest.ticketTitle);
    var response = await safeApiCall(ticketRetrofitService.createTicket(
        createTicketRequestEntity: createTicketRequestEntity));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }
}
