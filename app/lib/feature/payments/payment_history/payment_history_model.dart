// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'dart:typed_data';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/model/resource.dart';

import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/file_downloader.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';

import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  final GetAcademicYearUsecase getAcademicYearUsecase;
  final GetTransactionTypeFeesCollectedUsecase
      getTransactionTypeFeesCollectedUsecase;
  final GetPendingFeesUsecase getPendingFeesUsecase;
  final DownloadFeeTypeUsecase downloadFeeTypeUsecase;
  final DownloadStudentLedgerUsecase downloadStudentLedgerUsecase;
  final DownloadTransactionHistoryUsecase downloadTransactionHistoryUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  // For Enquiry Only
  PaymentArguments? paymentArguments;
  int? phoneNo;

  PaymentHistoryModel(
      {required this.exceptionHandlerBinder,
      required this.getAcademicYearUsecase,
      required this.getTransactionTypeFeesCollectedUsecase,
      required this.getPendingFeesUsecase,
      required this.downloadFeeTypeUsecase,
      required this.downloadStudentLedgerUsecase,
      required this.downloadTransactionHistoryUsecase,
      required this.flutterToastErrorPresenter});

  final List paymentHistoryTypes = [
    {'name': 'Transaction Type', 'isSelected': false},
    {'name': 'Fees Type', 'isSelected': false},
    {'name': 'Student Ledger', 'isSelected': false},
  ];

  final BehaviorSubject<int> switchTabsPaymentHistory =
      BehaviorSubject<int>.seeded(0);

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent;
  List<dynamic> studentIDs = [];

  // Calling academic year api

  final PublishSubject<Resource<GetAcademicYearModel>> _getAcademicYearModel =
      PublishSubject();

  Stream<Resource<GetAcademicYearModel>> get getAcademicYearModel =>
      _getAcademicYearModel.stream;

  Future<void> getAcademicYear() async {
    await exceptionHandlerBinder.handle(block: () {
      GetAcademicYearUsecaseParams params =
          GetAcademicYearUsecaseParams(students: studentIDs, type: 'collected');
      RequestManager<GetAcademicYearModel>(
        params,
        createCall: () => getAcademicYearUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.data?.data != null) {
          if (result.data?.data?.isNotEmpty ?? false) {
            academicYearIds.add(result.data?.data![0].id ?? 0);
            getFeesCollected();
          }
        }
        _getAcademicYearModel.add(result);
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  Future<void> executeTasksSequentially() async {
    getFeesCollected();
  }

  List<int> academicYearIds = [];
  // filtering fees api as per academic year

  void getSelectedAcademicYear(
      {required List<String> selectedValues,
      required List<YearData> data,
      required Function(List<int> values) onchange}) {
    List<int> tempList = [];
    for (var value in data) {
      for (var selectedValue in selectedValues) {
        if (value.name == selectedValue) {
          tempList.add(value.id!);
        }
      }
    }
    academicYearIds = tempList;
    onchange.call(academicYearIds);
  }

  // end

// calling transaction type api

  final PublishSubject<Resource<GetTransactiontypefeesCollectedModel>>
      _getTransactiontypefeesCollectedModel = PublishSubject();

  Stream<Resource<GetTransactiontypefeesCollectedModel>>
      get getTransactiontypefeesCollectedModel =>
          _getTransactiontypefeesCollectedModel.stream;

  Future<void> getFeesCollected() async {
    await exceptionHandlerBinder.handle(block: () {
      GetTransactionTypeFeesCollectedUsecaseParams params =
          GetTransactionTypeFeesCollectedUsecaseParams(
              students: studentIDs, academicYear: academicYearIds);
      RequestManager<GetTransactiontypefeesCollectedModel>(
        params,
        createCall: () =>
            getTransactionTypeFeesCollectedUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getTransactiontypefeesCollectedModel.add(result);
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // calling student ledger api
  final BehaviorSubject<Resource<GetPendingFeesModel>> _getStudentLedger =
      BehaviorSubject<Resource<GetPendingFeesModel>>();

  Stream<Resource<GetPendingFeesModel>> get getStudentLedgerResponse =>
      _getStudentLedger.stream;

  Future<void> getStudentLedger() async {
    await exceptionHandlerBinder.handle(block: () {
      GetPendingFeesUsecaseParams params = GetPendingFeesUsecaseParams(
          academicYear: academicYearIds,
          applicableTo: 2,
          students: studentIDs,
          type: 'ledger_all');
      RequestManager<GetPendingFeesModel>(
        params,
        createCall: () => getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getStudentLedger.add(result);
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

//end

// callimng fees type api and its implementation
  final BehaviorSubject<Resource<GetPendingFeesModel>> _getFeesTypeModel =
      BehaviorSubject();

  Stream<Resource<GetPendingFeesModel>> get getFeesTypeModel =>
      _getFeesTypeModel.stream;

  Future<void> getFeesType() async {
    await exceptionHandlerBinder.handle(block: () {
      GetPendingFeesUsecaseParams params = GetPendingFeesUsecaseParams(
          academicYear: academicYearIds,
          applicableTo: 2,
          students: studentIDs,
          type: 'collected');
      RequestManager<GetPendingFeesModel>(
        params,
        createCall: () => getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getFeesTypeModel.add(result);
        if (result.status == Status.success) {
          groupByFeeType(result.data?.data?.fees ?? []);
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  List<GroupByFeeTypeModel> _groupedModels = [];

  List<GroupByFeeTypeModel> get groupedModels => _groupedModels;

  void groupByFeeType(List<GetPendingFeesFeeModel> fees) {
    // Grouping logic

    Map<String, List<GetPendingFeesFeeModel>> groupedByFeeType = {};
    Map<String, String> feeIdToFeeTypeMap = {};
    if (fees.isEmpty) {
      return;
    }
    for (var item in fees) {
      // Earlier group by fee Type was done by feeType, now it is done by feeId
      if (item.feeId != null && item.feeType != null) {
        String feeId = item.feeId.toString();
        String feeType = item.feeType.toString();

        // Maintain a mapping of feeId to feeType for display
        feeIdToFeeTypeMap[feeId] = feeType;

        if (groupedByFeeType.containsKey(feeId)) {
          groupedByFeeType[feeId]!.add(item);
        } else {
          groupedByFeeType[feeId] = [item];
        }
      }
      _groupedModels.clear();
      // Convert the grouped map to a list of Model objects
      _groupedModels = groupedByFeeType.entries.map((entry) {
        // Use the feeType from the mapping for display
        String feeDisplayName = feeIdToFeeTypeMap[entry.key] ?? '';
        return GroupByFeeTypeModel(
          feeType: entry.key,
          fees: entry.value,
          feeDisplayName: feeDisplayName,
          totalAmount: calculateTotalAmount(entry.value),
        );
      }).toList();
    }
  }

  String calculateTotalAmount(List<GetPendingFeesFeeModel> fees) {
    int totalAmount = 0;
    if (fees.isEmpty) return CurrencyFormatter.formatToRupee('0');
    for (var fee in fees) {
      totalAmount += int.tryParse(fee.amount?.split('.')[0] ?? '') ?? 0;
    }
    return CurrencyFormatter.formatToRupee(totalAmount.toString());
  }

  // end

  PublishSubject<Resource<Uint8List>> downloadFile = PublishSubject();

  PublishSubject<bool> isFeeTypeFileDownloading = PublishSubject();

  void downloadFeeType({required String urlKey}) {
    isFeeTypeFileDownloading.add(true);
    final params = DownloadFeeTypeUsecaseParams(urlKey: urlKey);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => downloadFeeTypeUsecase.execute(params: params),
        onSuccess: (data) async {
          isFeeTypeFileDownloading.add(false);
          FileDownloader.downloadFile(fileData: data!);
        },
        onError: (error) {
          isFeeTypeFileDownloading.add(false);
        });
  }

  PublishSubject<bool> isStudentLedgerFileDownloading = PublishSubject();

  void downloadStudentLedger(
      {required String fileType,
      required List<int> studentFeesId,
      required bool sendMail,
      required String feesType,
      required List<int> transaction}) {
    isStudentLedgerFileDownloading.add(true);

    final DownloadStudentLedgerUsecaseParams params =
        DownloadStudentLedgerUsecaseParams(
            feesType: feesType,
            fileType: fileType,
            studentFeesId: studentFeesId,
            transaction: transaction,
            sendMail: sendMail);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) =>
            downloadStudentLedgerUsecase.execute(params: params),
        onSuccess: (data) {
          isStudentLedgerFileDownloading.add(false);
          FileDownloader.downloadFile(fileData: data!);
        },
        onError: (error) {
          isStudentLedgerFileDownloading.add(false);
        });
  }

  PublishSubject<bool> isTransactionHistoryFileDownloading = PublishSubject();

  void downloadTransactionHistory(
      {required String fileType, required String id}) {
    isTransactionHistoryFileDownloading.add(true);
    final DownloadTransactionHistoryParams params =
        DownloadTransactionHistoryParams(fileType: fileType, id: id);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) =>
            downloadTransactionHistoryUsecase.execute(params: params),
        onSuccess: (data) {
          isTransactionHistoryFileDownloading.add(false);
          FileDownloader.downloadFile(fileData: data!);
        },
        onError: (error) {
          isTransactionHistoryFileDownloading.add(false);
        });
  }

  String? extractFileExtension(String url) {
    final RegExp regExp = RegExp(r'\.([a-zA-Z0-9]+)(?:\?|$)');
    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount > 0) {
      return match.group(1);
    }
    return null;
  }

  void updateStudentDetailsForEnquiry(PaymentArguments paymentArguments) {
    List<GetGuardianStudentDetailsStudentModel> tempList = [];
    tempList.add(GetGuardianStudentDetailsStudentModel(
        id: paymentArguments.enquiryId,
        studentDisplayName:
            "${paymentArguments.studentName} ${paymentArguments.enquiryNo}"));

    //
    //

    // _getGuardianStudentDetailsModel.add(Resource.success(data: tempList));
    selectedStudent = tempList;
    if (paymentArguments.enquiryId != null) {
      studentIDs.add(paymentArguments.enquiryId);
    }

    getAcademicYear();
  }
}
