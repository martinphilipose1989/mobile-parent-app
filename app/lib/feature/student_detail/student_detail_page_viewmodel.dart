import 'dart:core';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class StudentDetailPageViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final StudentDetailUseCase studentDetailUsecase;
 final GetBearerListUsecase getBearerListUsecase;

  final BehaviorSubject<Resource<StudentData>>
      _studentDetailSubject = BehaviorSubject.seeded(Resource.none());
  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent=[];
 late List<BearerResponse> bererList=[];
  Stream<Resource<StudentData>> get studentDetailStream =>
      _studentDetailSubject.stream;

  StudentDetailPageViewModel(
      {required this.exceptionHandlerBinder,
       required this.getBearerListUsecase,
        required this.studentDetailUsecase,
      required this.flutterToastErrorPresenter});

  final BehaviorSubject<Resource<List<BearerResponse>>> bearerResponse =
  BehaviorSubject.seeded(Resource.none());

  Stream<Resource<List<BearerResponse>>> get bearerStream =>
      bearerResponse.stream;

  void getBearerList({required int studentId}) {
    bearerResponse.add(Resource.loading());
    final GetBearerListUsecaseParams params =
    GetBearerListUsecaseParams(studentId: studentId, platform: 'app');

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => getBearerListUsecase.execute(params: params),
      onSuccess: (result) {
        bearerResponse.add(Resource.success(data: result?.data));
bererList=result?.data??[];
      },
      onError: (error) {
        bearerResponse.add(Resource.error(error: error));
      },
    );
  }

  void getStudentDetail({required int studentId}) {
    _studentDetailSubject.add(Resource.loading());
    StudentDetailUseCaseParams params =
    StudentDetailUseCaseParams(studentId);
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => studentDetailUsecase.execute(params: params),
      onSuccess: (data) {
        _studentDetailSubject.add(
          Resource.success(data: data?.data),

        );

      },
      onError: (error) {
        _studentDetailSubject.add(Resource.error());
      },
    );
  }
}
