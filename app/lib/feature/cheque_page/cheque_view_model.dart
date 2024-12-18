// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/cheque_page/fee_type_list.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/permission_handler.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class ChequePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetStorePaymentUsecase _getStorePaymentUsecase;
  final GetTokenGeneratorUsecase _getTokenGeneratorUsecase;
  final ChooseFileUseCase _chooseFileUseCase;
  final GetStoreImageUsecase _getStoreImageUsecase;
  ChequePageModel(
    this.exceptionHandlerBinder,
    this._getStorePaymentUsecase,
    this._getTokenGeneratorUsecase,
    this._chooseFileUseCase,
    this._getStoreImageUsecase,
  );

  final BehaviorSubject<List<bool>> selectedChequeType =
      BehaviorSubject<List<bool>>.seeded([]);

  late PaymentsPageModel paymentsPageModel;

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  List<TextEditingController> tokenNumberControllers =
      <TextEditingController>[];
  List<TextEditingController> chequeNumberControllers =
      <TextEditingController>[];
  List<TextEditingController> feeId = <TextEditingController>[];
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

  late int phoneNo;

  int? selectedIndexForChequeImage;

  final List<String> chequeTypes = [
    'Current Dated Cheque',
    'Post Dated Cheque',
    'Demand Draft'
  ];

  List<String?> selectedGenders = []; // To keep track of selected genders
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  List<FeeTypeList?> feesType = [];

  ValueNotifier<bool> amountIsNotEmpty = ValueNotifier<bool>(false);

  final BehaviorSubject<bool> showCameraAndGalleryBottomsheet =
      BehaviorSubject<bool>.seeded(false);

  final PermissionHandlerService permissionHandler = PermissionHandlerService();

  // FOR REDIRECTION AFTER PAYMENT SUCCESS
  Modules? modules;

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
    feeId.add(TextEditingController());
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
      feeId.removeAt(index);
    }
  }

  void makeListItemSelected(int selectedItem) {
    for (var fee in feesType) {
      if (selectedItem == fee?.id) {
        fee!.selected = true;
      }
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
          showCameraAndGalleryBottomsheet.add(false);
          uploadImage(
              file: result.data!.file!,
              index: index,
              fileName:
                  "finance/${selectedPendingFessList[0].lobSegmentId}/${result.data?.filePath?.split('/').last}/${DateTime.now()}");
        }
      }).onError((error) {});
    }).execute();
  }

  final BehaviorSubject<Resource<GetStoreImageModel>> _getStoreImageModel =
      BehaviorSubject<Resource<GetStoreImageModel>>();

  Stream<Resource<GetStoreImageModel>> get getStoreImageModel =>
      _getStoreImageModel.stream;

  void uploadImage(
      {required File file, required String fileName, required int index}) {
    exceptionHandlerBinder.handle(block: () {
      final params = GetStoreImageUsecaseParams(file: file, fileName: fileName);
      RequestManager<GetStoreImageModel>(params,
              createCall: () => _getStoreImageUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          chequeImage[index].text = result.data?.data ?? '';
        }
        _getStoreImageModel.add(result);
      }).onError((error) {});
    }).execute();
  }

  String formatDateToYYYYMMDD(String date) {
    // Assuming the input date is in 'dd/MM/yyyy' format
    DateTime parsedDate = DateFormat("dd/MM/yyyy").parse(date);

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
          feeId: chequeTypeControllers[i].text == "10"
              ? int.tryParse(feeId[i].text) ?? 0
              : null));
    }
    exceptionHandlerBinder.handle(block: () {
      GetStorePaymentUsecaseParams params = GetStorePaymentUsecaseParams(
          storePaymentModelRequest: StorePaymentModelRequest(
              paymentMode: 8,
              forMobile: true,
              paymentAmount: int.parse(amount.text),
              chequeInFavour: chequeInFavourId,
              lobId: selectedPendingFessList[0].lobSegmentId ?? 0,
              paymentDetails: paymentDetails,
              feeIds: List.generate(
                selectedPendingFessList.length,
                (index) => FeeIdModelRequest(
                    amountBeforeDiscount:
                        selectedPendingFessList[index].isDiscountApplied
                            ? int.parse(selectedPendingFessList[index]
                                    .pending
                                    ?.split('.')[0] ??
                                '0')
                            : null,
                    couponId: selectedPendingFessList[index].isDiscountApplied
                        ? selectedPendingFessList[index].couponId ?? ''
                        : null,
                    collected: selectedPendingFessList[index].isDiscountApplied
                        ? int.parse(selectedPendingFessList[index]
                                .discountedAmount
                                ?.split('.')[0] ??
                            '')
                        : int.parse(selectedPendingFessList[index]
                            .pending!
                            .split('.')[0]),
                    feeOrder: selectedPendingFessList[index].feeOrder ?? 0,
                    studentFeeId: selectedPendingFessList[index].id ?? 0),
              )));
      RequestManager<GetStorePaymentModel>(
        params,
        createCall: () => _getStorePaymentUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {}
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
      GetTokenGeneratorUsecaseParams params = GetTokenGeneratorUsecaseParams(
          segmentLobId: selectedPendingFessList[0].lobSegmentId ?? 0);
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
    int tempAmount = 0;
    for (var i = 0; i < amountControllers.length; i++) {
      tempAmount += int.parse(
          amountControllers[i].text == "" ? "0" : amountControllers[i].text);
    }
    if (tempAmount != int.parse(amount.text)) {
      onCallBack.call(true);
    } else {
      submitForm(model);
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

  List<int> selectedFeeType = [];

  void onFeeTypeSelected(int id, int index, Function(bool value) onChange) {
    if (!selectedFeeType.contains(id)) {
      selectedFeeType.add(id);
      for (var fee in selectedPendingFessList) {
        if (fee.id == id) {
          amountControllers[index].text = fee.pending?.split('.')[0] ?? "";
          chequeDateControllers[index].text = fee.activityStartDate ?? '';
          amountIsNotEmpty.value = true;
          feeId[index].text = fee.id.toString();
        }
      }
    } else {
      onChange.call(true);
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
    for (var controller in feeId) {
      controller.dispose();
    }
    noOfCheques.close();
    selectedChequeType.close();
    super.dispose();
  }
}
