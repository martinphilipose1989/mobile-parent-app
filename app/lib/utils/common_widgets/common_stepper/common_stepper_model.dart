import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonStepperModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CommonStepperModel(this.exceptionHandlerBinder);

  BehaviorSubject<int> activeIndex = BehaviorSubject<int>.seeded(1);
}
