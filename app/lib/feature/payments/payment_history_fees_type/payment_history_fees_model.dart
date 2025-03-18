// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryFeesModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  PaymentHistoryFeesModel(
    this.exceptionHandlerBinder,
  );

  late PaymentHistoryModel paymentHistoryModel;
}
