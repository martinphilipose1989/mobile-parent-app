import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/attendance/attendance_count_request_entity.dart';
import 'package:network_retrofit/src/model/request/attendance/attendance_details_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/create_communication_log_model_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/create_ticket_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/find_by_category_subcategory_request.dart';
import 'package:network_retrofit/src/model/request/communication/get_ticket_list_request.dart';
import 'package:network_retrofit/src/model/request/disciplinary_slip/acknowledge_request_entity.dart';
import 'package:network_retrofit/src/model/request/disciplinary_slip/disciplinary_list_request.dart';
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
import 'package:network_retrofit/src/model/request/gatepass/create_gatepass_entity.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/model/request/move_next_stage_request.dart';
import 'package:network_retrofit/src/model/request/user/user_role_permission_request_entity.dart';
import 'package:network_retrofit/src/model/response/gatepass/visitor_details_response_entity.dart';
import 'package:network_retrofit/src/services/admin_retorfit_service.dart';
import 'package:network_retrofit/src/services/attendance_retrofit_service.dart';
import 'package:network_retrofit/src/services/disciplinary_retrofit_services.dart';
import 'package:network_retrofit/src/services/finance_retrofit_service.dart';
import 'package:network_retrofit/src/services/ticket_retrofit_service.dart';
import 'package:network_retrofit/src/services/transport_service.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';
import 'package:retrofit/dio.dart';
import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;
  final FinanceRetrofitService financeRetrofitService;
  final AdminRetorfitService adminRetorfitService;
  final DisciplinaryRetorfitService disciplinaryRetorfitService;
  final AttendanceRetorfitService attendanceRetorfitService;
  final TicketRetrofitService ticketRetrofitService;
  final TransportService transportService;
  final mdmToken =
      "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933";

  // final String rbacToken =
  //     "Bearer 580469a1200ce1057656f73a3ceb2af1146dcda478b4706f80e906157bc75e1e61e45a12fd475e4a7b1d60dafc3ae2e29caa2103ba9ca116a5de942ca8e0eb27e6b8e2baba7a19a548a4a86bd04a518875f9024f8cf5b36c66faf0a001a8569dd9cc358009eaef1f5d4ca1b6a9beaa21c9e6838239dc2da004178dece9a1d81c";

  final String platform = "app";

  NetworkAdapter({required this.apiService,
    required this.transportService,
    required this.attendanceRetorfitService,
    required this.disciplinaryRetorfitService,
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
      {required String type, required List students}) async {
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
      {required int paymentMode, required List studentFeeIds}) async {
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
                .map((e) =>
                FeeId(
                    amountBeforeDiscount: e.amountBeforeDiscount,
                    couponId: e.couponId,
                    studentFeeId: e.studentFeeId,
                    collected: e.collected,
                    feeOrder: e.feeOrder))
                .toList(),
            paymentDetails: storePaymentModelRequest.paymentDetails
                .map((e) =>
                PaymentDetail(
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
        mdmToken, GetGuardianStudentDetailsRequest(mobileNo: mobileNo)));
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
        required List students,
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
      {required List studentIds, required List<int> academicYearIds}) async {
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
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList(
      {required String phone,
        required int pageNumber,
        int pageSize = 10,
        required String status}) async {
    var response = await safeApiCall(apiService.getEnquiryList(
        phone: phone,
        pageNumber: pageNumber,
        pageSize: pageSize,
        status: status));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney(
      {required String enquiryID, required String type}) async {
    var response = await safeApiCall(
        apiService.getAdmissionJourney(enquiryID: enquiryID, type: type));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail(
      {required String enquiryID}) async {
    var response = await safeApiCall(
        apiService.getNewAdmissionDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      var data = r.data.data?.schoolLocation?.value ?? '';
      var transformData = r.data.transform();
      print("School Location: $data");
      print(
          "Transformed School Location: ${transformData.data?.schoolLocation
              ?.value}");
      return Right(r.data.transform());
    });
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> updateNewAdmissionDetail(
      {required String enquiryID,
        required NewAdmissionDetailEntity newAdmissionDetail}) async {
    var response = await safeApiCall(apiService.updateNewAdmissionDetail(
        enquiryID: enquiryID, newAdmissionDetail: newAdmissionDetail));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, PsaResponse>> getPsaDetail(
      {required String enquiryID}) async {
    var response =
    await safeApiCall(apiService.getPsaDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, PsaResponse>> updatePsaDetail(
      {required String enquiryID,
        required PsaDetailResponseEntity psaDetail}) async {
    var response = await safeApiCall(
        apiService.updatePsaDetail(enquiryID: enquiryID, psaDetail: psaDetail));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, IVTBase>> getIvtDetail(
      {required String enquiryID}) async {
    var response =
    await safeApiCall(apiService.getIvtDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, IVTBase>> updateIvtDetail(
      {required String enquiryID,
        required IvtDetailResponseEntity ivtDetails}) async {
    var response = await safeApiCall(apiService.updateIvtDetail(
        enquiryID: enquiryID, ivtDetail: ivtDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Slots>> getSchoolVisitSlots({
    required String enquiryID,
    required String date,
  }) async {
    var response = await safeApiCall(apiService.getSchoolVisitSlots(
        date: date, enquiryId: enquiryID, platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail(
      {required String enquiryID}) async {
    var response = await safeApiCall(apiService.getSchoolVisitDetail(
        enquiryID: enquiryID, platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> createSchoolVisit(
      {required String enquiryID,
        required SchoolCreationRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.createSchoolVisit(
        enquiryID: enquiryID,
        schoolCreationRequest: schoolCreationRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> rescheduleSchoolVisit(
      {required String enquiryID,
        required RescheduleSchoolVisitRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleSchoolVisit(
        schoolVisitID: enquiryID,
        schoolCreationRequest: schoolCreationRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> cancelSchoolVisit(
      {required String enquiryID,
        required SchoolVisitCancelRequest cancelSchoolRequest}) async {
    var response = await safeApiCall(apiService.cancelSchoolVisit(
        enquiryID: enquiryID,
        schoolVisitCancelRequest: cancelSchoolRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Slots>> getCompetencyTestSlots(
      {required String enquiryID, required date}) async {
    var response = await safeApiCall(apiService.getCompetencyTestSlots(
        date: date, enquiryId: enquiryID, platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionListBaseModel>> getAdmissionList(
      {required String phone,
        required int pageNumber,
        int pageSize = 10,
        required String status}) async {
    var response = await safeApiCall(apiService.getAdmissionList(
        phone: phone,
        pageNumber: pageNumber,
        pageSize: pageSize,
        status: status,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>>
  getCompetencyTestDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getCompetencyTestDetail(
        enquiryID: enquiryID, platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> createCompetencyTest(
      {required String enquiryID,
        required CompetencyTestCreationRequest
        competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.createCompetencyTest(
        enquiryID: enquiryID,
        competencyTestCreationRequest: competencyTestCreationRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>>
  rescheduleCompetencyTest({required String enquiryID,
    required CompetencyTestRescheduleRequest
    competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleCompetencyTest(
        enquiryID: enquiryID,
        competencyTestCreationRequest: competencyTestCreationRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> cancelCompetencyTest(
      {required String enquiryID,
        required CancelCompetencyTestRequest cancelCompetencyTestRequest}) async {
    var response = await safeApiCall(apiService.cancelCompetencyTest(
        enquiryID: enquiryID,
        cancelCompetencyTestRequest: cancelCompetencyTestRequest,
        platform: platform));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail(
      {required String enquiryID}) async {
    var response =
    await safeApiCall(apiService.getEnquiryDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline(
      {required String enquiryID}) async {
    var response =
    await safeApiCall(apiService.getEnquiryTimeline(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, DownloadEnquiryFileBase>> downloadEnquiryDocument(
      {required String enquiryID,
        required String documentID,
        required String download}) async {
    var response = await safeApiCall(apiService.downloadEnquiryDocument(
        enquiryID: enquiryID, documentID: documentID, download: download));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Uint8List>> downloadFile(
      {required String fileUrl}) async {
    var response = await safeApiCall(apiService.downloadFile(fileUrl: fileUrl));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(Uint8List.fromList(r.data)));
  }

  @override
  Future<Either<NetworkError, DeleteEnquiryFileBase>> deleteEnquiryDocument(
      {required String enquiryID,
        required String documentID,
        required String delete,
        required String verify}) async {
    var response = await safeApiCall(apiService.deleteEnquiryDocument(
        enquiryID: enquiryID,
        documentID: documentID,
        delete: delete,
        verify: verify));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryFileUploadBase>> uploadEnquiryDocument(
      {required String enquiryID,
        required String documentID,
        required File file}) async {
    var response = await safeApiCall(apiService.uploadEnquiryDocument(
        file: file, documentID: documentID, enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail(
      {required String enquiryID, required String infoType}) async {
    var response = await safeApiCall(apiService.getRegistrationDetail(
        enquiryId: enquiryID, infoType: infoType));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      if (infoType == "ParentInfo") {
        ParentInfoEntity parentInfo = ParentInfoEntity.fromJson(jsonData);
        return Right(SingleResponse<ParentInfo>(
            status: r.data.status ?? 0,
            message: r.data.message ?? "",
            data: parentInfo.transform()));
      } else if (infoType == "ContactInfo") {
        ContactDetailsEntity contactDetails =
        ContactDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<ContactDetails>(
            status: r.data.status ?? 0,
            message: r.data.message ?? "",
            data: contactDetails.transform()));
      } else if (infoType == "MedicalInfo") {
        MedicalDetailsEntity medicalDetails =
        MedicalDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<MedicalDetails>(
            status: r.data.status ?? 0,
            message: r.data.message ?? "",
            data: medicalDetails.transform()));
      } else {
        BankDetailsEntity bankDetails = BankDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<BankDetails>(
            status: r.data.status ?? 0,
            message: r.data.message ?? "",
            data: bankDetails.transform()));
      }
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateParentDetails(
      {required String enquiryID, required ParentInfoEntity parentInfo}) async {
    var response = await safeApiCall(apiService.updateParentDetails(
        enquiryId: enquiryID, parentInfo: parentInfo));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      ParentInfoEntity parentInfo = ParentInfoEntity.fromJson(jsonData);
      return Right(SingleResponse<ParentInfo>(
          status: r.data.status ?? 0,
          message: r.data.message ?? "",
          data: parentInfo.transform()));
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateBankDetails(
      {required String enquiryID,
        required BankDetailsEntity bankDetails}) async {
    var response = await safeApiCall(apiService.updateBankDetails(
        enquiryId: enquiryID, bankDetails: bankDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      BankDetailsEntity bankDetails = BankDetailsEntity.fromJson(jsonData);
      return Right(SingleResponse<BankDetails>(
          status: r.data.status ?? 0,
          message: r.data.message ?? "",
          data: bankDetails.transform()));
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateContactDetails(
      {required String enquiryID,
        required ContactDetailsEntity contactDetails}) async {
    var response = await safeApiCall(apiService.updateContactDetails(
        enquiryId: enquiryID, contactDetails: contactDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      ContactDetailsEntity contactDetails =
      ContactDetailsEntity.fromJson(jsonData);
      return Right(SingleResponse<ContactDetails>(
          status: r.data.status ?? 0,
          message: r.data.message ?? "",
          data: contactDetails.transform()));
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails(
      {required String enquiryID,
        required MedicalDetailsEntity medicalDetails}) async {
    var response = await safeApiCall(apiService.updateMedicalDetails(
        enquiryId: enquiryID, medicalDetails: medicalDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      MedicalDetailsEntity medicalDetails =
      MedicalDetailsEntity.fromJson(jsonData);
      return Right(SingleResponse<MedicalDetails>(
          status: r.data.status ?? 0,
          message: r.data.message ?? "",
          data: medicalDetails.transform()));
    });
  }

  @override
  Future<Either<NetworkError, MdmAttributeBaseModel>> getMdmAttribute(
      {required String infoType, int? id}) async {
    switch (infoType) {
      case "schoolLocation":
        var response =
        await safeApiCall(apiService.getSchoolLocation(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));

      case "country":
        var response =
        await safeApiCall(apiService.getCountries(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));

      case "state":
        var response =
        await safeApiCall(apiService.getStates(token: mdmToken, id: id));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "city":
        var response =
        await safeApiCall(apiService.getCities(token: mdmToken, id: id));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "grade":
        var response = await safeApiCall(apiService.getGrades(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "gender":
        var response = await safeApiCall(apiService.getGender(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "stream":
        var response =
        await safeApiCall(apiService.getStreams(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "shift":
        var response = await safeApiCall(apiService.getShifts(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "board":
        var response =
        await safeApiCall(apiService.getSchoolBoard(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "batch":
        var response = await safeApiCall(apiService.getBatch(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "course":
        var response =
        await safeApiCall(apiService.getCourses(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "psaSubType":
        var response =
        await safeApiCall(apiService.getPsaSubType(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "psaCategory":
        var response =
        await safeApiCall(apiService.getPsaCategory(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "psaSubCategory":
        var response =
        await safeApiCall(apiService.getPsaSubCategory(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "periodOfService":
        var response =
        await safeApiCall(apiService.getPeriodOfService(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "academicYear":
        var response = await safeApiCall(
            apiService.getAcademicYearAttribute(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "bloodGroup":
        var response = await safeApiCall(
            apiService.getBloodGroupAttribute(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "occupation":
        var response = await safeApiCall(
            apiService.getOccupationAttribute(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "qualification":
        var response =
        await safeApiCall(apiService.getQualifications(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "religion":
        var response =
        await safeApiCall(apiService.getReligions(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "caste":
        var response = await safeApiCall(apiService.getCastes(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "subcaste":
        var response =
        await safeApiCall(apiService.getSubCastes(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "mother_tongue":
        var response =
        await safeApiCall(apiService.getMotherTongue(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "organization":
        var response =
        await safeApiCall(apiService.getOrganizations(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
    // case "designation":
    //   var response = await safeApiCall(apiService.getDesignation(
    //       token:
    //           "$mdmToken"));
    //   return response.fold((l) {
    //     return Left(l);
    //   }, (r) => Right(r.data.transform()));
      case "nationality":
        var response =
        await safeApiCall(apiService.getNationality(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "personalise_learning_needs":
        var response = await safeApiCall(
            apiService.getPersonalizedLearningNeeds(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      case "relationWithChild":
        var response =
        await safeApiCall(apiService.getRelationWithChild(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
      default:
        var response = await safeApiCall(
            apiService.getCancellationReason(token: mdmToken));
        return response.fold((l) {
          return Left(l);
        }, (r) => Right(r.data.transform()));
    }
  }

  @override
  Future<Either<NetworkError, CityAndStateResponse>> getCityAndStateByPincode(
      {required String pincode}) async {
    var response = await safeApiCall(
        apiService.getCityAndStateByPincode(token: mdmToken, pincode: pincode));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SiblingProfileResponse>> getSiblingDetail(
      {required GetSiblingDetailRequest getSiblingDetailRequest}) async {
    log(getSiblingDetailRequest.enrollmentNumber.toString(),
        name: "GET SIBLING DETAIL");
    var response = await safeApiCall(apiService.getSiblingDetail(
        getSiblingDetailRequest: getSiblingDetailRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SubjectDetailResponse>> selectOptionalSubject(
      {required List<SubjectSelectionRequest> subjectSelectionRequest,
        required String enquiryID}) async {
    var response = await safeApiCall(apiService.selectOptionalSubject(
        subjectSelectionRequest: subjectSelectionRequest,
        enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> addVASOption(
      {required String enquiryID,
        required VasOptionRequest vasOptionRequest}) async {
    var response = await safeApiCall(apiService.addVASOption(
        enquiryID: enquiryID, vasOptionRequest: vasOptionRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody}) async {
    final response = await safeApiCall(
      apiService.requestGatePass(CreateQrcodeRequestEntity(
          email: requestBody.email,
          mobile: requestBody.mobile,
          name: requestBody.name,
          profileImage: requestBody.profileImage)),
    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, TokenIntrospectionResponse>> getTokenResponse(
      {required String token,
        required String clientId,
        required String clientSecret}) async {
    final response = await safeApiCall(
        apiService.introspectToken(token, clientId, clientSecret));

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, SubjectListResponse>> getSubjectList(
      {required SubjectListingRequest subjectListingRequest}) async {
    var response = await safeApiCall(apiService.getSubjectList(
        subjectListingRequest: subjectListingRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, PsaEnrollmentDetailResponseModel>>
  getPsaEnrollmentDetail({required VasDetailRequest vasDetailRequest}) async {
    var response = await safeApiCall(apiService.getPsaEnrollmentDetail(
        psaEnrollmentDetailRequest: vasDetailRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CafeteriaEnrollmentResponseModel>>
  getCafeteriaEnrollmentDetail(
      {required VasDetailRequest vasDetailRequest}) async {
    var response = await safeApiCall(apiService.getCafeteriaEnrollmentDetail(
        cafeteriaEnrollmentDetail: vasDetailRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SummerCampEnrollmentResponseModel>>
  getSummerCampEnrollmentDetail(
      {required VasDetailRequest vasDetailRequest}) async {
    var response = await safeApiCall(apiService.getSummerCampEnrollmentDetail(
        summerCampEnrollmentDetail: vasDetailRequest, token: mdmToken));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, KidsClubEnrollmentResponseModel>>
  getKidsClubEnrollmentDetail(
      {required VasDetailRequest vasDetailRequest}) async {
    var response = await safeApiCall(apiService.getKidsClubEnrollmentDetail(
        kidsClubEnrollmentDetail: vasDetailRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, TransportEnrollmentResponseModel>>
  getTransportEnrollmentDetail(
      {required VasDetailRequest vasDetailRequest}) async {
    var response = await safeApiCall(apiService.getTransportEnrollmentDetail(
        transportEnrollmentDetail: vasDetailRequest, token: mdmToken));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> calculateFees(
      {required VasEnrollmentFeeCalculationRequest
      feeCalculationRequest}) async {
    var response = await safeApiCall(
        apiService.calculateFee(feeCalculationRequest: feeCalculationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> addVasDeatil(
      {required String enquiryID,
        required String type,
        required VasEnrollmentRequest vasEnrollmentRequest}) async {
    var response = await safeApiCall(apiService.addVASDetail(
        vasEnrollmentRequest: vasEnrollmentRequest,
        enquiryID: enquiryID,
        type: type));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> removeVasDeatil(
      {required String enquiryID, required String type}) async {
    var response = await safeApiCall(
        apiService.removeVasDetail(enquiryID: enquiryID, type: type));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> makePaymentRequest(
      {required String enquiryID}) async {
    var response =
    await safeApiCall(apiService.makePaymentRequest(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, FetchStopResponseModel>> fetchStops(
      {required FetchStopRequest fetchStopRequest}) async {
    var response = await safeApiCall(
        apiService.fetchStops(fetchStopRequest: fetchStopRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
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
  getTransactionTypeFeesCollected({required List<int> students,
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
                customerEmail: paymentOrderModel.orders?.additionalInfo
                    ?.customerEmail,
                customerName: paymentOrderModel.orders?.additionalInfo
                    ?.customerName,
              ),
              bankWalletMerchantId: paymentOrderModel.orders
                  ?.bankWalletMerchantId,
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
                      amount: paymentOrderModel.orders?.studentFees?[index]
                          .amount,
                      feeId: paymentOrderModel.orders?.studentFees?[index]
                          .feeId,
                      id: paymentOrderModel.orders?.studentFees?[index].id,
                      couponId: paymentOrderModel.orders?.studentFees?[index]
                          .couponId,
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
                  browserLanguage: paymentOrderModel.orders?.device
                      ?.browserLanguage,
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
  Future<Either<NetworkError, DisciplinaryListModel>> getDisciplinaryList(
      {required int studentId, int? academicYearID, DateTime? time}) async {
    var response = await safeApiCall(
        disciplinaryRetorfitService.getDisciplinaryList(DisciplinaryListRequest(
          studentId: studentId,
        )));
    return response.fold(
          (l) {
        return Left(l);
      },
          (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, AcknowlegementResponseModel>> acknowledge(
      {required AcknowlegementRequestModel acknowledgementRequestModel}) async {
    var response = await safeApiCall(
        disciplinaryRetorfitService.postAcknowledge(AcknowlegementRequestEntity(
            studentWarningId: acknowledgementRequestModel.studentWarningId,
            userId: acknowledgementRequestModel.userId,
            acknowledgementRole:
            acknowledgementRequestModel.acknowledgementRole,
            acknowledgementDate:
            acknowledgementRequestModel.acknowledgementDate)));
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
  Future<Either<NetworkError, CoReasonsListResponseModel>>
  getCoReasons() async {
    var response =
    await safeApiCall(disciplinaryRetorfitService.getCoReasonsList());
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

  @override
  Future<Either<NetworkError, AttendanceCountResponseModel>> getAttendanceCount(
      {required AttendanceCountRequestModel attendanceRequestModel}) async {
    var response = await safeApiCall(attendanceRetorfitService
        .getattendanceCount(AttendanceCountRequestEntity(
        studentId: attendanceRequestModel.studentId,
        attendanceDate: attendanceRequestModel.attendanceDate,
        academicYearId: attendanceRequestModel.academicYearId,
        pageSize: attendanceRequestModel.pageSize,
        page: attendanceRequestModel.page)));
    return response.fold(
          (l) {
        return Left(l);
      },
          (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, AttendanceDetailsResponseModel>>
  getAttendancedetail({required AttendanceDetailsRequestModel
  attendanceRequestModel}) async {
    //  var response = await safeApiCall(attendanceRetorfitService.getattendanceCount(AttendanceCountRequestEntity(studentId: attendanceRequestModel.studentId, attendanceDate: attendanceRequestModel.attendanceDate, academicYearId:attendanceRequestModel. academicYearId, pageSize: attendanceRequestModel.pageSize, page: attendanceRequestModel.page)));

    var response = await safeApiCall(attendanceRetorfitService
        .getattendanceDetail(AttendanceDetailsRequestEntity(
        studentId: attendanceRequestModel.studentId,
        attendanceStartDate: attendanceRequestModel.attendanceEndDate,
        attendanceEndDate: attendanceRequestModel.attendanceStartDate)));
    return response.fold(
          (l) {
        return Left(l);
      },
          (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, StudentDetailsResponseModel>> getStudentDetail(
      {required int id}) async {
    var response = await safeApiCall(
        adminRetorfitService.getStudentDetails(studentId: id));
    return response.fold(
          (l) {
        return Left(l);
      },
          (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, UserRolePermissionResponse>>
  getUserRolePermissions({
    required UserRolePermissionRequest request,
  }) async {
    var response = await safeApiCall(
      apiService.getUserRolePermissions(
        mdmToken,
        UserRolePermissionRequestEntity(
            email: request.email, service: request.service),
      ),
    );

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, MoveToNextStageEnquiryResponse>>
  moveToNextStageEnquiry(
      {required String enquiryId, String? enquiryStage}) async {
    var response = await safeApiCall(apiService.moveToNextStageEnquiry(
      enquiryId,
      MoveToNextStageEnquiryRequestEntity(
          currentStage: enquiryStage ?? "Enquiry"),
    ));

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, UploadFileResponseModel>> uploadProfileImage(
      {required UploadVisitorProfileUsecaseParams params}) async {
    var response = await safeApiCall(
        apiService.uploadProfileImage(platform: platform, params.file));

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, CreateGatepassResponseModel>>
  createVisitorGatePass({required CreateGatePassModel request}) async {
    var response = await safeApiCall(
      apiService.createVisitorGatePass(
        platform: platform,
        CreateGatePassRequestEntity(
            name: request.name,
            companyName: request.companyName,
            comingFrom: request.comingFrom,
            email: request.email,
            guestCount: request.guestCount,
            mobile: request.mobile,
            otherPointOfContact: request.otherPointOfContact,
            pointOfContact: request.pointOfContact,
            profileImage: request.profileImage,
            purposeOfVisitId: request.purposeOfVisitId,
            visitorTypeId: request.visitorTypeId,
            vehicleNumber: request.vehicleNumber,
            issuedDate: request.issuedDate,
            issuedTime: request.issuedTime,
            studentName: request.studentName,
            studentId: request.studentId,
            schoolId: request.schoolId,
            otherReason: request.otherReason),
      ),
    );

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, MdmCoReasonResponseModel>>
  getPurposeOfVisitList() async {
    var response = await safeApiCall(
        apiService.getPurposeOfVisitList(19, "name", mdmToken));

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, VisitorDetailsResponseModel>> getVisitorDetails(
      {required params}) async {
    Either<NetworkError, HttpResponse<VisitorDetailsResponseEntity>>? response;
    if (params.gatePassId != null) {
      response = await safeApiCall(
          apiService.getGatepassDetailsById(params.gatePassId!, 'app'));
    } else {
      response = await safeApiCall(apiService.getVisitorDetails(
        "${params.mobile}",
        params.studentId == null ? null : "${params.studentId}",
        platform: platform,
      ));
    }

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BrandResponse>> getBrandList() async {
    final response = await safeApiCall(apiService.getBrandList(mdmToken));

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionVasDetailsResponse>>
  getAdmissionVasDetails({required String enquiryId}) async {
    final response =
    await safeApiCall(apiService.fetchadmissionVasDetails(enquiryId));

    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BusStopResponseModel>> getBusStopsList(
      {required String routeId,
        required int dayId,
        required String app}) async {
    final response = await safeApiCall(
      transportService.getBusStopsList(
          routeId: routeId, dayId: dayId, app: app),
    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, TripResponse>> getMyDutyList({required int page,
    required int dayId,
    required int studentId,
    required String app}) async {
    final response = await safeApiCall(
        transportService.getMyDutyList(page, 10, dayId, 10, app));

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, GetStudentProfileResponse>> getStudentProfile(
      {required GetStudentProfileUsecaseParams params}) async {
    final response = await safeApiCall(
      transportService.getStudentProfile(
        params.studentId,
        platform: platform,
      ),
    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, GetStudentAttendance>> getStudentAttendance(
      {required GetStudentAttendanceUsecaseParams params}) async {
    final response = await safeApiCall(
      transportService.getStudentAttendance(
        studentId: params.studentId,
        platform: platform,
      ),
    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, StaffListResponseModel>> getStaffList(
      {required GetStaffListUseCaseParams params}) async {
    final response = await safeApiCall(transportService.getStaffList(
        schoolId: params.schoolId, platform: params.platform));

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));
  }

  @override
  Future<Either<NetworkError, FetchStopLogsModel>> fetchStopLogs(
      {required int routeId, required String platform}) async {
    final response = await safeApiCall(
      transportService.fetchStopLogs(
        routeId: routeId,
        platform: platform,
      ),
    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform()));


  }

  @override
  Future<Either<NetworkError, CreateIntimationResponseModel>> createIntimation({required CreateIntimationRequestModel requestModel}) async{
    final response = await safeApiCall(

    attendanceRetorfitService.createIntimation(CreateIntimationRequestEntity(globalStudentId: requestModel.globalStudentId,globalUserId: requestModel.globalStudentId,fromDate: requestModel.fromDate,fileAttachment: requestModel.fileAttachment,status: requestModel.status,initimationType: requestModel.initimationType,note: requestModel.note,approvedById:requestModel.approvedById ,approvalFlag: requestModel.approvalFlag,))

    );

    return response.fold(
            (error) => Left(error), (data) => Right(data.data.transform(),),);


  }

  @override
  Future<Either<NetworkError, UploadIntimationFileResponseModel>> uploadIntimationFile({ int? documentID, required File file}) async {
    final response = await safeApiCall(

attendanceRetorfitService.uploadIntimation(documentID: documentID, file: file)
    );

    return response.fold(
          (error) => Left(error), (data) => Right(data.data.transform(),),);

  }

 

}
