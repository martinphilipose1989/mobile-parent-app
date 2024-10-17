import 'package:flutter_errors/flutter_errors.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AttendanceDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  AttendanceDetailsViewModel(this.exceptionHandlerBinder);
}