import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/dashboard/dashboard_state.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/common_widgets/toggle_option_list.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class NewEnrolmentViewModel extends BasePageViewModel {
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final StudentDetailUseCase studentDetailsUsecase;

  // TAB CONTROLLER
  late TabController tabController;
  BehaviorSubject<int> selectedIndexSubject = BehaviorSubject.seeded(0);

  final BehaviorSubject<VasOptions> selectedVasOption =
      BehaviorSubject.seeded(VasOptions.kidsClub);
  final vasOptions = [
    ToggleOption(value: VasOptions.kidsClub, text: "Kids Club"),
    ToggleOption(value: VasOptions.cafeteria, text: "Cafeteria"),
    ToggleOption(value: VasOptions.psa, text: "PSA"),
    ToggleOption(value: VasOptions.summerCamp, text: "Summer Camp"),
    ToggleOption(value: VasOptions.transport, text: "Transport"),
  ];

  NewEnrolmentViewModel(
      {required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder,
      required this.studentDetailsUsecase}) {
    getStudentDetails();
  }

  final dashBoardState = DashboardState();

  final BehaviorSubject<Resource<StudentData>> studentProfileSubject =
      BehaviorSubject.seeded(Resource.none());
  Future<void> getStudentDetails() async {
    studentProfileSubject.add(Resource.loading());
    final StudentDetailUseCaseParams params =
        StudentDetailUseCaseParams(dashBoardState.selectedStudent?.id);
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
}

/**
 *  jhadu
 *  comfort
 *  chatai
 *  shampoo himalaya
 *  baby wet wipes
 *  dettol bdai bottle
 * 
 * 1. cafeteria
 * 2. kids club
 * 3. psa
 * 4. summer camp
 * 5. transport
 */

