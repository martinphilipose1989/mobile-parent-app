// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class ChequePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetStorePaymentUsecase _getStorePaymentUsecase;
  final GetTokenGeneratorUsecase _getTokenGeneratorUsecase;
  final ChooseFileUseCase _chooseFileUseCase;
  ChequePageModel(this.exceptionHandlerBinder, this._getStorePaymentUsecase,
      this._getTokenGeneratorUsecase, this._chooseFileUseCase);

  final BehaviorSubject<List<bool>> selectedChequeType =
      BehaviorSubject<List<bool>>.seeded([]);

  late PaymentsPageModel paymentsPageModel;

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
  List<TextEditingController> chequeImage = <TextEditingController>[];

  TextEditingController payemntType = TextEditingController();
  TextEditingController inFavour = TextEditingController();
  TextEditingController amount = TextEditingController();
  late int chequeInFavourId;

  late String customerIfscCode;
  late String customerName;

  late List<GetPendingFeesFeeModel> selectedPendingFessList;

  final List<String> chequeTypes = [
    'Current Dated Cheque',
    'Post Dated Cheque',
    'Demand Draft'
  ];

  List<String> feesType = [];
  List<String> tempList = [];

  void _addChequeControllers() {
    tokenNumberControllers.add(TextEditingController());
    chequeNumberControllers.add(TextEditingController());
    chequeDateControllers.add(TextEditingController());
    ifscCodeControllers.add(TextEditingController(text: customerIfscCode));
    issueNameControllers.add(TextEditingController(text: customerName));
    amountControllers.add(TextEditingController());
    chequeTypeControllers.add(TextEditingController());
    feeTypeControllers.add(TextEditingController());
    chequeImage.add(TextEditingController());
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

  int getValueForMode(String mode) {
    switch (mode) {
      case 'Current Dated Cheque':
        return 8;
      case 'Post Dated Cheque':
        return 10;
      case 'Demand Draft':
        return 9;
      default:
        throw ArgumentError('Invalid mode: $mode');
    }
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
      chequeImage.removeAt(index);
    }
  }

  final BehaviorSubject<Resource<UploadFile>> _pickFrontFileResponse =
      BehaviorSubject<Resource<UploadFile>>();

  Stream<Resource<UploadFile>> get pickFrontFileResponse =>
      _pickFrontFileResponse.stream;

  void pickImage(UpoladFileTypeEnum fileTypeEnum, int index) {
    exceptionHandlerBinder.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
              createCall: () => _chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          _pickFrontFileResponse.add(result);
          chequeImage[index].text = result.data?.filePath ?? "";
        }
      }).onError((error) {});
    }).execute();
  }

  String formatDateToYYYYMMDD(String date) {
    // Assuming the input date is in 'dd/MM/yyyy' format
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);

    // Format the parsed date to 'YYYY-mm-dd'
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return formattedDate;
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
        chequeDate: formatDateToYYYYMMDD(chequeDateControllers[i].text),
        issuerName: issueNameControllers[i].text,
        issuerIfsc: ifscCodeControllers[i].text,
        chequeImage: chequeImage[i].text,
        tokenNo: tokenNumberControllers[i].text,
      ));
    }
    exceptionHandlerBinder.handle(block: () {
      GetStorePaymentUsecaseParams params = GetStorePaymentUsecaseParams(
          storePaymentModelRequest: StorePaymentModelRequest(
              paymentMode: 8,
              forMobile: true,
              paymentAmount: int.parse(amount.text),
              chequeInFavour: chequeInFavourId,
              lobId: 52,
              paymentDetails: paymentDetails,
              feeIds: List.generate(
                selectedPendingFessList.length,
                (index) => FeeIdModelRequest(
                    collected: int.parse(
                        selectedPendingFessList[index].paid!.split('.')[0]),
                    feeOrder: selectedPendingFessList[index].feeOrder ?? 0,
                    studentFeeId: selectedPendingFessList[index].id ?? 0),
              )));
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

  void checkIfAllAmountMatches(
      Function(bool value) onCallBack, ChequePageModel model) {
    for (var i = 0; i < amountControllers.length; i++) {
      int tempAmount = 0;

      tempAmount += int.parse(amountControllers[i].text);

      if (tempAmount != int.parse(amount.text)) {
        onCallBack.call(true);
      } else {
        submitForm(model);
      }
    }
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

  void feeTypeListChanges(
    String selectedValue,
    int index,
  ) {
    feeTypeControllers[index].text = selectedValue;
    if (tempList.contains(selectedValue)) {
      tempList.remove(selectedValue);
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
