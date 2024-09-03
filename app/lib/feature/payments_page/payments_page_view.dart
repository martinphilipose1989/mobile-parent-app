import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/molecules/payments_page.dart/payments_page_radio_button.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey.shade300,
                        spreadRadius: 1)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: List.generate(
                      model.selectedFees.length,
                      (index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: model.selectedFees[index]
                                              .feeDisplayName ??
                                          "",
                                      style: AppTypography.subtitle2,
                                    ),
                                  ],
                                ),
                                CommonText(
                                  text: CurrencyFormatter.formatToRupee(
                                      model.selectedFees[index].pending ?? ""),
                                  style: AppTypography.subtitle2
                                      .copyWith(color: AppColors.success),
                                ),
                              ],
                            ),
                            if (model.selectedFees.length > 1)
                              CommonSizedBox.sizedBox(height: 20, width: 10),
                          ],
                        );
                      },
                    ),
                  )),
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
            SizedBox(
              height: 1.sh,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return model.paymentModes[index].paymentModeId == 8 ||
                            model.paymentModes[index].paymentModeId == 9 ||
                            model.paymentModes[index].paymentModeId == 10
                        ? const SizedBox.shrink()
                        : PaymentsPageRadioButton(
                            model: model,
                            title:
                                model.paymentModes[index].serviceProvider ?? '',
                            value:
                                model.paymentModes[index].serviceProvider ?? "",
                          );
                  },
                  itemCount: model.paymentModes.length),
            ),
          ],
        ));
  }
}
