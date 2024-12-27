import 'dart:async';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class WebviewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetPaymentStatusUsecase getPaymentStatusUsecase;
  final CancelPaymentUsecase cancelPaymentUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  WebviewModel(
      {required this.exceptionHandlerBinder,
      required this.getPaymentStatusUsecase,
      required this.cancelPaymentUsecase,
      required this.flutterToastErrorPresenter});

  late String webViewUrl;
  late Timer timer;
  int timerSeconds = 10;

  InAppWebViewController? webViewController;

  EnquiryDetailArgs? enquiryDetailArgs;

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
        createCall: () => getPaymentStatusUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getPaymentStatusModel.add(result);
        timerSeconds = 2;
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> cancelPayment(
      {required String orderId, required String paymentGateway}) async {
    CancelPaymentUsecaseParams params = CancelPaymentUsecaseParams(
        paymentGateway: paymentGateway, orderId: orderId);

    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => cancelPaymentUsecase.execute(params: params),
        onSuccess: (response) {},
        onError: (error) {});
  }
}
