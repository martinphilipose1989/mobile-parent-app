// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class PaymentDetailScreen extends StatelessWidget {
  final GetPendingFeesFeeModel fee;
  const PaymentDetailScreen({
    super.key,
    required this.fee,
  });

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: fee.feeId != null
                          ? fee.feeDisplayName
                          : fee.instrumentNumber,
                      style: AppTypography.subtitle2,
                    ),
                    CommonText(
                      text: DateFormatter.formatDate(fee.createdOn ?? ''),
                      style: AppTypography.caption,
                    ),
                  ],
                ),
                CommonText(
                  text: CurrencyFormatter.formatToRupee(fee.amount ?? ''),
                  style: AppTypography.subtitle2.copyWith(
                      color: fee.feeId != null
                          ? AppColors.failure
                          : AppColors.success),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: fee.feeId != null
                  ? [
                      buildDetailRow('Fees Type', fee.feeType ?? ""),
                      buildDetailRow('Fees Sub Type', fee.feeSubType ?? ""),
                      buildDetailRow(
                          'Fees Category',
                          fee.feeCategory == null
                              ? 'NA'
                              : fee.feeCategory ?? ""),
                      buildDetailRow(
                          'Fees Sub Category',
                          fee.feeSubCategory == null
                              ? 'NA'
                              : fee.feeSubCategory ?? ""),
                    ]
                  : [
                      buildDetailRow('Transaction ID', ''),
                      buildDetailRow('Transaction Date',
                          DateFormatter.formatDate(fee.createdOn ?? '')),
                      buildDetailRow('Payment Mode', fee.paymentMode ?? ""),
                      buildDetailRow(
                          'Fee Receipt Number', fee.instrumentNumber ?? ""),
                    ],
            )
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
