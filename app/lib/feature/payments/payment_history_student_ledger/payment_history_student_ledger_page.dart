import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payment_history_student_ledger/payment_history_page_student_ledger_view.dart';
import 'package:app/feature/payments/payment_history_student_ledger/payment_history_student_ledger_model.dart';
import 'package:app/feature/payments/payment_history_transaction_type/payment_history_page_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryStudentLedgerPage
    extends BasePage<PaymentHistoryStudentLedgerModel> {
  const PaymentHistoryStudentLedgerPage({super.key});

  @override
  PaymentsHistoryPageState createState() => PaymentsHistoryPageState();
}

class PaymentsHistoryPageState extends AppBasePageState<
    PaymentHistoryStudentLedgerModel, PaymentHistoryStudentLedgerPage> {
  @override
  Widget buildView(
      BuildContext context, PaymentHistoryStudentLedgerModel model) {
    return PaymentHistoryPageStudentLedgerView(provideBase());
  }

  @override
  ProviderBase<PaymentHistoryStudentLedgerModel> provideBase() {
    return paymentHistoryStudentLedgerProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(PaymentHistoryStudentLedgerModel model) {
    model.getStudentLedger();
  }
}