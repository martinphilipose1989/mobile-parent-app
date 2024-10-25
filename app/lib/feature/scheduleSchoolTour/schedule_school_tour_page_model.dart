import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
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
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  ScheduleSchoolTourPageModel(this.exceptionHandlerBinder,this.createSchoolVisitUseCase,this.getSchoolVisitSlotsUseCase,this.rescheduleSchoolVisitUseCase,this.flutterToastErrorPresenter);
  
  final BehaviorSubject<List<SlotsDetail>> schoolVisitTimeSlots = BehaviorSubject<List<SlotsDetail>>.seeded([]);

  final formKey = GlobalKey<FormState>();
  final dateSubject = BehaviorSubject<String>();
  String enquiryID = "";
  bool isReschedule = false;
  SchoolVisitDetail? schoolVisitDetails;
  TextEditingController commentController = TextEditingController();
  BuildContext? context;

  String slotId = "";

  final BehaviorSubject<int> selectedTimeIndex = BehaviorSubject<int>.seeded(0);

  String selectedTime = '';

  String selectedDate = "";

  DateFormat dateFormat = DateFormat('d MMM yyyy');
  DateFormat dateFormat1 = DateFormat('yyyy-MM-dd');

  PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
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
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
        }
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
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
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
            slotId = result.data?.data?[0].id ?? '';
            selectedTime = result.data?.data?[0].slot ?? '';
          }
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

  void setSelectedTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    notifyListeners();
  }

  String validateForm() {    
    if (selectedDate.isEmpty) {
      return 'Please select date';
    }
    else if (slotId.isEmpty) {
      return "Please select time";
    }
    else {
      return "";
    }
  }
}
