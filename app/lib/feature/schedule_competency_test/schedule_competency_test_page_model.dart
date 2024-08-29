import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class CompetencyTestModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateCompetencyTestUsecase createCompetencyTestUsecase;
  final RescheduleCompetencyTestUseCase rescheduleCompetencyTestUseCase;
  final GetCompetencyTestSlotsUsecase getCompetencyTestSlotsUsecase;
  CompetencyTestModel(this.exceptionHandlerBinder,this.createCompetencyTestUsecase,this.getCompetencyTestSlotsUsecase,this.rescheduleCompetencyTestUseCase);

  String selectedTime = "";

  String selectedDate = "";

  String selectedMode = "";

  String slotID = "";

  DateFormat dateFormat = DateFormat('d MMMM yyyy');

  List<String> testMode = ["Online","Offline"];

  final BehaviorSubject<String> selectedModeSubject = BehaviorSubject<String>.seeded('Online');

  final PublishSubject<Resource<CompetencyTestDetails>> competencyTestDetails= PublishSubject();
  final PublishSubject<Resource<CompetencyTestDetailBase>> _createCompetencyTest = PublishSubject();
  Stream<Resource<CompetencyTestDetailBase>> get createCompetencyTest => _createCompetencyTest.stream;

  final BehaviorSubject<int> selectedTimeIndex = BehaviorSubject<int>.seeded(0);

  final competenctTestSlots = BehaviorSubject<List<SlotsDetail>>();
  String enquiryID = "";

  final PublishSubject<Resource<Slots>> _timeSlots = PublishSubject();
  Stream<Resource<Slots>> get timeSlots => _timeSlots.stream;
  
    void getDefaultDate(){
    selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  Future<void> fetchTimeSlots(String date,String enquiryID) async {
    exceptionHandlerBinder.handle(block: () {
      GetCompetencyTestSlotsUsecaseParams params = GetCompetencyTestSlotsUsecaseParams(
        enquiryID: enquiryID,
        date: date,
      );
      RequestManager<Slots>(
        params,
        createCall: () => getCompetencyTestSlotsUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _timeSlots.add(result);
        if(result.status == Status.success){
          competenctTestSlots.add(result.data?.data??[]);
          if((result.data?.data??[]).isNotEmpty){
            slotID = result.data?.data?[0].id??'';
            selectedTime = result.data?.data?[0].slot??'';
          }
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> scheduleCompetencyTest({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      CompetencyTestCreationRequest request = CompetencyTestCreationRequest(
        competencyTestDate: selectedDate,
        slotId: slotID,
        mode: selectedMode,
        createdBy: 0
      );
      CreateCompetencyTestUsecaseParams params = CreateCompetencyTestUsecaseParams(
        competencyTestCreationRequest: request,
        enquiryID: enquiryID
      );
      competencyTestDetails.add(Resource.loading());
      RequestManager<CompetencyTestDetailBase>(
        params,
        createCall: () => createCompetencyTestUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _createCompetencyTest.add(result);
        if(result.status == Status.success){
          competencyTestDetails.add(Resource.success(data: result.data?.data));
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> rescheduleCompetencyTest({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      CompetencyTestCreationRequest request = CompetencyTestCreationRequest(
        competencyTestDate: selectedDate,
        slotId: slotID,
        mode: selectedMode,
        createdBy: 0
      );
      RescheduleCompetencyTestUseCaseParams params = RescheduleCompetencyTestUseCaseParams(
        competencyTestCreationRequest: request,
        enquiryID: enquiryID
      );
      competencyTestDetails.add(Resource.loading());
      RequestManager<CompetencyTestDetailBase>(
        params,
        createCall: () => rescheduleCompetencyTestUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _createCompetencyTest.add(result);
        if(result.status == Status.success){
          competencyTestDetails.add(Resource.success(data: result.data?.data));
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

  void setSelectedMode(String mode) {
    selectedMode = mode;
    selectedModeSubject.add(mode);
  }

  bool validateForm() {
    if (selectedDate.isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please select date."));
      return false;
    }
    else if (slotID.isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please select time."));
      return false;
    }
    else if (selectedMode.isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please select test mode."));
      return false;
    }
    else {
      return true;
    }
  }
}
