// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryStudentLedgerModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetPendingFeesUsecase _getPendingFeesUsecase;

  PaymentHistoryStudentLedgerModel(
      this.exceptionHandlerBinder, this._getPendingFeesUsecase);

  Future<void> getStudentLedger() async {
    await exceptionHandlerBinder.handle(block: () {
      GetPendingFeesUsecaseParams params = GetPendingFeesUsecaseParams(
          academicYear: [], applicableTo: 2, students: [2], type: 'ledger_all');
      RequestManager<GetPendingFeesModel>(
        params,
        createCall: () => _getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {}).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
