import 'dart:developer';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class StaffListViewModel extends BasePageViewModel {
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetStaffListUsecase getStaffListUsecase;

  final BehaviorSubject<Resource<List<Staff>>> staffResponse =
      BehaviorSubject.seeded(Resource.none());

  PageController pageController = PageController();

  BehaviorSubject<int> selectIndex = BehaviorSubject.seeded(0);



  StaffListViewModel(
      {required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder,
      required this.getStaffListUsecase,
});

  void getStaffList({required int routeId,required String app}) {
    staffResponse.add(Resource.loading());
    final GetStaffListUseCaseParams params =
        GetStaffListUseCaseParams(platform: app, schoolId: routeId);

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => getStaffListUsecase.execute(params: params),
      onSuccess: (result) {
        staffResponse.add(Resource.success(data: result?.data));
      },
      onError: (error) {
        staffResponse.add(Resource.error(error: error));
      },
    );
  }



}
