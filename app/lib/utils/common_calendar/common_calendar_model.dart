import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
@injectable
class CommonCalendarModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CommonCalendarModel(this.exceptionHandlerBinder);
  final BehaviorSubject<DateTime>selectedDate = BehaviorSubject<DateTime>.seeded(DateTime.now());
  final DateFormat dayFormat = DateFormat('EEE');
  final DateFormat dateFormat = DateFormat('dd');
  final DateFormat monthFormat = DateFormat('MMM');

  List<DateTime> nextSevenDays = List.generate(8, (index) {
    return DateTime.now().add(Duration(days: index));
  });

}
