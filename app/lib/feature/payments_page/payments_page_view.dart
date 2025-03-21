import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/molecules/payments_page.dart/coupon_list.dart';
import 'package:app/molecules/payments_page.dart/payments_page_radio_button.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentsPageView extends BasePageViewWidget<PaymentsPageModel> {
  PaymentsPageView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentsPageModel model) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // CommonSizedBox.sizedBox(height: 20, width: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const CommonText(
            //       text: 'Alerady Have A Coupon?',
            //       style: AppTypography.subtitle2,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Navigator.pushNamed(context, RoutePaths.couponList);
            //       },
            //       child: CommonText(
            //         text: 'View Coupons',
            //         style: AppTypography.subtitle2
            //             .copyWith(color: Theme.of(context).colorScheme.primary),
            //       ),
            //     ),
            //   ],
            // ),
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
                  child: AppStreamBuilder<List<GetPendingFeesFeeModel>>(
                      stream: model.selectedFees,
                      initialData: model.selectedFees.value,
                      dataBuilder: (context, data) {
                        return Column(
                          children: List.generate(
                            data!.length,
                            (index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: data[index].feeDisplayName ??
                                                "",
                                            style: AppTypography.subtitle2,
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        text: CurrencyFormatter.formatToRupee(
                                            data[index].pending ?? ""),
                                        style: AppTypography.subtitle2.copyWith(
                                            color: data[index].isDiscountApplied
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .tertiaryContainer
                                                : AppColors.success,
                                            decoration:
                                                data[index].isDiscountApplied
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none),
                                      ),
                                      data[index].isDiscountApplied
                                          ? CommonText(
                                              text: CurrencyFormatter
                                                  .formatToRupee(data[index]
                                                          .discountedAmount ??
                                                      ""),
                                              style: AppTypography.subtitle2
                                                  .copyWith(
                                                      color: AppColors.success),
                                            )
                                          : const SizedBox.shrink(),
                                      InkWell(
                                        onTap: data[index].isDiscountApplied
                                            ? () {
                                                model.isDiscountApplied = false;
                                                data[index].isDiscountApplied =
                                                    false;
                                                data[index].discountedAmount =
                                                    null;
                                                model.selectedFees.add(data);
                                                model.finalAmount
                                                    .value = (int.parse(model
                                                            .finalAmount
                                                            .value) +
                                                        int.parse(data[index]
                                                                .differenceAmount ??
                                                            ''))
                                                    .toString();
                                                model.clearCoupon(
                                                    "${data[index].couponId}");
                                              }
                                            : () {
                                                Navigator.pushNamed(
                                                  context,
                                                  RoutePaths.couponList,
                                                  arguments: CouponListArgs(
                                                    getPendingFeesFeeModel:
                                                        data[index],
                                                    appliedCouponList:
                                                        model.appliedCouponList,
                                                  ),
                                                ).then(
                                                  (value) {
                                                    if (value != null) {
                                                      FetchCouponsDataModel
                                                          fetchCouponsDataModel =
                                                          value
                                                              as FetchCouponsDataModel;
                                                      model.calculateDiscountPerLineItem(
                                                          fetchCouponsDataModel,
                                                          data,
                                                          index);
                                                    }
                                                  },
                                                );
                                              },
                                        child: CommonText(
                                          text: data[index].isDiscountApplied
                                              ? Strings.of(context).clear
                                              : Strings.of(context).apply_coupons,
                                          style: AppTypography.subtitle2
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (model.selectedFees.value.length > 1)
                                    CommonSizedBox.sizedBox(
                                        height: 20, width: 10),
                                ],
                              );
                            },
                          ),
                        );
                      })),
            ),
            CommonSizedBox.sizedBox(height: 20, width: 10),
            CommonText(
              text: Strings.of(context).select_payments_method,
              style: AppTypography.body2,
            ),
            PaymentsPageRadioButton(
              model: model,
              title: Strings.of(context).current_date_cheque,
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
                                model.paymentModes[index].paymentModeName ?? '',
                            value:
                                model.paymentModes[index].paymentModeName ?? "",
                          );
                  },
                  itemCount: model.paymentModes.length),
            ),
          ],
        ));
  }
}
