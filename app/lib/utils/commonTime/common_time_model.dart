import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
@injectable
class CommonTimeModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CommonTimeModel(this.exceptionHandlerBinder);
  final BehaviorSubject<int> selectedTime = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<List<SlotsDetail>> schoolVisitTimeSlots = BehaviorSubject<List<SlotsDetail>>.seeded([]);
  final BehaviorSubject<List<SlotsDetail>> competencyTestTimeSlots = BehaviorSubject<List<SlotsDetail>>.seeded([]);
  final List<String> timeList = [
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
  ];

// Future<void> fetchTimeSlotsCompetencyTest(String date,String enquiryID) async {
//   exceptionHandlerBinder.handle(block: () {
//     GetCompetencyTestSlotsUsecaseParams params = GetCompetencyTestSlotsUsecaseParams(
//       enquiryID: enquiryID,
//       date: date,
//     );
//     RequestManager<Slots>(
//       params,
//       createCall: () => _getCompetencyTestSlotsUseCase.execute(
//         params: params,
//       ),
//     ).asFlow().listen((result) {
//         competencyTestTimeSlots.add(result.data?.data??[]);
//     }).onError((error) {
//       exceptionHandlerBinder.showError(error!);
//     });
//   });
// }
  
}
