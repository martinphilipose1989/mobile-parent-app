// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentsPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetValidatePayNowUseCase _getValidatePayNowUseCase;
  final GetStorePaymentUsecase _getStorePaymentUsecase;
  PaymentsPageModel(
    this.exceptionHandlerBinder,
    this._getValidatePayNowUseCase,
    this._getStorePaymentUsecase,
  );

  final BehaviorSubject<String> selectedPaymentType =
      BehaviorSubject<String>.seeded('');

  int selectedPaymentMode = 0;

  List<GetPendingFeesPaymentModeModel> paymentModes = [];

  List<GetPendingFeesFeeModel> selectedFees = [];

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  TextEditingController payemntType = TextEditingController();
  TextEditingController inFavour = TextEditingController();
  TextEditingController amount = TextEditingController();

  final List<String> feesType = [
    'Registration Fees',
    'Admission Fees',
    'Consolidated Fees',
    'Transport Fees'
  ];

  // calling validate on pay api

  final BehaviorSubject<Resource<GetValidateOnPayModel>>
      _getValidateOnPayModel =
      BehaviorSubject<Resource<GetValidateOnPayModel>>();

  Stream<Resource<GetValidateOnPayModel>> get getValidateOnPayModel =>
      _getValidateOnPayModel.stream;

  void getValidateOnPay(int paymentMode) {
    List<int> studentFeeids = [];
    for (var i = 0; i < selectedFees.length; i++) {
      studentFeeids.add(selectedFees[i].id ?? 0);
    }
    exceptionHandlerBinder.handle(block: () {
      GetValidatePayNowUseCaseParams params = GetValidatePayNowUseCaseParams(
          paymentMode: paymentMode, studentFeeIds: studentFeeids);
      RequestManager<GetValidateOnPayModel>(
        params,
        createCall: () => _getValidatePayNowUseCase.execute(params: params),
      ).asFlow().listen((result) {
        _getValidateOnPayModel.add(result);
        inFavour.text =
            result.data?.data?.chequeInFavourDetails?.chequeInFavour ?? '';
        payemntType.text = selectedPaymentType.value;
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    paymentModes = [];
    selectedFees = [];
    super.dispose();
  }
}
