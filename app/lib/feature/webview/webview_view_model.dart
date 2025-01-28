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
      required this.flutterToastErrorPresenter,
      required this.moveToNextStageUsecase});

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

  //**************** MOVE TO NEXT STAGE  ****************//
  final MoveToNextStageUsecase moveToNextStageUsecase;

  final BehaviorSubject<Resource<MoveToNextStageEnquiryResponse>>
      moveStageSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<MoveToNextStageEnquiryResponse>> get moveStageStream =>
      moveStageSubject.stream;
  void moveToNextStage(
      {String from = "payment",
      required String currentStage,
      required String enquiryId}) {
    moveStageSubject.add(Resource.loading());
    MoveToNextStageUsecaseParams params = MoveToNextStageUsecaseParams(
      enquiryId: "${enquiryDetailArgs?.enquiryId}",
      currentStage: currentStage,
    );
    exceptionHandlerBinder.handle(block: () {
      RequestManager(
        params,
        createCall: () => moveToNextStageUsecase.execute(params: params),
      ).asFlow().listen((data) {
        if (data.status == Status.error) {
          // exceptionHandlerBinder.showError(data.dealSafeAppError!);
          moveStageSubject.add(Resource.error(error: data.dealSafeAppError));
        }
        if (data.status == Status.success) {
          moveStageSubject.add(Resource.success(data: data.data));
        }
      });
    }).execute();
  }

  @override
  dispose() {
    _getPaymentStatusModel.close();
    moveStageSubject.close();
    timer.cancel();
    super.dispose();
  }
}
