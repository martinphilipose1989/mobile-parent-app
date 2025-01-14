import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class StudentProfileEditViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  final GetStudentDetailUsecase getStudentDetailUsecase;

  // final BehaviorSubject<Resource<GetStudentDetailData>>
  //     _studentDetailSubject = BehaviorSubject.seeded(Resource.none());
  // late List<GetGuardianStudentDetailsStudentModel>? selectedStudent=[];
  //
  // Stream<Resource<GetStudentDetailData>> get studentDetailStream =>
  //     _studentDetailSubject.stream;

  StudentProfileEditViewModel(
      {required this.exceptionHandlerBinder,
     // required this.getStudentDetailUsecase,
      required this.flutterToastErrorPresenter});

  // void getStudentDetail({required int studentId}) {
  //   _studentDetailSubject.add(Resource.loading());
  //   GetStudentDetailUsecaseParams params =
  //       GetStudentDetailUsecaseParams(studentId: studentId);
  //   ApiResponseHandler.apiCallHandler(
  //     exceptionHandlerBinder: exceptionHandlerBinder,
  //     flutterToastErrorPresenter: flutterToastErrorPresenter,
  //     params: params,
  //     createCall: (params) => getStudentDetailUsecase.execute(params: params),
  //     onSuccess: (data) {
  //       _studentDetailSubject.add(
  //         Resource.success(data: data?.data),
  //       );
  //     },
  //     onError: (error) {
  //       _studentDetailSubject.add(Resource.error());
  //     },
  //   );
  // }
}
