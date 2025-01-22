import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/dashboard/dashboard_state.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/common_widgets/toggle_option_list.dart';

import 'package:app/utils/enums/new_enrolment_enum.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:localisation/strings.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class NewEnrolmentViewModel extends BasePageViewModel {
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final StudentDetailUseCase studentDetailsUsecase;
  final NewEnrolmentUsecase newEnrolmentUsecase;
  final GetMdmAttributeUsecase getMdmAttributeUsecase;

  // TAB CONTROLLER
  late TabController tabController;
  BehaviorSubject<int> selectedIndexSubject = BehaviorSubject.seeded(0);

  final BehaviorSubject<VasOptions> selectedVasOption =
      BehaviorSubject.seeded(VasOptions.kidsClub);
  final vasOptions = [
    ToggleOption(value: VasOptions.kidsClub, text: Strings.current.kids_club),
    ToggleOption(value: VasOptions.cafeteria, text: Strings.current.cafeteria),
    // ToggleOption(value: VasOptions.psa, text: "PSA"),
    // ToggleOption(value: VasOptions.summerCamp, text: "Summer Camp"),
    ToggleOption(value: VasOptions.transport, text: Strings.current.transport),
  ];

  NewEnrolmentViewModel(
      {required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder,
      required this.studentDetailsUsecase,
      required this.newEnrolmentUsecase,
      required this.getMdmAttributeUsecase});

  final dashBoardState = DashboardState();

  // ************************ STUDENT PROFILE ************************
  int? selectedStudentId;
  final BehaviorSubject<Resource<StudentData>> studentProfileSubject =
      BehaviorSubject.seeded(Resource.none());
  Future<void> getStudentDetails() async {
    studentProfileSubject.add(Resource.loading());
    final StudentDetailUseCaseParams params =
        StudentDetailUseCaseParams(selectedStudentId!);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => studentDetailsUsecase.execute(params: params),
        onSuccess: (result) {
          studentProfileSubject.add(Resource.success(data: result?.data));
        },
        onError: (error) {
          studentProfileSubject.add(Resource.error());
        });
  }

  // ************************ NEW ENROLMENT ************************
  final BehaviorSubject<Resource<NewEnrolmentResponse>> newEnrolmentSubject =
      BehaviorSubject.seeded(Resource.none());

  Future<void> createNewEnrolment(
      {List<StudentEnrolmentFee>? studentFees}) async {
    newEnrolmentSubject.add(Resource.loading());
    final NewEnrolmentUsecaseParams params =
        NewEnrolmentUsecaseParams(studentFees: studentFees);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => newEnrolmentUsecase.execute(params: params),
        onSuccess: (result) {
          newEnrolmentSubject.add(Resource.success(data: result));
          newEnrolmentSubject.add(Resource.none());
        },
        onError: (error) {
          newEnrolmentSubject.add(Resource.error());
        });
  }

  final BehaviorSubject<Resource<List<MdmAttributeModel>>>
      getAcademicYearSubject = BehaviorSubject.seeded(Resource.none());

  final BehaviorSubject<String> selectedAcademicYear =
      BehaviorSubject<String>.seeded('');

  Future<void> getAcademicYear() async {
    getAcademicYearSubject.add(Resource.loading());
    final GetMdmAttributeUsecaseParams params =
        GetMdmAttributeUsecaseParams(infoType: 'academicYear');
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => getMdmAttributeUsecase.execute(params: params),
      onSuccess: (result) {
        getAcademicYearSubject.add(Resource.success(data: result?.data ?? []));
      },
      onError: (error) {
        getAcademicYearSubject.add(Resource.error(error: error));
      },
    );
  }

  String? academicYearId;
  void selectAcademicYear(String selectValue) {
    final selectedYear = getAcademicYearSubject.value.data
        ?.firstWhere((value) => value.attributes?.name == selectValue);

    academicYearId = selectedYear?.attributes?.shortNameTwoDigit;
    selectedAcademicYear.add(selectedYear?.attributes?.name ?? '');
  }

  @override
  void dispose() {
    studentProfileSubject.close();
    newEnrolmentSubject.close();
    selectedIndexSubject.close();
    selectedVasOption.close();
    tabController.dispose();
    getAcademicYearSubject.close();
    selectedAcademicYear.close();
    super.dispose();
  }
}
