import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../errors/flutter_toast_error_presenter.dart';
import '../../model/resource.dart';
import '../../utils/api_response_handler.dart';
import '../../utils/request_manager.dart';

class CreateIntimationViewModel extends BasePageViewModel {
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateIntimationUsecase createIntimationUsecase;
  final ChooseFileUseCase chooseFileUseCase;
final UploadIntimationFileUseCase? uploadIntimationFileUseCase;

  CreateIntimationViewModel({
   required this.flutterToastErrorPresenter,
   required this.exceptionHandlerBinder,
  required  this.createIntimationUsecase,
  required  this.chooseFileUseCase,
  required  this.uploadIntimationFileUseCase,
  });


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
  Stream<Resource<UploadIntimationFileResponseModel>> get uploadedFileResponse =>
      _uploadedFileResponse.stream;

  final BehaviorSubject<Resource<CreateIntimationResponseModel>> intimationSubject =
  BehaviorSubject.seeded(Resource.none());
  Stream<Resource<CreateIntimationResponseModel>> get intimationStream =>
      intimationSubject.stream;



  void pickImage(UpoladFileTypeEnum fileTypeEnum) {
    print("before picking");
    exceptionHandlerBinder?.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
          createCall: () => chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        _pickFrontFileResponse.add(result);
        print("after picking");
        if (result.status == Status.success) {
          print("after on success picking");
          print(result.data);
          uploadIntimationfile(uploadFile: result.data);
        }
      }).onError((error) {});
    }).execute();
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
    final params = UploadIntimationFileUseCaseParams(  file: uploadFile!.file!,id: 0);

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

  void createIntimation() {
    intimationSubject.add(Resource.loading());
    print("create");
    CreateIntimationUseCaseParams params = CreateIntimationUseCaseParams(
        approvalFlag: "1",
        approvedById: 0,
        note: "hi",
        status: 1,
        fromDate: "2024-11-15",
        toDate: "2024-11-15",
        initimationType: 3,
        globalStudentId: 10,
        globalUserId: 1,
        fileAttachment: _uploadedFileResponse.value.data?.data?.fileAttachment
    );

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => createIntimationUsecase.execute(params: params),
      onSuccess: (data) {
        print(data?.data);
        print("create_1");
        intimationSubject.add(Resource.success());
      },
      onError: (error) {
        print(error?.error);
        intimationSubject.add(Resource.error());
      },
    );
  }

//   void createIntimation({required CreateIntimationRequestModel createIntimationmodel}) {
//     intimationSubject.add(Resource.loading());
// print("create");
//     CreateIntimationUseCaseParams params = CreateIntimationUseCaseParams(
//         approvalFlag: createIntimationmodel.approvalFlag,
//         approvedById: createIntimationmodel.approvedById,
//         note: createIntimationmodel.note,
//         status: createIntimationmodel.status,
//         fromDate: createIntimationmodel.fromDate,
//         toDate: createIntimationmodel.toDate,
//         initimationType: createIntimationmodel.initimationType,
//         globalStudentId: createIntimationmodel.globalStudentId,
//         globalUserId: createIntimationmodel.globalUserId,
//         fileAttachment: _uploadedFileResponse.value.data?.data?.fileAttachment
//     );
//
//     ApiResponseHandler.apiCallHandler(
//       exceptionHandlerBinder: exceptionHandlerBinder,
//       flutterToastErrorPresenter: flutterToastErrorPresenter,
//       params: params,
//       createCall: (params) => createIntimationUsecase.execute(params: params),
//       onSuccess: (data) {
//         print(data?.data);
//         intimationSubject.add(Resource.success());
//       },
//       onError: (error) {
//         print(error?.error);
//         intimationSubject.add(Resource.error());
//       },
//     );
//   }

}