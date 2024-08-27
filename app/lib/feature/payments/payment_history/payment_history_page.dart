import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history/payment_history_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryPage extends BasePage<PaymentHistoryModel> {
  const PaymentHistoryPage({super.key});

  @override
  PaymentsHistoryPageState createState() => PaymentsHistoryPageState();
}

class PaymentsHistoryPageState
    extends AppBasePageState<PaymentHistoryModel, PaymentHistoryPage> {
  @override
  Widget buildView(BuildContext context, PaymentHistoryModel model) {
    return PaymentsHistoryView(provideBase());
  }

  @override
  ProviderBase<PaymentHistoryModel> provideBase() {
    return paymentHistoryProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(PaymentHistoryModel model) {
    model.getAcademicYear();
  }
}
