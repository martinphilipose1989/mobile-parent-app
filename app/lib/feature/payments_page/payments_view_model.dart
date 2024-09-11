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
  final GetPaymentOrderUsecase _getPaymentOrderUsecase;
  PaymentsPageModel(
    this.exceptionHandlerBinder,
    this._getValidatePayNowUseCase,
    this._getPaymentOrderUsecase,
  );

  final BehaviorSubject<String> selectedPaymentType =
      BehaviorSubject<String>.seeded('');

  int selectedPaymentMode = 0;
  int serviceProviderId = 0;
  List<GetPendingFeesPaymentModeModel> paymentModes = [];

  List<GetPendingFeesFeeModel> selectedFees = [];

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  TextEditingController payemntType = TextEditingController();
  TextEditingController inFavour = TextEditingController();
  TextEditingController amount = TextEditingController();
  int chequeInFavourId = 0;
  String customerIfscCode = '';
  String customerName = '';

  late int phoneNo;

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
        if (result.status == Status.error) {}
        chequeInFavourId =
            result.data?.data?.chequeInFavourDetails?.chequeInFavourId ?? 0;
        inFavour.text =
            result.data?.data?.chequeInFavourDetails?.chequeInFavour ?? '';
        payemntType.text = selectedPaymentType.value;
        customerIfscCode =
            result.data?.data?.lastTransactionDetailModel?.customerBankIfsc ??
                "";
        customerName =
            result.data?.data?.lastTransactionDetailModel?.customerBankName ??
                "";
      }).onError((error) {
        print(error);
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  void setProviderIdAndServiceProvider(String text) {
    for (var paymentMode in paymentModes) {
      if (paymentMode.serviceProvider == text) {
        selectedPaymentMode = paymentMode.paymentModeId ?? 0;
        serviceProviderId = paymentMode.serviceproviderId ?? 0;
      }
    }
  }

  final BehaviorSubject<Resource<GetPaymentOrderResponseModel>>
      _getPaymentOrderResponseModel =
      BehaviorSubject<Resource<GetPaymentOrderResponseModel>>();

  Stream<Resource<GetPaymentOrderResponseModel>>
      get getPaymentOrderResponseModel => _getPaymentOrderResponseModel.stream;

  void getPaymentOrder(int paymentModeId, int serviceProviderId) {
    exceptionHandlerBinder.handle(block: () {
      GetPaymentOrderUsecaseParams params = GetPaymentOrderUsecaseParams(
          paymentOrderModel: PaymentOrderModel(
              orders: Orders(
                  amount: int.parse(amount.text),
                  currency: "INR",
                  paymentGateway: "razorpay",
                  receipt: "RCPT#123",
                  lobId: selectedFees[0].lobSegmentId,
                  transactionTypeId: 1,
                  serviceProviderId: serviceProviderId,
                  bankWalletMerchantId: 2,
                  paymentModeId: paymentModeId,
                  studentFees: List.generate(
                    selectedFees.length,
                    (index) => StudentFee(
                        feeId: selectedFees[index].feeId,
                        id: selectedFees[index].id,
                        amount: selectedFees[index].amount),
                  ),
                  additionalInfo: AdditionalInfo(
                      customerEmail: '',
                      customerName: '',
                      customerContact: '6380876483'),
                  device: null)));

      RequestManager<GetPaymentOrderResponseModel>(
        params,
        createCall: () => _getPaymentOrderUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {}
        _getPaymentOrderResponseModel.add(result);
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
