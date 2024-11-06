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
  final GetCouponsUsecase _getCouponsUsecase;
  PaymentsPageModel(this.exceptionHandlerBinder, this._getValidatePayNowUseCase,
      this._getPaymentOrderUsecase, this._getCouponsUsecase);

  final BehaviorSubject<String> selectedPaymentType =
      BehaviorSubject<String>.seeded('');

  int selectedPaymentMode = 0;
  int serviceProviderId = 0;
  List<GetPendingFeesPaymentModeModel> paymentModes = [];

  BehaviorSubject<List<GetPendingFeesFeeModel>> selectedFees =
      BehaviorSubject<List<GetPendingFeesFeeModel>>.seeded([]);

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  final BehaviorSubject<bool> displayCustomCoupon =
      BehaviorSubject<bool>.seeded(false);

  ValueNotifier<String> finalAmount = ValueNotifier<String>('');

  TextEditingController couponController = TextEditingController();

  TextEditingController payemntType = TextEditingController();
  TextEditingController inFavour = TextEditingController();
  TextEditingController amount = TextEditingController();
  int chequeInFavourId = 0;
  String customerIfscCode = '';
  String customerName = '';

  late int phoneNo;

  final BehaviorSubject<bool> showMore = BehaviorSubject<bool>.seeded(false);

  int? couponShowMore;

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
    List studentFeeids = [];
    for (var i = 0; i < selectedFees.value.length; i++) {
      studentFeeids.add(selectedFees.value[i].id ?? 0);
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
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

// calling coupons list api

  final BehaviorSubject<Resource<FetchCouponsListModel>>
      _fetchCouponsListModel =
      BehaviorSubject<Resource<FetchCouponsListModel>>();

  Stream<Resource<FetchCouponsListModel>> get fetchCouponsListModel =>
      _fetchCouponsListModel.stream;

  void getCouponsList(
      {required String feeCategoryIds,
      required String feeSubCategoryIds,
      required String feeTypeIds,
      required String studentId}) {
    exceptionHandlerBinder.handle(block: () {
      GetCouponsUsecaseParams params = GetCouponsUsecaseParams(
          feeCategoryIds: feeCategoryIds,
          feeSubCategoryIds: feeSubCategoryIds,
          feeTypeIds: feeTypeIds,
          studentId: studentId);
      RequestManager<FetchCouponsListModel>(
        params,
        createCall: () => _getCouponsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _fetchCouponsListModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  //end
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
                  lobId: selectedFees.value[0].lobSegmentId,
                  transactionTypeId: 1,
                  serviceProviderId: serviceProviderId,
                  bankWalletMerchantId: 2,
                  paymentModeId: paymentModeId,
                  studentFees: List.generate(
                    selectedFees.value.length,
                    (index) => StudentFee(
                      feeId: selectedFees.value[index].feeId,
                      id: selectedFees.value[index].id,
                      amount: selectedFees.value[index].isDiscountApplied
                          ? selectedFees.value[index].discountedAmount
                          : selectedFees.value[index].pending,
                      amountBeforeDiscount:
                          selectedFees.value[index].isDiscountApplied
                              ? int.parse(selectedFees.value[index].pending
                                      ?.split('.')[0] ??
                                  '0')
                              : null,
                      couponId: selectedFees.value[index].isDiscountApplied
                          ? selectedFees.value[index].couponId ?? ''
                          : null,
                    ),
                  ),
                  additionalInfo: AdditionalInfo(
                      customerEmail: '',
                      customerName: '',
                      customerContact: phoneNo.toString()),
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

  void calculateDiscountPerLineItem(FetchCouponsDataModel fetchCouponsDataModel,
      List<GetPendingFeesFeeModel> getPendingFeesFeeModel, int index) {
    if (fetchCouponsDataModel.couponType == "Variable Concession") {
      if (fetchCouponsDataModel.concessionPercentage != null &&
          fetchCouponsDataModel.concessionMaxAmount != null) {
        int amountAfterDiscount =
            ((double.parse(getPendingFeesFeeModel[index].pending ?? '') *
                        (fetchCouponsDataModel.concessionPercentage ?? 0)) /
                    100)
                .toInt();
        if (amountAfterDiscount <=
            (fetchCouponsDataModel.concessionMaxAmount ?? 0)) {
          getPendingFeesFeeModel[index].isDiscountApplied = true;
          getPendingFeesFeeModel[index].discountedAmount =
              (double.parse(getPendingFeesFeeModel[index].pending ?? '') -
                      double.parse(amountAfterDiscount.toString()))
                  .toString();
          getPendingFeesFeeModel[index].couponId = fetchCouponsDataModel.id;
          getPendingFeesFeeModel[index].differenceAmount =
              amountAfterDiscount.toString();
        } else {
          getPendingFeesFeeModel[index].isDiscountApplied = true;
          getPendingFeesFeeModel[index].discountedAmount =
              (double.parse(getPendingFeesFeeModel[index].pending ?? '') -
                      double.parse(
                          fetchCouponsDataModel.concessionMaxAmount.toString()))
                  .toString();
          getPendingFeesFeeModel[index].couponId = fetchCouponsDataModel.id;
          getPendingFeesFeeModel[index].differenceAmount =
              fetchCouponsDataModel.concessionMaxAmount.toString();
        }
      }
    } else {
      if (double.parse(getPendingFeesFeeModel[index].pending ?? '') <=
          double.parse(
              fetchCouponsDataModel.concessionFixedAmount.toString())) {
        getPendingFeesFeeModel[index].isDiscountApplied = true;
        getPendingFeesFeeModel[index].discountedAmount =
            (double.parse(getPendingFeesFeeModel[index].pending ?? '') -
                    double.parse(
                        fetchCouponsDataModel.concessionFixedAmount.toString()))
                .toString();
        getPendingFeesFeeModel[index].couponId = fetchCouponsDataModel.id;
        getPendingFeesFeeModel[index].differenceAmount =
            fetchCouponsDataModel.concessionFixedAmount.toString();
      } else {
        getPendingFeesFeeModel[index].isDiscountApplied = true;
        getPendingFeesFeeModel[index].discountedAmount =
            (double.parse(getPendingFeesFeeModel[index].pending ?? '') -
                    double.parse(getPendingFeesFeeModel[index].pending ?? ''))
                .toString();
        getPendingFeesFeeModel[index].couponId = fetchCouponsDataModel.id;
        getPendingFeesFeeModel[index].differenceAmount =
            getPendingFeesFeeModel[index].pending;
      }
    }
    int newTotalAmount = 0;
    for (var model in getPendingFeesFeeModel) {
      if (model.isDiscountApplied) {
        newTotalAmount += int.parse(model.discountedAmount!.split('.')[0]);
      } else {
        newTotalAmount += int.parse(model.pending!.split('.')[0]);
      }
    }
    amount.text = newTotalAmount.toString();
    finalAmount.value = newTotalAmount.toString();
    selectedFees.add(getPendingFeesFeeModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    paymentModes = [];
    selectedFees.close();
    super.dispose();
  }
}
