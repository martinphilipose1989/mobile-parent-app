import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class CafeteriaDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CafeteriaDetailViewModel(
    this.exceptionHandlerBinder
  );

  final cafeteriaOptions = [
    "Lunch",
    "Snacks",
    "Lunch & Snacks"
  ];

  final terms = [
    "Term 1",
    "Term 2",
    "Full Year",
  ];

  final CommonRadioButton<String> radioButtonFeeOption =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonTerm =
      CommonRadioButton<String>(null);
}