import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history_fees_type/payment_history__fees_page.dart';
import 'package:app/feature/payments/payment_history_student_ledger/payment_history_student_ledger_page.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history__transaction_page.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SwitchViewPaymentHistory extends BasePageViewWidget<PaymentHistoryModel> {
  SwitchViewPaymentHistory(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryModel model) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: AppStreamBuilder<int>(
        stream: model.switchTabsPaymentHistory,
        initialData: model.switchTabsPaymentHistory.value,
        dataBuilder: (context, data) {
          return data == 0
              ? PaymentHistoryTransactionPage(paymentHistoryModel: model)
              : data == 1
                  ? PaymentHistoryFeesPage(paymentHistoryModel: model)
                  : PaymentHistoryStudentLedgerPage(paymentHistoryModel: model);
        },
      ),
    );
  }
}
