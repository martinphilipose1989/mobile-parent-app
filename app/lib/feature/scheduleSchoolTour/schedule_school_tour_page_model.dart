import 'dart:developer';

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class ScheduleSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateSchoolVisitUseCase createSchoolVisitUseCase;
  final RescheduleSchoolVisitUseCase rescheduleSchoolVisitUseCase;
  final GetSchoolVisitSlotsUsecase getSchoolVisitSlotsUseCase;
  ScheduleSchoolTourPageModel(this.exceptionHandlerBinder,this.createSchoolVisitUseCase,this.getSchoolVisitSlotsUseCase,this.rescheduleSchoolVisitUseCase);
  
  final BehaviorSubject<List<SlotsDetail>> schoolVisitTimeSlots = BehaviorSubject<List<SlotsDetail>>.seeded([]);

  final dateSubject = BehaviorSubject<String>();
  String enquiryID = "";
  TextEditingController commentController = TextEditingController();

  String slotId = "";

  final BehaviorSubject<int> selectedTimeIndex = BehaviorSubject<int>.seeded(0);

  String selectedTime = '';

  String selectedDate = "";

  DateFormat dateFormat = DateFormat('d MMMM yyyy');
  DateFormat dateFormat1 = DateFormat('yyyy-MM-dd');

  final PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
  final PublishSubject<Resource<Slots>> _timeSlots = PublishSubject();
  Stream<Resource<Slots>> get timeSlots => _timeSlots.stream;
  final PublishSubject<Resource<SchoolVisitDetailBase>> _scheduleSchoolVisit = PublishSubject();
  Stream<Resource<SchoolVisitDetailBase>> get scheduleSchoolVisit => _scheduleSchoolVisit.stream;
  void getDefaultDate(){
    selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  Future<void> scheduleSchoolTour({required String enquiryID,required String slotid, required String Date}) async {
    exceptionHandlerBinder.handle(block: () {
      SchoolCreationRequest request = SchoolCreationRequest(
        schoolVisitDate: selectedDate,
        slotId: slotId,
        comment: commentController.text,
      );
      CreateSchoolVisitUseCaseParams params = CreateSchoolVisitUseCaseParams(
        schoolCreationRequest: request,
        enquiryID: enquiryID,
      );
      schoolVisitDetail.add(Resource.loading());
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => createSchoolVisitUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _scheduleSchoolVisit.add(result);
        if(result.status == Status.success){
          schoolVisitDetail.add(Resource.success(data: result.data?.data));
        }
      }).onError((error) {
        log("${error.runtimeType}");
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> rescheduleSchoolTour({required String enquiryID,required String slotid, required String Date}) async {
    exceptionHandlerBinder.handle(block: () {
      RescheduleSchoolVisitRequest request = RescheduleSchoolVisitRequest(
        schoolVisitDate: selectedDate,
        slotId: slotId,
        comment: commentController.text,
      );
      RescheduleSchoolVisitUseCaseParams params = RescheduleSchoolVisitUseCaseParams(
        schoolCreationRequest: request,
        enquiryID: enquiryID,
      );
      schoolVisitDetail.add(Resource.loading());
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => rescheduleSchoolVisitUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _scheduleSchoolVisit.add(result);
        if(result.status == Status.success){
          schoolVisitDetail.add(Resource.success(data: result.data?.data));
        }

      }).onError((error) {
        exceptionHandlerBinder.showError(error!);

      });
    }).execute();
  }

  Future<void> fetchTimeSlotsSchoolVisit(String date,String enquiryID) async {
    exceptionHandlerBinder.handle(block: () {
      GetSchoolVisitSlotsUsecaseParams params = GetSchoolVisitSlotsUsecaseParams(
        enquiryID: enquiryID,
        date: date,
      );
      RequestManager<Slots>(
        params,
        createCall: () => getSchoolVisitSlotsUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _timeSlots.add(result);
        if(result.status == Status.success){
          schoolVisitTimeSlots.add(result.data?.data??[]);
          if((result.data?.data??[]).isNotEmpty){
            slotId = result.data?.data?[0].id??'';
            selectedTime = result.data?.data?[0].slot??'';
          }
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  void setSelectedTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    notifyListeners();
  }

  bool validateForm() {
    if (selectedDate.isEmpty) {
      exceptionHandlerBinder.showError(
        AppError(
          type: ErrorType.uiEmptyField,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please select date'),
        ),
      );
      return false;
    }
    else if (slotId.isEmpty) {

      exceptionHandlerBinder.showError(
        AppError(
          type: ErrorType.uiEmptyField,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please select time.'),
        ),
      );
      return false;
    }
    else if (commentController.text.isEmpty) {
      exceptionHandlerBinder.showError(
        AppError(
          type: ErrorType.uiEmptyField,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please enter comment.'),
        ),
      );
      return false;
    }
    else {
      return true;
    }
  }
}
