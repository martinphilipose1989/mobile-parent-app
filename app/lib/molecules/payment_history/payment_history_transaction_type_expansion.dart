import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentHistoryTransationTypeExpansion extends StatelessWidget {
  final List<TransactionModel>? transactions;
  final PaymentHistoryTransactionModel model;
  const PaymentHistoryTransationTypeExpansion(
      {super.key, this.transactions, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      transactions?.length ?? 0,
      (index) {
        TransactionModel transactionModel = transactions![index];
        return Container(
          width: 358.w,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1,
              )),
          child: ExpansionTile(
              onExpansionChanged: (value) {
                // if (transactionModel.getTransactiontypefeesCollectedModel ==
                //         null ||
                //     (transactionModel
                //             .getTransactiontypefeesCollectedModel?.isEmpty ??
                //         false)) {
                if (value) {
                  model.getTransactionTypes(
                    transactionModel.transactionId ?? 0,
                    (data) {
                      transactionModel.getTransactiontypefeesCollectedModel =
                          data;
                    },
                  );
                }

                // }
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: transactionModel.acknowledgementNo == null
                            ? transactionModel.receiptNumber ?? ''
                            : transactionModel.acknowledgementNo ?? '',
                        style: AppTypography.subtitle2,
                      ),
                      CommonText(
                        text: DateFormatter.formatDate(
                            transactionModel.acknowledgementDate == null
                                ? transactionModel.receiptDate ?? ''
                                : transactionModel.acknowledgementDate ?? ''),
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: AppColors.textPaleGray,
                  ),
                  CommonText(
                    text: transactionModel.paymentMode ?? 'NA',
                    style: AppTypography.subtitle2,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: AppColors.textPaleGray,
                  ),
                  CommonText(
                    text: CurrencyFormatter.formatToRupee(
                        transactionModel.totalAmount ?? ""),
                    style: AppTypography.subtitle2
                        .copyWith(color: AppColors.success),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(AppImages.eyeIcon),
                          CommonSizedBox.sizedBox(height: 10, width: 20),
                          SvgPicture.asset(AppImages.downloadIcon),
                        ],
                      ),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      AppStreamBuilder<Resource<GetTransactionTypeModel>>(
                        stream: model.getTransactionTypeModel,
                        initialData: Resource.none(),
                        dataBuilder: (context, data) {
                          return data!.status == Status.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Column(
                                  children: List.generate(
                                    (data.data?.data?.length ?? 0),
                                    (index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonText(
                                                    text: data
                                                            .data
                                                            ?.data?[index]
                                                            .feeDetailsModel
                                                            ?.feeType ??
                                                        '',
                                                    style: AppTypography
                                                        .subtitle2
                                                        .copyWith(),
                                                  ),
                                                  CommonText(
                                                    text: data
                                                            .data
                                                            ?.data?[index]
                                                            .feeDetailsModel
                                                            ?.feeSubType ??
                                                        '',
                                                    style: AppTypography
                                                        .subtitle2
                                                        .copyWith(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          CommonText(
                                            text:
                                                CurrencyFormatter.formatToRupee(
                                                    data.data?.data?[index]
                                                            .feeAmount ??
                                                        ""),
                                            style: AppTypography.subtitle2
                                                .copyWith(),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                        },
                      )

                      // CommonSizedBox.sizedBox(height: 10, width: 10),
                    ],
                  ),
                )
              ]),
        );
      },
    ));
  }
}
