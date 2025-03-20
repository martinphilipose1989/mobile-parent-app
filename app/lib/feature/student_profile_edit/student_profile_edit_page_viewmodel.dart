import 'package:app/di/states/viewmodels.dart';
import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/myapp.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:rxdart/rxdart.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../utils/api_response_handler.dart';
import '../../utils/common_widgets/common_popups.dart';

class StudentProfileEditViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final StudentDetailEditUseCase studentDetailEditUsecase;

  // final BehaviorSubject<Resource<GetStudentDetailData>>
  //     _studentDetailSubject = BehaviorSubject.seeded(Resource.none());
  // late List<GetGuardianStudentDetailsStudentModel>? selectedStudent=[];
  //
  // Stream<Resource<GetStudentDetailData>> get studentDetailStream =>
  //     _studentDetailSubject.stream;

  StudentProfileEditViewModel(
      {required this.exceptionHandlerBinder,required this.studentDetailEditUsecase,
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
  TextEditingController mfirstnameController = TextEditingController();
  TextEditingController mlastnameController = TextEditingController();
  TextEditingController mphoneController = TextEditingController();
  TextEditingController memailController = TextEditingController();
  TextEditingController addline1Controller = TextEditingController();
  TextEditingController addLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController statesController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final BehaviorSubject<Resource<StudentEditResponseModel>>
      _studentDetailEditSubject = BehaviorSubject.seeded(Resource.none());
  // late List<GetGuardianStudentDetailsStudentModel>? selectedStudent=[];
  //
  Stream<Resource<StudentEditResponseModel>> get studentDetailEditStream =>
      _studentDetailEditSubject.stream;




  void studentDetailEdit({required StudentEditRequestModel model}) {
    _studentDetailEditSubject.add(Resource.loading());
   StudentDetailEditUseCaseParams params =
   StudentDetailEditUseCaseParams(id: model.id,studentProfile: model.studentProfile,parent: model.parent);
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => studentDetailEditUsecase.execute(params: params),
      onSuccess: (data) {
        _studentDetailEditSubject.add(
          Resource.success(data: data),
        );

        CommonPopups
          ().showSuccess(navigatorKey.currentContext!, Strings.of(navigatorKey.currentContext!).edited, (tr){
          ProviderScope.containerOf(navigatorKey.currentContext!)
              .read(studentDetailPageViewModelProvider).getStudentDetail(studentId: model.id!);
          Navigator.pop(navigatorKey.currentContext!);
        },);
      },
      onError: (error) {
        _studentDetailEditSubject.add(Resource.error());
      },
    );
  }



}
