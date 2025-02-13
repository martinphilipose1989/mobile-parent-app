import 'package:app/errors/flutter_toast_error_presenter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';

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

  TextEditingController schoolController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController boardController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController physicalController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController allergyController = TextEditingController();
  TextEditingController learningController = TextEditingController();
  TextEditingController pfirstnameController = TextEditingController();
  TextEditingController plastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addline1Controller = TextEditingController();
  TextEditingController addLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController statesController = TextEditingController();
  TextEditingController pinController = TextEditingController();

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
