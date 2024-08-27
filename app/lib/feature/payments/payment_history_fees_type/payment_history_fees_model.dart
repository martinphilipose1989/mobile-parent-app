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
class PaymentHistoryFeesModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetPendingFeesUsecase _getPendingFeesUsecase;

  PaymentHistoryFeesModel(
      this.exceptionHandlerBinder, this._getPendingFeesUsecase);

  final BehaviorSubject<Resource<GetPendingFeesModel>> _getPendingFeesModel =
      BehaviorSubject();

  Stream<Resource<GetPendingFeesModel>> get getPendingFeesModel =>
      _getPendingFeesModel.stream;

  Future<void> getFeesType() async {
    await exceptionHandlerBinder.handle(block: () {
      GetPendingFeesUsecaseParams params = GetPendingFeesUsecaseParams(
          academicYear: [25],
          applicableTo: 2,
          students: [2],
          type: 'collected');
      RequestManager<GetPendingFeesModel>(
        params,
        createCall: () => _getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getPendingFeesModel.add(result);
        groupByFeeType(result.data!.data!.fees ?? []);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
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
    for (var fee in fees) {
      totalAmount += int.tryParse(fee.amount?.split('.')[0] ?? '') ?? 0;
    }
    return CurrencyFormatter.formatToRupee(totalAmount.toString());
  }
}
