import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class TransportDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  TransportDetailViewModel(
    this.exceptionHandlerBinder
  );

  final busType = [
    "AC",
    "NON AC"
  ];

  final serviceType = [
    "One Way", "Two Way"
  ];

  final CommonRadioButton<String> radioButtonBusType =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonServiceType =
      CommonRadioButton<String>(null);
}