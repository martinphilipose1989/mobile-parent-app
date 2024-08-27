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
class ChequePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetStorePaymentUsecase _getStorePaymentUsecase;
  final GetTokenGeneratorUsecase _getTokenGeneratorUsecase;
  ChequePageModel(
    this.exceptionHandlerBinder,
    this._getStorePaymentUsecase,
    this._getTokenGeneratorUsecase,
  );

  final BehaviorSubject<List<bool>> selectedChequeType =
      BehaviorSubject<List<bool>>.seeded([]);

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  List<TextEditingController> tokenNumberControllers =
      <TextEditingController>[];
  List<TextEditingController> chequeNumberControllers =
      <TextEditingController>[];
  List<TextEditingController> chequeDateControllers = <TextEditingController>[];
  List<TextEditingController> ifscCodeControllers = <TextEditingController>[];
  List<TextEditingController> issueNameControllers = <TextEditingController>[];
  List<TextEditingController> amountControllers = <TextEditingController>[];
  List<TextEditingController> chequeTypeControllers = <TextEditingController>[];
  List<TextEditingController> feeTypeControllers = <TextEditingController>[];
  List<TextEditingController> bankNameController = <TextEditingController>[];

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

  void _addChequeControllers() {
    tokenNumberControllers.add(TextEditingController());
    chequeNumberControllers.add(TextEditingController());
    chequeDateControllers.add(TextEditingController());
    ifscCodeControllers.add(TextEditingController());
    issueNameControllers.add(TextEditingController());
    amountControllers.add(TextEditingController());
    chequeTypeControllers.add(TextEditingController());
    feeTypeControllers.add(TextEditingController());
  }

  void addCheque(String selectedValue, int index) {
    if (chequeTypes.contains(selectedValue)) {
      final selectedChequType = List.of(selectedChequeType.value);
      selectedChequType.add(true);
      selectedChequeType.add(selectedChequType);
    }
    _addChequeControllers();
    tokenGenerator(index);
  }

  void removeCheque(int index) {
    if (noOfCheques.value > 1) {
      noOfCheques.add(noOfCheques.value - 1);
      selectedChequeType
          .add(List.of(selectedChequeType.value)..removeAt(index));

      // Remove the corresponding controllers
      tokenNumberControllers.removeAt(index);
      chequeNumberControllers.removeAt(index);
      chequeDateControllers.removeAt(index);
      ifscCodeControllers.removeAt(index);
      issueNameControllers.removeAt(index);
      amountControllers.removeAt(index);
      chequeTypeControllers.removeAt(index);
      feeTypeControllers.removeAt(index);
    }
  }

  final BehaviorSubject<Resource<GetStorePaymentModel>> _getStorePaymentModel =
      BehaviorSubject<Resource<GetStorePaymentModel>>();

  Stream<Resource<GetStorePaymentModel>> get getStorePaymentModel =>
      _getStorePaymentModel.stream;

  void storeFeepayment() {
    List<PaymentDetailModelRequest> paymentDetails = [];
    for (var i = 0; i < noOfCheques.value; i++) {
      paymentDetails.add(PaymentDetailModelRequest(
        paymentModeId: int.parse(chequeTypeControllers[i].text),
        amount: int.parse(amountControllers[i].text),
        chequeNo: chequeNumberControllers[i].text,
        chequeDate: chequeDateControllers[i].text,
        bankName: bankNameController[i].text,
        issuerName: issueNameControllers[i].text,
        issuerIfsc: ifscCodeControllers[i].text,
        chequeImage: 'null',
        tokenNo: tokenNumberControllers[i].text,
      ));
    }
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
              paymentDetails: paymentDetails,
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

  final BehaviorSubject<Resource<GetTokenGeneratorModel>>
      _getTokenGeneratorModel =
      BehaviorSubject<Resource<GetTokenGeneratorModel>>();

  Stream<Resource<GetTokenGeneratorModel>> get getTokenGeneratorModel =>
      _getTokenGeneratorModel.stream;

  void tokenGenerator(int index) {
    exceptionHandlerBinder.handle(block: () {
      GetTokenGeneratorUsecaseParams params =
          GetTokenGeneratorUsecaseParams(segmentLobId: 45);
      RequestManager<GetTokenGeneratorModel>(
        params,
        createCall: () => _getTokenGeneratorUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getTokenGeneratorModel.add(result);
        tokenNumberControllers[index].text = result.data?.data?.number ?? '';
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm(ChequePageModel model) {
    if (model.formKey.currentState!.validate()) {
      storeFeepayment();
    } else {}
  }

  int getChequeId(String chequeType) {
    switch (chequeType) {
      case 'Current Dated Cheque':
        return 8;
      case 'Demand Draft':
        return 9;
      case 'Post Dated Cheque':
        return 10;

      default:
        return 0;
    }
  }

  @override
  void dispose() {
    for (var controller in tokenNumberControllers) {
      controller.dispose();
    }
    for (var controller in chequeNumberControllers) {
      controller.dispose();
    }
    for (var controller in chequeDateControllers) {
      controller.dispose();
    }
    for (var controller in ifscCodeControllers) {
      controller.dispose();
    }
    for (var controller in issueNameControllers) {
      controller.dispose();
    }
    for (var controller in amountControllers) {
      controller.dispose();
    }
    for (var controller in chequeTypeControllers) {
      controller.dispose();
    }
    for (var controller in feeTypeControllers) {
      controller.dispose();
    }
    noOfCheques.close();
    selectedChequeType.close();
    super.dispose();
  }
}
