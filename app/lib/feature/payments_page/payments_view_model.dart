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

  final BehaviorSubject<bool> selectedChequeType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  TextEditingController payemntType = TextEditingController();
  TextEditingController inFavour = TextEditingController();
  TextEditingController amount = TextEditingController();

  final List<String> chequeTypes = [
    'Current Dated Cheque',
    'Post Dated Cheque',
    'Demand Draft'
  ];

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

  final BehaviorSubject<Resource<GetStorePaymentModel>> _getStorePaymentModel =
      BehaviorSubject<Resource<GetStorePaymentModel>>();

  Stream<Resource<GetStorePaymentModel>> get getStorePaymentModel =>
      _getStorePaymentModel.stream;

  void storeFeepayment() {
    exceptionHandlerBinder.handle(block: () {
      GetStorePaymentUsecaseParams params = GetStorePaymentUsecaseParams(
          storePaymentModelRequest: StorePaymentModelRequest(
              isManualEntry: 1,
              manualReceiptImage: "null",
              manualReceiptNo: 'RCP0001',
              paymentMode: 8,
              paymentAmount: 25450,
              chequeInFavour: 63,
              lobId: 52,
              paymentDetails: [
            PaymentDetailModelRequest(
              paymentModeId: 9,
              amount: 25450,
              chequeNo: '5015',
              chequeDate: "2024-05-01",
              bankName: 'ICICI',
              issuerName: 'Vipul',
              issuerIfsc: 'ICICI0001',
              chequeImage: 'null',
              tokenNo: 'TKN102924070600002',
            )
          ],
              feeIds: [
            FeeIdModelRequest(collected: 25450, feeOrder: 3, studentFeeId: 5),
          ]));
      RequestManager<GetStorePaymentModel>(
        params,
        createCall: () => _getStorePaymentUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getStorePaymentModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  @override
  void dispose() {
    // TODO: implement dispose
    paymentModes = [];
    selectedFees = [];
    super.dispose();
  }
}
