import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payment_history_fees_type/payment_history_fees_model.dart';
import 'package:app/feature/payments/payment_history_fees_type/payment_history_page_fees_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryFeesPage extends BasePage<PaymentHistoryFeesModel> {
  const PaymentHistoryFeesPage({super.key});

  @override
  PaymentsHistoryPageState createState() => PaymentsHistoryPageState();
}

class PaymentsHistoryPageState
    extends AppBasePageState<PaymentHistoryFeesModel, PaymentHistoryFeesPage> {
  @override
  Widget buildView(BuildContext context, PaymentHistoryFeesModel model) {
    return PaymentHistoryFeesView(provideBase());
  }

  @override
  ProviderBase<PaymentHistoryFeesModel> provideBase() {
    return paymentHistoryFeesProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(PaymentHistoryFeesModel model) {
    model.getFeesType();
  }
}
