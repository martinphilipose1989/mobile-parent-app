import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/molecules/payment_history/payment_history_transaction_type_expansion.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryTransactionView
    extends BasePageViewWidget<PaymentHistoryTransactionModel> {
  PaymentHistoryTransactionView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryTransactionModel model) {
    return const PaymentHistoryTransationTypeExpansion();
  }
}
