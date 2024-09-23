import 'package:app/model/resource.dart';
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
  AdmissionsViewModel(this.exceptionHandlerBinder, this.getAdmissionListUsecase);

  final ScrollController scrollController = ScrollController();

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(isLoading.value){
          return;
        }
        if (isNextPage) {
          pageNumber++;
          isLoading.add(true);
          fetchAdmissionList();
        }
      }
    });
  }

  int pageNumber = 1, pageSize = 10;

  bool isNextPage = true;

  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(true);

  BehaviorSubject<List<AdmissionListDetailModel>> admissions =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<Resource<AdmissionListBaseModel>> _getAdmissionListResponse =
      BehaviorSubject();

  Stream<Resource<AdmissionListBaseModel>> get getAdmissionListResponse =>
      _getAdmissionListResponse.stream;

  Future<void> fetchAdmissionList({bool isRefresh = false}) async{
    exceptionHandlerBinder.handle(block: () async {
      if (isRefresh) {
        pageNumber = 1;
      }
      if (!isNextPage) {
        return;
      }
      var phoneNumber = await SharedPreferenceHelper.getString(mobileNumber);
      GetAdmissionListUsecaseParams params = GetAdmissionListUsecaseParams(
          phone: phoneNumber, pageNumber: pageNumber, pageSize: pageSize);
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
          _handleAdmissionListing(event.data?.data?.data ?? [],isRefresh);
          isNextPage = event.data?.data?.isNextPage ?? false;
        }
        if (event.status == Status.error) {
          if (pageNumber == 1) {
            _getAdmissionListResponse.add(event);
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

  void _handleAdmissionListing(List<AdmissionListDetailModel> admission,bool isRefresh) {
    if(isRefresh){
      admissions.add(admission);
    }
    else{
      var admissionList = admission;
      var currentData = admissions.value;
      admissions.add(currentData + admissionList);
    }
  }

  @override
  void dispose() {
    _getAdmissionListResponse.close();
    admissions.value.clear();
    super.dispose();
  }
}
