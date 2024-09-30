import 'dart:async';

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class WebviewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetPaymentStatusUsecase _getPaymentStatusUsecase;
  WebviewModel(this.exceptionHandlerBinder, this._getPaymentStatusUsecase);

  late String webViewUrl;
  late Timer timer;
  int timerSeconds = 10;

  // Calling students list

  final BehaviorSubject<Resource<GetPaymentStatusModel>>
      _getPaymentStatusModel = BehaviorSubject();

  Stream<Resource<GetPaymentStatusModel>> get getPaymentStatusModel =>
      _getPaymentStatusModel.stream;

  Future<void> getPaymentStatus(String orderId) async {
    await exceptionHandlerBinder.handle(block: () {
      GetPaymentStatusUsecaseParams params =
          GetPaymentStatusUsecaseParams(orderId: orderId);
      RequestManager<GetPaymentStatusModel>(
        params,
        createCall: () => _getPaymentStatusUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getPaymentStatusModel.add(result);
        timerSeconds = 5;
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
