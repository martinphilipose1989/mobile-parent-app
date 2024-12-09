import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import '../../errors/flutter_toast_error_presenter.dart';
import '../../model/resource.dart';
import '../../utils/api_response_handler.dart';
import '../../utils/request_manager.dart';

class CreateIntimationViewModel extends BasePageViewModel {
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateIntimationUsecase createIntimationUsecase;
  final ChooseFileUseCase chooseFileUseCase;
  final GetUserDetailsUsecase getUserDetailsUsecase;

  final UploadIntimationFileUseCase? uploadIntimationFileUseCase;

  CreateIntimationViewModel({
    required this.flutterToastErrorPresenter,
    required this.exceptionHandlerBinder,
    required this.createIntimationUsecase,
    required this.chooseFileUseCase,
    required this.uploadIntimationFileUseCase,
    required this.getUserDetailsUsecase,
  }) {
    getUserDetails();
  }

  late User user;
  String filePath = "";
  final TextEditingController dateController = TextEditingController();

  final TextEditingController noteController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();

  final PublishSubject<Resource<UploadFile>> _pickFrontFileResponse =
      PublishSubject();
  Stream<Resource<UploadFile?>> get pickFrontFileResponse =>
      _pickFrontFileResponse.stream;

  final BehaviorSubject<Resource<UploadIntimationFileResponseModel>>
      _uploadedFileResponse = BehaviorSubject.seeded(Resource.none());
  Stream<Resource<UploadIntimationFileResponseModel>>
      get uploadedFileResponse => _uploadedFileResponse.stream;
  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  final BehaviorSubject<Resource<bool>> loadingSubject =
      BehaviorSubject.seeded(Resource.none());

  Stream<Resource<User>> get userStream => userSubject.stream;
  final BehaviorSubject<Resource<CreateIntimationResponseModel>>
      intimationSubject = BehaviorSubject.seeded(Resource.none());
  Stream<Resource<CreateIntimationResponseModel>> get intimationStream =>
      intimationSubject.stream;

  void pickImage(UpoladFileTypeEnum fileTypeEnum) {
    debugPrint("before picking");
    exceptionHandlerBinder.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
              createCall: () => chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        _pickFrontFileResponse.add(result);
        debugPrint("after picking");
        if (result.status == Status.success) {
          uploadIntimationfile(uploadFile: result.data);
        }
      }).onError((error) {});
    }).execute();
  }

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));
        user = data.data!;
      }
    });
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null) {
  //
  //     setState(() {
  //       // Format and set the date in dd/MM/yyyy format
  //       dateController.text = DateFormat('dd/MM/yyyy').format(picked);
  //     });
  //
  //   }}
  void uploadIntimationfile({UploadFile? uploadFile}) {
    final params =
        UploadIntimationFileUseCaseParams(file: uploadFile!.file!, id: 0);

    RequestManager(
      params,
      createCall: () => uploadIntimationFileUseCase!.execute(params: params),
    ).asFlow().listen((result) {
      if (result.status == Status.success) {
        filePath = result.data?.data?.fileAttachment ?? "";
      }
      _uploadedFileResponse.add(result);
    }).onError((error) {});
  }

  List<GetGuardianStudentDetailsStudentModel>? selectedStudent =
      ProviderScope.containerOf(navigatorKey.currentContext!)
          .read(dashboardViewModelProvider)
          .selectedStudentId;

  // void createIntimation() {
  //   intimationSubject.add(Resource.loading());
  //
  //   debugPrint("create");
  //   CreateIntimationUseCaseParams params = CreateIntimationUseCaseParams(
  //       approvalFlag: "1",
  //       approvedById: 0,
  //       note: noteController.text,
  //       status: 1,
  //       fromDate: "2024-11-15",
  //       toDate: "2024-11-15",
  //       initimationType: 3,
  //       globalStudentId: selectedStudent?.first.id,
  //       globalUserId: userSubject.value.data?.id,
  //       fileAttachment: _uploadedFileResponse.value.data?.data?.fileAttachment
  //   );
  //
  //   intimationSubject.add(Resource.loading());
  //   ApiResponseHandler.apiCallHandler(
  //     exceptionHandlerBinder: exceptionHandlerBinder,
  //     flutterToastErrorPresenter: flutterToastErrorPresenter,
  //     params: params,
  //     createCall: (params) => createIntimationUsecase.execute(params: params),
  //
  //     onSuccess: (data) {
  //       debugPrint(data?.data);
  //
  //       intimationSubject.add(Resource.success());
  //
  //       Navigator.pop(navigatorKey.currentContext!);
  // CommonPopups().showSuccess(navigatorKey.currentContext!, "Raised Intimation",(tr){} );
  //     },
  //     onError: (error) {
  //       debugPrint(error?.error);
  //       intimationSubject.add(Resource.error());
  //     },
  //   );
  // }

  void createIntimation() {
    intimationSubject.add(Resource.loading());

    debugPrint("create");
    CreateIntimationUseCaseParams params = CreateIntimationUseCaseParams(
        approvalFlag: "1",
        approvedById: 0,
        note: noteController.text,
        status: 1,
        fromDate: dateController.text,
        toDate: dateController.text,
        initimationType: 3,
        globalStudentId: selectedStudent?.first.id,
        globalUserId: userSubject.value.data?.id,
        fileAttachment: _uploadedFileResponse.value.data?.data?.fileAttachment);

    intimationSubject.add(Resource.loading());
    RequestManager(
      params,
      createCall: () => createIntimationUsecase.execute(
        params: params,
      ),
    ).asFlow().listen((data) {
      if (data.status == Status.loading) {
        CommonPopups().showloading(navigatorKey.currentContext!);
      }
      if (data.status == Status.success) {
        loadingSubject.add(Resource.loading(data: false));

        CommonPopups().showSuccess(
            navigatorKey.currentContext!, "Raised Intimation", (tr) {
          Navigator.pop(navigatorKey.currentContext!);
          Navigator.pop(navigatorKey.currentContext!);
        });
      }
    });
  }
}
