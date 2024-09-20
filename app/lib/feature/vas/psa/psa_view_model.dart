import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PsaDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  PsaDetailViewModel(this.exceptionHandlerBinder);

  final cafeteriaOptions = ["Lunch", "Snacks", "Lunch & Snacks"];

  final terms = [
    "Term 1",
    "Term 2",
    "Full Year",
  ];

  
}
