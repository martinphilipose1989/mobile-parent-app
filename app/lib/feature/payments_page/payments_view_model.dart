import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentsPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  PaymentsPageModel(this.exceptionHandlerBinder);

  final BehaviorSubject<String> selectedPaymentType =
      BehaviorSubject<String>.seeded('');

  final BehaviorSubject<bool> selectedChequeType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  final List<String> chequeTypes = [
    'Current Dated Cheque',
    'Post Dated Cheque',
    'Demand Draft'
  ];

  final List<String> feesType = [
    'Registration Fees',
    'Admission Fees',
    'Consolidated Fees',
    'Transport Fees'
  ];
}
