import 'package:app/feature/payments/payment_history_student_ledger/payment_history_student_ledger_model.dart';
import 'package:app/molecules/payment_history/payment_history_student_ledger_list.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryPageStudentLedgerView
    extends BasePageViewWidget<PaymentHistoryStudentLedgerModel> {
  PaymentHistoryPageStudentLedgerView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryStudentLedgerModel model) {
    return const PaymentHistoryStudentLedgerList();
  }
}
