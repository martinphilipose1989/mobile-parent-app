import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/feature/payments/payment_history/payment_history_page_view.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryPage extends BasePage<PaymentHistoryModel> {
  const PaymentHistoryPage({super.key, this.paymentArguments});
  final PaymentArguments? paymentArguments;

  @override
  PaymentsHistoryPageState createState() => PaymentsHistoryPageState();
}

class PaymentsHistoryPageState
    extends AppBasePageState<PaymentHistoryModel, PaymentHistoryPage> {
  @override
  Widget buildView(BuildContext context, PaymentHistoryModel model) {
    return SingleChildScrollView(
        child: PaymentsHistoryView(
      provideBase(),
    ));
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
    if ((widget.paymentArguments?.enquiryId?.isEmpty) ??
        false || widget.paymentArguments?.enquiryId == null) {
      model.selectedStudent = ProviderScope.containerOf(context)
          .read(dashboardViewModelProvider)
          .selectedStudentId;
      if (model.selectedStudent != null) {
        List<int> temp = [];
        for (var selectedStudent in model.selectedStudent!) {
          temp.add(selectedStudent.id!);
        }
        model.studentIDs = temp;
      }

      model.getAcademicYear();
    } else {
      model.phoneNo = widget.paymentArguments?.phoneNo.isEmpty ?? false
          ? 0
          : int.parse(widget.paymentArguments?.phoneNo ?? '');
      model.paymentArguments = widget.paymentArguments;
      model.updateStudentDetailsForEnquiry(widget.paymentArguments!);
    }
  }
}
