import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/payment_history/payment_history_transaction_type_expansion.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryTransactionView
    extends BasePageViewWidget<PaymentHistoryTransactionModel> {
  PaymentHistoryTransactionView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryTransactionModel model) {
    return AppStreamBuilder<Resource<GetTransactiontypefeesCollectedModel>>(
      stream: model.paymentHistoryModel.getTransactiontypefeesCollectedModel,
      initialData: Resource.none(),
      dataBuilder: (context, data) {
        return data!.status == Status.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PaymentHistoryTransationTypeExpansion(
                transactions: data.data?.data?.transactions ?? [],
                model: model,
              );
      },
    );
  }
}
