import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionListUsecase getAdmissionListUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  AdmissionsViewModel(this.exceptionHandlerBinder, this.getAdmissionListUsecase,
      this.flutterToastErrorPresenter);

  final ScrollController scrollController = ScrollController();
  final ScrollController closedAdmissionController = ScrollController();
  late TabController controller;
  BehaviorSubject<int> selectedTab = BehaviorSubject<int>.seeded(0);

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (isLoading.value) {
          return;
        }
        if (isNextPage) {
          pageNumber++;
          isLoading.add(true);
          fetchAdmissionList();
        }
      }
    });

    closedAdmissionController.addListener(() {
      if (closedAdmissionController.position.pixels ==
          closedAdmissionController.position.maxScrollExtent) {
        if (isLoading.value) {
          return;
        }
        if (closedAdmissionsNextPage) {
          closedAdmissionsPageNumber++;
          isLoading.add(true);
          fetchClosedAdmissionList();
        }
      }
    });
  }

  int pageNumber = 1, pageSize = 10;
  int closedAdmissionsPageNumber = 1, closedAdmissionPageSize = 10;

  bool isNextPage = true;
  bool closedAdmissionsNextPage = true;

  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(true);

  BehaviorSubject<List<AdmissionListDetailModel>> admissions =
      BehaviorSubject.seeded([]);
  BehaviorSubject<List<AdmissionListDetailModel>> closedAdmissions =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<Resource<AdmissionListBaseModel>>
      _getAdmissionListResponse = BehaviorSubject();
  final BehaviorSubject<Resource<AdmissionListBaseModel>>
      _getClosedAdmissionListResponse = BehaviorSubject();

  Stream<Resource<AdmissionListBaseModel>> get getAdmissionListResponse =>
      _getAdmissionListResponse.stream;

  Stream<Resource<AdmissionListBaseModel>> get getClosedAdmissionListResponse =>
      _getClosedAdmissionListResponse.stream;

  Future<void> fetchAdmissionList({bool isRefresh = false}) async {
    exceptionHandlerBinder.handle(block: () async {
      if (isRefresh) {
        pageNumber = 1;
      }
      if (!isNextPage) {
        return;
      }
      var phoneNumber = await SharedPreferenceHelper.getString(mobileNumber);
      GetAdmissionListUsecaseParams params = GetAdmissionListUsecaseParams(
          phone: phoneNumber,
          pageNumber: pageNumber,
          pageSize: pageSize,
          status: "Open");
      if (pageNumber > 1) {
        isLoading.value = true;
      }
      RequestManager<AdmissionListBaseModel>(
        params,
        createCall: () => getAdmissionListUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((event) {
        if (event.status == Status.loading) {
          if (pageNumber == 1 && !isRefresh) {
            _getAdmissionListResponse.add(event);
          }
        }
        if (event.status == Status.success) {
          if (isLoading.value) {
            isLoading.value = false;
          }
          _getAdmissionListResponse.add(event);
          _handleAdmissionListing(event.data?.data?.data ?? [], isRefresh,
              status: "Open");
          isNextPage = event.data?.data?.isNextPage ?? false;
        }
        if (event.status == Status.error) {
          if (pageNumber == 1) {
            _getAdmissionListResponse.add(event);
            flutterToastErrorPresenter.show(
                event.dealSafeAppError!.throwable,
                navigatorKey.currentContext!,
                event.dealSafeAppError?.error.message ?? '');
          } else {
            if (isNextPage) {
              isNextPage = false;
              _getAdmissionListResponse.add(event);
            }
          }
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> fetchClosedAdmissionList({bool isRefresh = false}) async {
    exceptionHandlerBinder.handle(block: () async {
      if (isRefresh) {
        closedAdmissionsPageNumber = 1;
      }
      if (!closedAdmissionsNextPage) {
        return;
      }
      var phoneNumber = await SharedPreferenceHelper.getString(mobileNumber);
      GetAdmissionListUsecaseParams params = GetAdmissionListUsecaseParams(
          phone: phoneNumber,
          pageNumber: closedAdmissionsPageNumber,
          pageSize: closedAdmissionPageSize,
          status: "Closed");
      if (closedAdmissionsPageNumber > 1) {
        isLoading.value = true;
      }
      RequestManager<AdmissionListBaseModel>(
        params,
        createCall: () => getAdmissionListUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((event) {
        if (event.status == Status.loading) {
          if (closedAdmissionsPageNumber == 1 && !isRefresh) {
            _getClosedAdmissionListResponse.add(event);
          }
        }
        if (event.status == Status.success) {
          if (isLoading.value) {
            isLoading.value = false;
          }
          _getClosedAdmissionListResponse.add(event);
          _handleAdmissionListing(event.data?.data?.data ?? [], isRefresh,
              status: "Closed");
          closedAdmissionsNextPage = event.data?.data?.isNextPage ?? false;
        }
        if (event.status == Status.error) {
          if (closedAdmissionsPageNumber == 1) {
            _getClosedAdmissionListResponse.add(event);
            flutterToastErrorPresenter.show(
                event.dealSafeAppError!.throwable,
                navigatorKey.currentContext!,
                event.dealSafeAppError?.error.message ?? '');
          } else {
            if (closedAdmissionsNextPage) {
              closedAdmissionsNextPage = false;
              _getClosedAdmissionListResponse.add(event);
            }
          }
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  void _handleAdmissionListing(
      List<AdmissionListDetailModel> admission, bool isRefresh,
      {required String status}) {
    if (status == "Open") {
      if (isRefresh) {
        admissions.add(admission);
      } else {
        var admissionList = admission;
        var currentData = admissions.value;
        admissions.add(currentData + admissionList);
      }
    } else {
      if (isRefresh) {
        closedAdmissions.add(admission);
      } else {
        var admissionList = admission;
        var currentData = closedAdmissions.value;
        closedAdmissions.add(currentData + admissionList);
      }
    }
  }

  @override
  void dispose() {
    _getAdmissionListResponse.close();
    _getClosedAdmissionListResponse.close();
    closedAdmissions.value.clear();
    admissions.value.clear();
    super.dispose();
  }
}
