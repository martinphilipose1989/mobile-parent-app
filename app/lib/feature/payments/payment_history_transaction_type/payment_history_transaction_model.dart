// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryTransactionModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetTransactionTypeUsecase _getTransactionTypeUsecase;

  PaymentHistoryTransactionModel(
    this.exceptionHandlerBinder,
    this._getTransactionTypeUsecase,
  );

  late PaymentHistoryModel paymentHistoryModel;

  List<int> academicYears = [];

  // Calling transaction api

  final PublishSubject<Resource<GetTransactionTypeModel>>
      _getTransactionTypeModel = PublishSubject();

  Stream<Resource<GetTransactionTypeModel>> get getTransactionTypeModel =>
      _getTransactionTypeModel.stream;

  Future<void> getTransactionTypes(int transactionId,
      Function(List<GetTransactionTypeDatumModel> data) onCallBack) async {
    await exceptionHandlerBinder.handle(block: () {
      GetTransactionTypeUsecaseParams params =
          GetTransactionTypeUsecaseParams(id: transactionId);
      RequestManager<GetTransactionTypeModel>(
        params,
        createCall: () => _getTransactionTypeUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.data?.data?.isNotEmpty ?? false) {
          onCallBack.call(result.data?.data ?? []);
        }
        _getTransactionTypeModel.add(result);
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end
}
