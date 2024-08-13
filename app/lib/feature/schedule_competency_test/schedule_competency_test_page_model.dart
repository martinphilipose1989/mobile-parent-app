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
  final GetCompetencyTestSlotsUsecase getCompetencyTestSlotsUsecase;
  CompetencyTestModel(this.exceptionHandlerBinder,this.createCompetencyTestUsecase,this.getCompetencyTestSlotsUsecase);

  String selectedTime = "";

  String selectedDate = "";

  String selectedMode = "";

  String slot_id = "";

  DateFormat dateFormat = DateFormat('d MMMM yyyy');

  List<String> testMode = ["Online","Offline"];

  final BehaviorSubject<String> selectedModeSubject = BehaviorSubject<String>.seeded('online');

  final PublishSubject<Resource<CompetencyTestDetails>> competencyTestDetails= PublishSubject();

  final _dateSubject = BehaviorSubject<String>();
  final _timeSlotsSubject = BehaviorSubject<List<SlotsDetail>>();
  String enquiryID = "";

  Stream<List<SlotsDetail>> get timeSlots => _timeSlotsSubject.stream;

  

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
        _timeSlotsSubject.add(result.data?.data??[]);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> scheduleCompetencyTest({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      CompetencyTestCreationRequest request = CompetencyTestCreationRequest(
        competencyTestDate: selectedDate,
        slotId: slot_id,
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
        competencyTestDetails.add(Resource.success(data: result.data?.data));
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
    _dateSubject.add(date);
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
    else if (selectedTime.isEmpty) {
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
