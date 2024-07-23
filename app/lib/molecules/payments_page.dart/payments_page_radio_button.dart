import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';

class PaymentsPageRadioButton extends StatelessWidget {
  const PaymentsPageRadioButton(
      {super.key,
      required this.value,
      required this.title,
      required this.model});

  final String value;
  final String title;
  final PaymentsPageModel model;

  @override
  Widget build(BuildContext context) {
    return buildPaymentMethodOption(
      model: model,
      value: value,
      title: title,
    );
  }

  Widget buildPaymentMethodOption(
      {required String title,
      required String value,
      bool isEnabled = true,
      required PaymentsPageModel model}) {
    return AppStreamBuilder<String>(
      stream: model.selectedPaymentType,
      initialData: model.selectedPaymentType.value,
      dataBuilder: (context, data) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Radio<String>(
            value: value,
            groupValue: data,
            onChanged: (value) {
              model.selectedPaymentType.add(value ?? "");
            },
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          title: CommonText(
              text: title,
              style: AppTypography.subtitle2.copyWith(
                color: data == model.selectedPaymentType.value
                    ? Colors.black
                    : Colors.grey,
              )),
        );
      },
    );
  }
}
