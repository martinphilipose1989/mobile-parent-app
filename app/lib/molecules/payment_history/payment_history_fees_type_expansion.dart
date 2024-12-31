import 'dart:developer';

import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:app/utils/enums/finance_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class PaymentHistoryFeesTypeExpansion extends StatefulWidget {
  final List<domain.GroupByFeeTypeModel> groupedModels;
  final PaymentHistoryModel model;

  const PaymentHistoryFeesTypeExpansion(
      {super.key, required this.groupedModels, required this.model});

  @override
  State<PaymentHistoryFeesTypeExpansion> createState() =>
      _PaymentHistoryFeesTypeExpansionState();
}

class _PaymentHistoryFeesTypeExpansionState
    extends State<PaymentHistoryFeesTypeExpansion> {
  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<bool>(
        stream: widget.model.isFeeTypeFileDownloading.stream,
        initialData: false,
        dataBuilder: (context, isLoading) {
          return Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  child: widget.groupedModels.isEmpty
                      ? Center(
                          child: CommonText(
                            text: 'No Fees Type Found',
                            style: AppTypography.subtitle2,
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.groupedModels.length,
                          itemBuilder: (context, i) {
                            return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(width: 1)),
                                child: ExpansionTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonText(
                                          text:
                                              "${widget.groupedModels[i].feeDisplayName}",
                                          style: AppTypography.subtitle2,
                                        ),
                                        const Divider(
                                          height: 10,
                                          thickness: 1,
                                          color: AppColors.textPaleGray,
                                        ),
                                        CommonText(
                                          text: widget.groupedModels[i]
                                                  .totalAmount ??
                                              '',
                                          style: AppTypography.subtitle2
                                              .copyWith(
                                                  color: AppColors.success),
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
                                            CommonSizedBox.sizedBox(
                                                height: 10, width: 10),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                InkWell(
                                                    onTap: () {
                                                      if (widget.groupedModels
                                                          .isNotEmpty) {
                                                        final String? urlKey =
                                                            widget
                                                                .groupedModels[
                                                                    i]
                                                                .fees
                                                                .first
                                                                .urlKey;
                                                        log("${widget.groupedModels[i].feeDisplayName} URL KEY $urlKey");
                                                        widget.model
                                                            .downloadFeeType(
                                                                urlKey:
                                                                    urlKey ??
                                                                        '');
                                                      }
                                                    },
                                                    child: SvgPicture.asset(
                                                        AppImages.eyeIcon)),
                                                CommonSizedBox.sizedBox(
                                                    height: 10, width: 20),
                                                InkWell(
                                                  onTap: () {
                                                    if (widget.groupedModels
                                                        .isNotEmpty) {
                                                      final String? urlKey =
                                                          widget
                                                              .groupedModels[i]
                                                              .fees
                                                              .first
                                                              .urlKey;
                                                      log("${widget.groupedModels[i].feeDisplayName} URL KEY $urlKey");
                                                      widget.model
                                                          .downloadFeeType(
                                                              urlKey:
                                                                  urlKey ?? '');
                                                    }
                                                  },
                                                  child: SvgPicture.asset(
                                                      AppImages.downloadIcon),
                                                ),
                                              ],
                                            ),
                                            CommonSizedBox.sizedBox(
                                                height: 10, width: 10),
                                            Column(
                                              children: List.generate(
                                                widget.groupedModels[i].fees
                                                    .length,
                                                (index) {
                                                  domain.GetPendingFeesFeeModel
                                                      fees = widget
                                                          .groupedModels[i]
                                                          .fees[index];

                                                  return Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CommonText(
                                                                text: fees.acknowledgementNo ==
                                                                        null
                                                                    ? fees.receiptNumber ??
                                                                        ""
                                                                    : fees.acknowledgementNo ??
                                                                        '',
                                                                style: AppTypography
                                                                    .subtitle2
                                                                    .copyWith(
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                              ),
                                                              CommonText(
                                                                text: fees.transactionDate !=
                                                                        null
                                                                    ? DateFormatter
                                                                        .formatDate(
                                                                            fees.transactionDate ??
                                                                                '')
                                                                    : DateFormatter.formatDate(
                                                                        fees.receiptDate ??
                                                                            ''),
                                                                style: AppTypography
                                                                    .subtitle2
                                                                    .copyWith(),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CommonText(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                text:
                                                                    fees.paymentMode ??
                                                                        "",
                                                                style: AppTypography
                                                                    .subtitle2
                                                                    .copyWith(),
                                                              ),
                                                              CommonText(
                                                                text: CurrencyFormatter
                                                                    .formatToRupee(
                                                                        fees.amount ??
                                                                            ""),
                                                                color: TransactionStausEnum
                                                                            .success
                                                                            .id ==
                                                                        fees
                                                                            .transactionStatus
                                                                    ? AppColors
                                                                        .success
                                                                    : TransactionStausEnum.failure.id ==
                                                                            fees
                                                                                .transactionStatus
                                                                        ? AppColors
                                                                            .failure
                                                                        : AppColors
                                                                            .textDark,
                                                                style: AppTypography
                                                                    .subtitle2,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            AppColors.textDark,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          ]))
                                    ]));
                          })),
              if (isLoading == true) CommonAppLoader()
            ],
          );
        });
  }
}
