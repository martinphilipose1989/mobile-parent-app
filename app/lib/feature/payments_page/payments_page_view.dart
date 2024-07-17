import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/molecules/payments_page.dart/payments_page_radio_button.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentsPageView extends BasePageViewWidget<PaymentsPageModel> {
  PaymentsPageView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentsPageModel model) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CommonSizedBox.sizedBox(height: 20, width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(
                  text: 'Alerady Have A Coupon?',
                  style: AppTypography.subtitle2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutePaths.couponList);
                  },
                  child: CommonText(
                    text: 'Apply Now',
                    style: AppTypography.subtitle2
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
            CommonSizedBox.sizedBox(height: 20, width: 10),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'Consplidated',
                              style: AppTypography.subtitle2,
                            ),
                            CommonText(
                              text: 'Installment 1',
                              style: AppTypography.caption,
                            ),
                          ],
                        ),
                        CommonText(
                          text: '₹ 70,000',
                          style: AppTypography.subtitle2
                              .copyWith(color: AppColors.success),
                        ),
                      ],
                    ),
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'Consplidated',
                              style: AppTypography.subtitle2,
                            ),
                            CommonText(
                              text: 'Installment 1',
                              style: AppTypography.caption,
                            ),
                          ],
                        ),
                        CommonText(
                          text: '₹ 10,000',
                          style: AppTypography.subtitle2
                              .copyWith(color: AppColors.success),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CommonSizedBox.sizedBox(height: 20, width: 10),
            const CommonText(
              text: 'Select payment Method',
              style: AppTypography.body2,
            ),
            PaymentsPageRadioButton(
              model: model,
              title: 'Current Date Cheque / Post Dated Cheque / ...',
              value: 'Current Date Cheque / Post Dated Cheque / ...',
            ),
            PaymentsPageRadioButton(
              model: model,
              title: 'Payment Gateway',
              value: 'Payment Gateway',
            )
          ],
        ));
  }
}
