import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class StudentProfilePageViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GetStudentProfileUsecase getStudentProfileUsecase;

  final BehaviorSubject<Resource<GetStudentProfileData>>
      _studentProfileSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<GetStudentProfileData>> get studentProfileStream =>
      _studentProfileSubject.stream;

  StudentProfilePageViewModel(
      {required this.exceptionHandlerBinder,
      required this.getStudentProfileUsecase,
      required this.flutterToastErrorPresenter});

  void getStudentProfile({required int studentId}) {
    _studentProfileSubject.add(Resource.loading());
    GetStudentProfileUsecaseParams params =
        GetStudentProfileUsecaseParams(studentId: studentId);
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => getStudentProfileUsecase.execute(params: params),
      onSuccess: (data) {
        _studentProfileSubject.add(
          Resource.success(data: data?.data),
        );
      },
      onError: (error) {
        _studentProfileSubject.add(Resource.error());
      },
    );
  }
}
