// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/model/resource.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  final GetAcademicYearUsecase _getAcademicYearUsecase;
  final GetTransactionTypeFeesCollectedUsecase
      _getTransactionTypeFeesCollectedUsecase;
  final GetPendingFeesUsecase _getPendingFeesUsecase;

  PaymentHistoryModel(
    this.exceptionHandlerBinder,
    this._getAcademicYearUsecase,
    this._getTransactionTypeFeesCollectedUsecase,
    this._getPendingFeesUsecase,
  );

  final List paymentHistoryTypes = [
    {'name': 'Transaction Type', 'isSelected': false},
    {'name': 'Fees Type', 'isSelected': false},
    {'name': 'Student Ledger', 'isSelected': false},
  ];

  final BehaviorSubject<int> switchTabsPaymentHistory =
      BehaviorSubject<int>.seeded(0);

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent;
  List<int> studentIDs = [];

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
        createCall: () => _getAcademicYearUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.data?.data != null) {
          academicYearIds.add(result.data?.data![0].id ?? 0);
          getFeesCollected();
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
            _getTransactionTypeFeesCollectedUsecase.execute(params: params),
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
        createCall: () => _getPendingFeesUsecase.execute(params: params),
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
        createCall: () => _getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getFeesTypeModel.add(result);
        groupByFeeType(result.data?.data?.fees ?? []);
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

    for (var item in fees) {
      String feeType = item.feeType ?? "";
      if (groupedByFeeType.containsKey(feeType)) {
        groupedByFeeType[feeType]!.add(item);
      } else {
        groupedByFeeType[feeType] = [item];
      }
    }

    // Convert the grouped map to a list of Model objects
    _groupedModels = groupedByFeeType.entries
        .map((entry) => GroupByFeeTypeModel(
            feeType: entry.key,
            fees: entry.value,
            totalAmount: calculateTotalAmount(entry.value)))
        .toList();
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
}
