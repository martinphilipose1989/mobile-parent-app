import 'package:app/feature/payments/payment_history_fees_type/payment_history_fees_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/payment_history/payment_history_fees_type_expansion.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentHistoryFeesView
    extends BasePageViewWidget<PaymentHistoryFeesModel> {
  PaymentHistoryFeesView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryFeesModel model) {
    return AppStreamBuilder<Resource<GetPendingFeesModel>>(
      stream: model.getPendingFeesModel,
      initialData: Resource.none(),
      dataBuilder: (context, data) {
        return data!.status == Status.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PaymentHistoryFeesTypeExpansion(
                groupedModels: model.groupedModels);
      },
    );
  }
}
