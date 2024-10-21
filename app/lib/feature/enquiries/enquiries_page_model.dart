import 'dart:async';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
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
  List<EnquiryListDetailModel> currentEnquiries = [];

  String phoneNumber = '';
  late TabController controller;
  BehaviorSubject<int> selectedTab = BehaviorSubject<int>.seeded(0);

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

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> setPhoneNumber() async{
    phoneNumber = await SharedPreferenceHelper.getString(mobileNumber);
  }

  // -------- Get Equiry List Usecase -------- //
  BehaviorSubject<List<BehaviorSubject<EnquiryListDetailModel>>> enquiries = BehaviorSubject.seeded([]);
  final BehaviorSubject<Resource<EnquiryListModel>> _getEnquiryResponse = BehaviorSubject();

  Stream<Resource<EnquiryListModel>> get getEnquiryResponseStream => _getEnquiryResponse.stream;


  Future<void> fetchEnquiries({bool isRefresh = false}) async{
    exceptionHandlerBinder.handle(block: () async {
      if(isRefresh){
        pageNumber = 1;
      }
      if(!isNextPage){
        return;
      }
      await setPhoneNumber();
      GetEnquiryListUsecaseParams params = GetEnquiryListUsecaseParams(
        phone: phoneNumber,
        pageNumber: pageNumber,
        pageSize: pageSize
      );
      if(pageNumber > 1){
        isLoading.value = true;
      }
      RequestManager<EnquiryListModel>(
        params,
        createCall: () => getEnquiryListUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((event) {
        if(event.status == Status.loading){
          if(pageNumber == 1 && !isRefresh){
            _getEnquiryResponse.add(event);
          }
        }
        if(event.status == Status.success){
          if(isLoading.value){
            isLoading.value = false;
          }
          _getEnquiryResponse.add(event);
          _handleEnquiryListing(event.data?.data?.data??[],isRefresh);
          isNextPage = event.data?.data?.isNextPage??false;
        }
        if(event.status == Status.error){
          if(pageNumber == 1){
            _getEnquiryResponse.add(event);
          }
          else{
            if(isNextPage){
              isNextPage = false;
              _getEnquiryResponse.add(event);
            }
          }
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  void _handleEnquiryListing(List<EnquiryListDetailModel> enquiry,bool isRefresh){
    List<BehaviorSubject<EnquiryListDetailModel>> enquiryList = enquiry.map((element){
      return BehaviorSubject.seeded(element);
    }).toList();
    if(isRefresh){
      enquiries.add(enquiryList);
    }
    else{
      var currentData = enquiries.value;
      enquiries.add(currentData + enquiryList);
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

  @override
  void dispose() {
    _getEnquiryResponse.close();
    enquiries.value.clear();
    super.dispose();
  }
}
