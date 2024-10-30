import 'dart:async';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesAdmissionsJourneyViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionJourneyUsecase getAdmissionJourneyUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final EnquiryDetailArgs enquiryDetailArgs;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  EnquiriesAdmissionsJourneyViewModel(this.exceptionHandlerBinder,this.getAdmissionJourneyUsecase,this.getEnquiryDetailUseCase,this.enquiryDetailArgs,this.flutterToastErrorPresenter){
    getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
    getAdmissionJourney(
        enquiryID: enquiryDetailArgs.enquiryId ?? '', type: 'enquiry');
  }
  final PublishSubject<Resource<List<AdmissionJourneyDetail>>> admissionJourney = PublishSubject();
  final PublishSubject <Resource<AdmissionJourneyBase>> _fetchAdmissionJourney = PublishSubject();
  Stream<Resource<AdmissionJourneyBase>> get fetchAdmissionJourney => _fetchAdmissionJourney.stream;

  final PublishSubject <Resource<EnquiryDetailBase>> _fetchEnquiryDetail = PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail  => _fetchEnquiryDetail.stream;

  final BehaviorSubject<Resource<EnquiryListModel>> _getEnquiryResponse = BehaviorSubject();
  final BehaviorSubject<Resource<EnquiryListModel>> _getClosedEnquiryResponse = BehaviorSubject();
  int pageNumber = 1, pageSize = 10;
  int closedEnquiryPageNumber = 1, closedEnquiryPageSize = 10;

  bool isNextPage = true;
  bool closedEnquiryNextPage = true;

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  Stream<Resource<EnquiryListModel>> get getEnquiryResponseStream => _getEnquiryResponse.stream;
  Stream<Resource<EnquiryListModel>> get getClosedEnquiryResponseStream => _getClosedEnquiryResponse.stream;

  //
  // Future<void> fetchEnquiries({bool isRefresh = false}) async{
  //   exceptionHandlerBinder.handle(block: () async {
  //     if(isRefresh){
  //       pageNumber = 1;
  //     }
  //     if(!isNextPage){
  //       return;
  //     }
  //     await setPhoneNumber();
  //     GetEnquiryListUsecaseParams params = GetEnquiryListUsecaseParams(
  //         phone: phoneNumber,
  //         pageNumber: pageNumber,
  //         pageSize: pageSize,
  //         status: "Open"
  //     );
  //     if(pageNumber > 1){
  //       isLoading.value = true;
  //     }
  //     RequestManager<EnquiryListModel>(
  //       params,
  //       createCall: () => getEnquiryListUsecase.execute(
  //         params: params,
  //       ),
  //     ).asFlow().listen((event) {
  //       if(event.status == Status.loading){
  //         if(pageNumber == 1 && !isRefresh){
  //           _getEnquiryResponse.add(event);
  //         }
  //       }
  //       if(event.status == Status.success){
  //         if(isLoading.value){
  //           isLoading.value = false;
  //         }
  //         _getEnquiryResponse.add(event);
  //         _handleEnquiryListing(event.data?.data?.data??[],isRefresh);
  //         isNextPage = event.data?.data?.isNextPage??false;
  //       }
  //       if(event.status == Status.error){
  //         if(pageNumber == 1){
  //           _getEnquiryResponse.add(event);
  //         }
  //         else{
  //           if(isNextPage){
  //             isNextPage = false;
  //             _getEnquiryResponse.add(event);
  //           }
  //         }
  //       }
  //     }).onError((error) {
  //       isLoading.value = false;
  //       exceptionHandlerBinder.showError(error!);
  //     });
  //   }).execute();
  // }
  //
  // Future<void> fetchClosedEnquiries({bool isRefresh = false}) async{
  //   exceptionHandlerBinder.handle(block: () async {
  //     if(isRefresh){
  //       pageNumber = 1;
  //     }
  //     if(!closedEnquiryNextPage){
  //       return;
  //     }
  //     await setPhoneNumber();
  //     GetEnquiryListUsecaseParams params = GetEnquiryListUsecaseParams(
  //         phone: phoneNumber,
  //         pageNumber: closedEnquiryPageNumber,
  //         pageSize: closedEnquiryPageSize,
  //         status: "Closed"
  //     );
  //     if(closedEnquiryPageNumber > 1){
  //       isLoading.value = true;
  //     }
  //     RequestManager<EnquiryListModel>(
  //       params,
  //       createCall: () => getEnquiryListUsecase.execute(
  //         params: params,
  //       ),
  //     ).asFlow().listen((event) {
  //       if(event.status == Status.loading){
  //         if(closedEnquiryPageNumber == 1 && !isRefresh){
  //           _getClosedEnquiryResponse.add(event);
  //         }
  //       }
  //       if(event.status == Status.success){
  //         if(isLoading.value){
  //           isLoading.value = false;
  //         }
  //         _getClosedEnquiryResponse.add(event);
  //         _handleEnquiryListing(event.data?.data?.data??[],isRefresh,enquiryType: "Closed");
  //         closedEnquiryNextPage = event.data?.data?.isNextPage??false;
  //       }
  //       if(event.status == Status.error){
  //         if(closedEnquiryPageNumber == 1){
  //           _getClosedEnquiryResponse.add(event);
  //         }
  //         else{
  //           if(closedEnquiryNextPage){
  //             closedEnquiryNextPage = false;
  //             _getClosedEnquiryResponse.add(event);
  //           }
  //         }
  //       }
  //     }).onError((error) {
  //       isLoading.value = false;
  //       exceptionHandlerBinder.showError(error!);
  //     });
  //   }).execute();
  // }
  EnquiryDetail? enquiryDetail;
  String? enquiryId;

  Future<void> getAdmissionJourney({required String enquiryID,required String type}) async {
    exceptionHandlerBinder.handle(block: () {
      
      GetAdmissionJourneyUsecaseParams params = GetAdmissionJourneyUsecaseParams(
        enquiryID: enquiryID,
        type: type
      );
      admissionJourney.add(Resource.loading());
      RequestManager<AdmissionJourneyBase>(
        params,
        createCall: () => getAdmissionJourneyUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchAdmissionJourney.add(result);
        if(result.status == Status.success){
          admissionJourney.add(Resource.success(data: result.data?.data??[]));
        }
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getEnquiryDetail({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      
      GetEnquiryDetailUseCaseParams params = GetEnquiryDetailUseCaseParams(
        enquiryID: enquiryID,
      );


      RequestManager<EnquiryDetailBase>(
        params,
        createCall: () => getEnquiryDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchEnquiryDetail.add(result);
        if(result.status == Status.success){
          enquiryDetail = result.data?.data;
        }
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetail?.enquiryStage
        ?.firstWhere(
          (element) => element.stageName?.toLowerCase().contains('school visit') ?? false,
          orElse: () => EnquiryStage(),
        );
  }

  bool isDetailView() {
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status?.toLowerCase() == "in progress";
  }

  bool isDetailViewCompetency(){
    return enquiryDetail?.enquiryStage?.firstWhere((element)=>element.stageName == "Competency test").status?.toLowerCase() == "in Progress";
  }

  final List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false},
    {'name': 'Parent Info', 'isSelected': false},
    {'name': 'Contact Info', 'isSelected': false},
    {'name': 'Medical Details', 'isSelected': false},
    {'name': 'Bank Details', 'isSelected': false},
    {'name': 'Upload Docs', 'isSelected': false}
  ];

  final List stepperData = [
    {'name': 'New Enquiry', 'subtitle': ""},
    {
      'name': 'School Visit',
      'subtitle': "School Visit scheduled on 18th July 10:30 AM"
    },
    {'name': 'Registration', 'subtitle': ""},
  ];

  final List menuData = [
    {'image': AppImages.registrationIcon, 'name': "Registration"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> activeStep = BehaviorSubject<int>.seeded(1);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);
}
