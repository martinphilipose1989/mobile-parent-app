import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetEnquiryListUsecase getEnquiryListUsecase;
  EnquiriesPageModel(this.exceptionHandlerBinder, this.getEnquiryListUsecase){
    setupScrollListener();
    fetchEnquiries();
  }

  final BehaviorSubject<String> selectedPaymentType =
  BehaviorSubject<String>.seeded('');

  final BehaviorSubject<bool> selectedChequeType =
  BehaviorSubject<bool>.seeded(false);

  final ScrollController scrollController = ScrollController();
  List<EnquiryListDetailModel> _currentEnquiries = [];

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(isLoading.value){
          return;
        }
        if (isNextPage) {
          pageNumber++;
          isLoading.value = true;
          fetchEnquiries();
        }
      }
    });
  }

  int pageNumber = 1, pageSize = 10;

  bool isNextPage = true;

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  final PublishSubject<Resource<List<EnquiryListDetailModel>>> enquiryList = PublishSubject();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> fetchEnquiries({bool isRefresh = false}) async {
    exceptionHandlerBinder.handle(block: () {
      if(isRefresh){
        pageNumber = 1;
      }
      GetEnquiryListUsecaseParams params = GetEnquiryListUsecaseParams(
        phone: '+919002838487',
        pageNumber: pageNumber,
        pageSize: pageSize
      );
      if(pageNumber == 1 && !isRefresh){
        enquiryList.add(Resource.loading());
      }
      RequestManager<EnquiryListModel>(
        params,
        createCall: () => getEnquiryListUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (isRefresh) {
          enquiryList.add(Resource.success(data: result.data?.data?.data??[]));
        } else {
          var newContent = result.data?.data?.data??[];
          _currentEnquiries = [..._currentEnquiries, ...newContent];
          enquiryList.add(Resource.success(data: _currentEnquiries));
        }
        isNextPage = result.data?.data?.isNextPage ?? false;
        isLoading.value = false;
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
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
