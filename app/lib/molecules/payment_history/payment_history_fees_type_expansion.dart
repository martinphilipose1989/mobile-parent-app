import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentHistoryFeesTypeExpansion extends StatefulWidget {
  final List<domain.GroupByFeeTypeModel> groupedModels;

  const PaymentHistoryFeesTypeExpansion(
      {super.key, required this.groupedModels});

  @override
  State<PaymentHistoryFeesTypeExpansion> createState() =>
      _PaymentHistoryFeesTypeExpansionState();
}

class _PaymentHistoryFeesTypeExpansionState
    extends State<PaymentHistoryFeesTypeExpansion> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.groupedModels.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Container(
                  width: 358.w,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        width: 1,
                      )),
                  child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: widget.groupedModels[i].feeType,
                            style: AppTypography.subtitle2,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            color: AppColors.textPaleGray,
                          ),
                          CommonText(
                            text: widget.groupedModels[i].totalAmount ?? '',
                            style: AppTypography.subtitle2
                                .copyWith(color: AppColors.success),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(children: [
                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              CommonSizedBox.sizedBox(height: 10, width: 10),
                              Row(
                                children: [
                                  const Spacer(),
                                  SvgPicture.asset(AppImages.eyeIcon),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 20),
                                  SvgPicture.asset(AppImages.downloadIcon),
                                ],
                              ),
                              CommonSizedBox.sizedBox(height: 10, width: 10),
                              Column(
                                children: List.generate(
                                  widget.groupedModels[i].fees.length,
                                  (index) {
                                    domain.GetPendingFeesFeeModel fees =
                                        widget.groupedModels[i].fees[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 110,
                                          child: CommonText(
                                            text: fees.acknowledgementNo == null
                                                ? fees.receiptNumber ?? ""
                                                : fees.acknowledgementNo ?? '',
                                            style: AppTypography.subtitle2
                                                .copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                          ),
                                        ),
                                        CommonText(
                                          text: fees.acknowledgementDate == null
                                              ? DateFormatter.formatDate(
                                                  fees.receiptDate ?? '')
                                              : DateFormatter.formatDate(
                                                  fees.acknowledgementDate ??
                                                      ''),
                                          style: AppTypography.subtitle2
                                              .copyWith(),
                                        ),
                                        SizedBox(
                                          width: 60,
                                          child: CommonText(
                                            textAlign: TextAlign.center,
                                            text: fees.paymentMode ?? "",
                                            style: AppTypography.subtitle2
                                                .copyWith(),
                                          ),
                                        ),
                                        CommonText(
                                          text: CurrencyFormatter.formatToRupee(
                                              fees.amount ?? ""),
                                          style: AppTypography.subtitle2
                                              .copyWith(),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ]))
                      ]));
            }));
  }
}
