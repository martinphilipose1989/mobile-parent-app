import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        notShowNotificationAndUserBatch: true,
        appbarTitle: 'Payment Detail',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Payment UPI',
                      style: AppTypography.subtitle2,
                    ),
                    CommonText(
                      text: '12 June 2024',
                      style: AppTypography.caption,
                    ),
                  ],
                ),
                CommonText(
                  text: '₹ 1,30,000',
                  style: AppTypography.subtitle2
                      .copyWith(color: AppColors.success),
                ),
              ],
            ),
            Divider(),
            buildDetailRow('Fees Type', 'Consolidated Fees'),
            buildDetailRow('Fees Sub Type', 'Instalment 1'),
            buildDetailRow('Fees Category', 'NA'),
            buildDetailRow('Fees Sub Category', 'NA'),
            buildDetailRow('Transaction ID', '#38925497235'),
            buildDetailRow('Transaction Date', '03/06/2024'),
            buildDetailRow('Payment Mode', 'UPI'),
            buildDetailRow('Fee Receipt Number', '#6374-23574852-23567'),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            style: AppTypography.body2,
          ),
          CommonText(
            text: value,
            style: AppTypography.body2.copyWith(color: AppColors.textLightGray),
          ),
        ],
      ),
    );
  }
}
