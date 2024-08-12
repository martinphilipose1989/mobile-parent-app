import 'package:app/dependencies.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  AdmissionsViewModel(this.exceptionHandlerBinder);

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

  final BehaviorSubject<List<AdmissionListDetailModel>> admissionList = BehaviorSubject<List<AdmissionListDetailModel>>.seeded([]);

  Future<void> fetchAdmissionList({bool isRefresh = false}) async{
    try {
      if (isRefresh){
        pageNumber = 1;
      }
      final result = await getIt.get<GetAdmissionListUsecase>().execute(params: GetAdmissionListUsecaseParams(phone: '9937767311', pageNumber: pageNumber, pageSize: pageSize));
      isLoading.add(false);
      if(isRefresh){
        admissionList.add(result.fold((l)=> [], (r)=> r.data?.data??[]));
      } else{
        result.fold(
          (l) => admissionList.add([]),
          (r) {
            final newValue = r.data?.data ?? [];
            final currentValue = admissionList.value;
            admissionList.add(currentValue + newValue);
          },
        );
      }
      AdmissionListBaseModel? response = result.fold((l){ exceptionHandlerBinder.showError(l);  return null;}, (r){
        return r;
      });
      isNextPage = response!.data?.isNextPage ?? false;
      
    } catch (stackTrace) {
      // exceptionHandlerBinder.showError(stackTrace);
      isLoading.add(false);
    }
  }

}
