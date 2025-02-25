import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AddNewBearerViewmodel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final ChooseFileUseCase chooseFileUseCase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final UploadBearerProfileUsecase uploadBearerProfileUsecase;
  final CreateBearerUsecase createBearerUsecase;
  final GlobalKey<FormState> formKey = GlobalKey();

  String filePath = "";

  AddNewBearerViewmodel(
      {required this.uploadBearerProfileUsecase,
      required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder,
      required this.chooseFileUseCase,
      required this.createBearerUsecase});

  // Stream for picking front file
  final PublishSubject<Resource<UploadFile>> _pickFrontFileResponse =
      PublishSubject();
  Stream<Resource<UploadFile>> get pickFrontFileResponse =>
      _pickFrontFileResponse.stream;

  final BehaviorSubject<Resource<UploadFileResponseModel>>
      _uploadedFileResponse = BehaviorSubject.seeded(Resource.none());
  Stream<Resource<UploadFileResponseModel>> get uploadedFileResponse =>
      _uploadedFileResponse.stream;

  void pickImage(UpoladFileTypeEnum fileTypeEnum) {
    exceptionHandlerBinder.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
              createCall: () => chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        _pickFrontFileResponse.add(result);
        if (result.status == Status.success) {
          uploadBearerProfileImage(uploadedFile: result.data);
        }
      }).onError((error) {});
    }).execute();
  }

  void uploadBearerProfileImage({UploadFile? uploadedFile}) {
    final params = UploadBearerProfileUsecaseParams(file: uploadedFile!.file!);

    RequestManager(
      params,
      createCall: () => uploadBearerProfileUsecase.execute(params: params),
    ).asFlow().listen((result) {
      if (result.status == Status.success) {
        filePath = result.data?.data?.fileName ?? "";
      }
      _uploadedFileResponse.add(result);
    }).onError((error) {});
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final BehaviorSubject<Resource<MapStudenttoBearerResponse>> bearerSubject =
      BehaviorSubject.seeded(Resource.none());
  Stream<Resource<MapStudenttoBearerResponse>> get bearerStream =>
      bearerSubject.stream;

  void createBearer({required int studentId}) {
    bearerSubject.add(Resource.loading());

    CreateBearerUsecaseParams params = CreateBearerUsecaseParams(
      request: CreateBearerRequesData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        profileImage: _uploadedFileResponse.value.data?.data?.fileName,
      ),
      studentId: studentId,
    );

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => createBearerUsecase.execute(params: params),
      onSuccess: (data) {
        bearerSubject.add(Resource.success());
      },
      onError: (error) {
        bearerSubject.add(Resource.error());
      },
    );
  }
}
