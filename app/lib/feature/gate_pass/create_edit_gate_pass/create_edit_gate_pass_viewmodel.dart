import 'package:app/di/states/viewmodels.dart';
import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_page.dart';
import 'package:app/model/phone_number_details.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/constants/constants.dart';
import 'package:app/utils/dateformate.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateEditGatePassViewModel extends BasePageViewModel {
  // Dependencies
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final ChooseFileUseCase _chooseFileUseCase;
  final GetPurposeOfVisitListUsecase _getPurposeOfVisitListUsecase;
  final UploadVisitorProfileUsecase _uploadVisitorProfileUsecase;
  final CreateGatepassUsecase _createGatepassUsecase;
  final FlutterToastErrorPresenter _flutterToastErrorPresenter;
  final GetUserDetailsUsecase _getUserDetailsUsecase;

  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  dynamic studentId;

  // Stream for picking front file
  final PublishSubject<Resource<UploadFile>> _pickFrontFileResponse =
      PublishSubject();

  Stream<Resource<UploadFile>> get pickFrontFileResponse =>
      _pickFrontFileResponse.stream;

  void pickImage(UpoladFileTypeEnum fileTypeEnum) {
    exceptionHandlerBinder.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
              createCall: () => _chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        _pickFrontFileResponse.add(result);
        if (result.status == Status.success) {
          uploadVisitorProfileImage(uploadedFile: result.data);
        }
      }).onError((error) {});
    }).execute();
  }

  // Stream for uploading file response
  final BehaviorSubject<Resource<UploadFileResponseModel>>
      _uploadedFileResponse = BehaviorSubject();

  Stream<Resource<UploadFileResponseModel>> get uploadedFileResponse =>
      _uploadedFileResponse.stream;

  void uploadVisitorProfileImage({UploadFile? uploadedFile}) {
    final params = UploadVisitorProfileUsecaseParams(file: uploadedFile!.file!);
    RequestManager(params,
            createCall: () =>
                _uploadVisitorProfileUsecase.execute(params: params))
        .asFlow()
        .listen((result) {
      _uploadedFileResponse.add(result);
    }).onError((error) {});
  }

  // Stream for purpose of visit response
  final BehaviorSubject<Resource<MdmCoReasonResponseModel>>
      _purposeOfVisitResponse = BehaviorSubject();

  Stream<Resource<MdmCoReasonResponseModel>> get purposeOfVisitResponse =>
      _purposeOfVisitResponse.stream;

  int? purposOfVisitId;

  void getPurposeOfVisitList() {
    final params = GetPurposeOfVisitListUsecaseParams();
    RequestManager<MdmCoReasonResponseModel>(params,
            createCall: () =>
                _getPurposeOfVisitListUsecase.execute(params: params))
        .asFlow()
        .listen((result) {
      purposOfVisitId = null;
      _purposeOfVisitResponse.add(result);
    }).onError((error) {});
  }

  void setPurposeOfVisitId(String value) {
    final result = _purposeOfVisitResponse.valueOrNull;
    purposOfVisitId = result?.data?.data
        ?.firstWhere(
            (e) => e.attributes?.name?.toLowerCase() == value.toLowerCase(),
            orElse: () => MdmCoReasonDataModel())
        .id;
  }

  // Stream for creating gate pass response
  final PublishSubject<Resource<CreateGatepassResponseModel>>
      _createGatePassResponse = PublishSubject();

  Stream<Resource<CreateGatepassResponseModel>> get createGatePassResponse =>
      _createGatePassResponse.stream;

  final TextEditingController visitorNameController = TextEditingController();

  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController comingFromController = TextEditingController();
  final TextEditingController pointOfContactController =
      TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController guestCountController =
      TextEditingController(text: '1');
  final TextEditingController visitDateTimeController = TextEditingController(
      text: DateTime.now().toIso8601String().dateFormatToDDMMYYYhhmma());

  BehaviorSubject<String> countryDialCode = BehaviorSubject.seeded("+91");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void createGatePass() async {
    final params = CreateGatepassUsecaseParams(
      requestModel: CreateGatePassModel(
        name: visitorNameController.text,
        mobile: "${countryDialCode.value}${contactNumberController.text}",
        email: emailIDController.text,
        visitorTypeId: CONST_VISITOR_PARENT_TYPE_ID,
        purposeOfVisitId: purposOfVisitId,
        comingFrom: comingFromController.text,
        pointOfContact: pointOfContactController.text,
        profileImage:
            "https://www.google.com/search?q=profile+pic+samle+png&oq=profile+pic+samle+png&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIJCAEQIRgKGKABMgkIAhAhGAoYoAEyBwgDECEYnwUyBwgEECEYnwUyBwgFECEYnwUyBwgGECEYnwUyBwgHECEYnwXSAQkxNDM3MmowajeoAgCwAgA&sourceid=chrome&ie=UTF-8#vhid=szOIGUvItozHbM&vssid=_RDYuZ-v6MtabnesPz_GKqQw_77" /*_uploadedFileResponse.valueOrNull?.data?.data?.filePath*/,
        guestCount: int.parse(guestCountController.text),
        vehicleNumber: vehicleController.text,
        issuedDate: DateTime.now().dateFormatoHHmmss(),
        issuedTime: DateTime.now().dateFormatoHHmmss(),
        studentName: vehicleController.text,
        studentId: studentId,
      ),
    );

    RequestManager(params,
            createCall: () => _createGatepassUsecase.execute(params: params))
        .asFlow()
        .listen((data) {
      _createGatePassResponse.add(data);

      if (data.status == Status.success) {
        loadingSubject.add(Resource.loading(data: false));
        CommonPopups().showSuccess(
            navigatorKey.currentContext!, "Gate pass created successfully",
            (value) {
          _checkAndNavigateToVisitorDetails();
        }, popParameter: "In");
      } else if (data.status == Status.error) {
        loadingSubject.add(Resource.loading(data: false));
        _flutterToastErrorPresenter.show(
            data.dealSafeAppError!,
            navigatorKey.currentContext!,
            "${data.dealSafeAppError?.error.message}");
      }
    }).onError((error) {
      loadingSubject.add(Resource.loading(data: false));
    });
  }

  void getStudentId() {
    //dashboardProvider
    var dashboardVM = ProviderScope.containerOf(navigatorKey.currentContext!)
        .read(dashboardViewModelProvider);
    //  studentId
    studentId = dashboardVM.selectedStudentId?.first.id;
  }

  /// checkAndNavigateToVisitorDetails
  void _checkAndNavigateToVisitorDetails() {
    if (studentId == null || studentId!.toString().isEmpty) return;
    // navigate to visitorDetailsPage
    navigatorKey.currentState?.pushNamed(RoutePaths.visitorDetailsPage,
        arguments: VisitorDetailsPageParams(
            mobileNo: contactNumberController.text, studentId: studentId));
  }

  getCountryCode({required String phoneNumber}) async {
    try {
      final result = await parse(phoneNumber);
      final validPhoneNumber = PhoneNumberDetails.fromMap(result);

      contactNumberController.text = validPhoneNumber.nationalNumber;
      countryDialCode.add("+${validPhoneNumber.countryCode}");
      return validPhoneNumber.countryCode.isNotEmpty ? true : false;
    } on PlatformException catch (_) {}
  }

  BehaviorSubject<String>? intialTypeOfVisitor = BehaviorSubject.seeded('');

  void _setUserData({User? userData}) {
    visitorNameController.text = userData?.userName ?? "";
    emailIDController.text = userData?.email ?? "";
    contactNumberController.text = userData?.phoneNumber ?? "";

    // TODO: uncomment after demo getCountryCode(phoneNumber: arguments.parentData.visitorMobile ?? "");
  }

  final BehaviorSubject<Resource<bool>> loadingSubject =
      BehaviorSubject.seeded(Resource.none());

  void creatOrUpdateGatePass() {
    loadingSubject.add(Resource.loading(data: true));
    createGatePass();
  }

  ///------------------- get user details : Shared Pref-------------------///

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => _getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));
        _setUserData(userData: data?.data);
      }
    });
  }

  // Constructor
  CreateEditGatePassViewModel({
    required this.exceptionHandlerBinder,
    required CreateGatepassUsecase createGatepassUsecase,
    required ChooseFileUseCase chooseFileUseCase,
    required GetPurposeOfVisitListUsecase getPurposeOfVisitListUsecase,
    required UploadVisitorProfileUsecase uploadVisitorProfileUsecase,
    required FlutterToastErrorPresenter flutterToastErrorPresenter,
    required GetUserDetailsUsecase getUserDetailsUsecase,
  })  : _createGatepassUsecase = createGatepassUsecase,
        _chooseFileUseCase = chooseFileUseCase,
        _getPurposeOfVisitListUsecase = getPurposeOfVisitListUsecase,
        _uploadVisitorProfileUsecase = uploadVisitorProfileUsecase,
        _flutterToastErrorPresenter = flutterToastErrorPresenter,
        _getUserDetailsUsecase = getUserDetailsUsecase;
}
