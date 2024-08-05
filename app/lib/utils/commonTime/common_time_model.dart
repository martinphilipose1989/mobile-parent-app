import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
@injectable
class CommonTimeModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CommonTimeModel(this.exceptionHandlerBinder);
  final BehaviorSubject<int> selectedTime = BehaviorSubject<int>.seeded(0);

  final List<String> timeList = [
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
  ];

}
