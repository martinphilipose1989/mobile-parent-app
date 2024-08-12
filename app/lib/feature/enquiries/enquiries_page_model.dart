import 'package:app/dependencies.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  EnquiriesPageModel(this.exceptionHandlerBinder);

  final BehaviorSubject<String> selectedPaymentType =
  BehaviorSubject<String>.seeded('');

  final BehaviorSubject<bool> selectedChequeType =
  BehaviorSubject<bool>.seeded(false);

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
          fetchEnquiries();
        }
      }
    });
  }

  int pageNumber = 1, pageSize = 10;

  bool isNextPage = true;

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  final BehaviorSubject<List<EnquiryListDetailModel>> enquiryList = BehaviorSubject<List<EnquiryListDetailModel>>.seeded([]);

  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(true);

  Future<void> fetchEnquiries({bool isRefresh = false}) async {
    try {
      if (isRefresh){
        pageNumber = 1;
      }
      final result = await getIt.get<GetEnquiryListUsecase>().execute(params: GetEnquiryListUsecaseParams(phone: '+919002838487', pageNumber: pageNumber, pageSize: pageSize));
      isLoading.add(false);
      if(isRefresh){
        enquiryList.add(result.fold((l)=> [], (r)=> r.data?.data??[]));
      } else{
        result.fold(
          (l) => enquiryList.add([]),
          (r) {
            final newValue = r.data?.data ?? [];
            final currentValue = enquiryList.value;
            enquiryList.add(currentValue + newValue);
          },
        );
      }
      EnquiryListBaseModel? response = result.fold((l){ exceptionHandlerBinder.showError(l);  return null;}, (r){
        return r.data;
      });
      isNextPage = response?.isNextPage ?? false;
      
    } catch (stackTrace) {
      // exceptionHandlerBinder.showError(stackTrace);
      isLoading.add(false);
    }
  }

  final List<String> chequeTypes = [
    'Current Dated Cheque',
    'Post Dated Cheque',
    'Demand Draft'
  ];

  final List<String> feesType = [
    'Registration Fees',
    'Admission Fees',
    'Consolidated Fees',
    'Transport Fees'
  ];
}
