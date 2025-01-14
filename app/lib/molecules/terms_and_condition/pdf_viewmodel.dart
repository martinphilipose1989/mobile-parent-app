import 'dart:developer';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';

import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PdfViewmodel extends BasePageViewModel {
  final DownloadFileFromUrlUsecase downloadFileFromUrlUsecase;
  final BehaviorSubject isChecked = BehaviorSubject.seeded(false);

  final BehaviorSubject<Resource<String>> localPath =
      BehaviorSubject.seeded(Resource.none());

  FlutterExceptionHandlerBinder exceptionHandlerBinder;
  FlutterToastErrorPresenter flutterToastErrorPresenter;

  final UndertakingUsecase undertakingUsecase;

  PdfViewmodel(
      {required this.downloadFileFromUrlUsecase,
      required this.exceptionHandlerBinder,
      required this.flutterToastErrorPresenter,
      required this.undertakingUsecase});

  void downloadPdfFromUrl({required String downloadUrl}) {
    localPath.add(Resource.loading());
    DownloadFileFromUrlUsecaseParams params =
        DownloadFileFromUrlUsecaseParams(urlPath: downloadUrl);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) =>
            downloadFileFromUrlUsecase.execute(params: params),
        onSuccess: (result) {
          localPath.add(Resource.success(data: result?.file?.path ?? ''));
        },
        onError: (error) {
          localPath.add(Resource.error());
        });
  }

  final BehaviorSubject<Resource<UndertakingResponse>> underTakingSubject =
      BehaviorSubject.seeded(Resource.none());
  void studentUnderTaking({required int studentYearlyId}) {
    underTakingSubject.add(Resource.loading());
    UndertakingUsecaseParams params = UndertakingUsecaseParams(
        studentYearlyId: studentYearlyId, isUnderTakingTaken: true);
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => undertakingUsecase.execute(params: params),
      onSuccess: (result) {
        underTakingSubject.add(Resource.success());
      },
      onError: (error) {
        underTakingSubject.add(Resource.error());
      },
    );
  }

  @override
  dispose() {
    log("DISPOSE");
    underTakingSubject.close();
    super.dispose();
  }
}
