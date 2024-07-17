import 'package:app/feature/payments/payments_model.dart';
import 'package:app/molecules/payments/payment_history_fees_type_expansion.dart';
import 'package:app/molecules/payments/payment_history_student_ledger_list.dart';
import 'package:app/molecules/payments/payment_history_transaction_type_expansion.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SwitchViewPaymentHistory extends BasePageViewWidget<PaymentsModel> {
  SwitchViewPaymentHistory(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentsModel model) {
    // TODO: implement build
    return AppStreamBuilder<int>(
      stream: model.switchTabsPaymentHistory,
      initialData: model.switchTabsPaymentHistory.value,
      dataBuilder: (context, data) {
        return data == 0
            ? const PaymentHistoryTransationTypeExpansion()
            : data == 1
                ? const PaymentHistoryFeesTypeExpansion()
                : const PaymentHistoryStudentLedgerList();
      },
    );
  }
}
