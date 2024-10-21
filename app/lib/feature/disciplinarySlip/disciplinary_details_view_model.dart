import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DisplinaryDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  DisplinaryDetailsViewModel(this.exceptionHandlerBinder);


  BehaviorSubject<bool> showExpansion =
  BehaviorSubject<bool>.seeded(false);
}