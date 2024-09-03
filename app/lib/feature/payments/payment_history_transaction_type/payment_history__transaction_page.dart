import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history_page_transaction_view.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryTransactionPage
    extends BasePage<PaymentHistoryTransactionModel> {
  final PaymentHistoryModel paymentHistoryModel;
  const PaymentHistoryTransactionPage(
      {super.key, required this.paymentHistoryModel});

  @override
  PaymentsHistoryPageState createState() => PaymentsHistoryPageState();
}

class PaymentsHistoryPageState extends AppBasePageState<
    PaymentHistoryTransactionModel, PaymentHistoryTransactionPage> {
  @override
  Widget buildView(BuildContext context, PaymentHistoryTransactionModel model) {
    return PaymentHistoryTransactionView(provideBase());
  }

  @override
  ProviderBase<PaymentHistoryTransactionModel> provideBase() {
    return paymentHistoryTransactionProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(PaymentHistoryTransactionModel model) {
    model.paymentHistoryModel = widget.paymentHistoryModel;
    if (ProviderScope.containerOf(context)
        .read(paymentHistoryProvider)
        .academicYearIds
        .isNotEmpty) {
      model.paymentHistoryModel.getFeesCollected();
    }
  }
}
