import 'package:app/feature/payments/payment_history_transaction_type/payment_history_transaction_model.dart';
import 'package:app/model/resource.dart';

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
    return AppStreamBuilder<bool>(
        stream: model.paymentHistoryModel.isTransactionHistoryFileDownloading,
        initialData: false,
        dataBuilder: (context, isLoading) {
          return Stack(
            children: [
             ListView(
                  children: transactions?.isEmpty ?? false
                      ? [
                          CommonText(
                            text: 'No transactions found',
                            style: AppTypography.subtitle2,
                          )
                        ]
                      : List.generate(
                          transactions?.length ?? 0,
                          (index) {
                            TransactionModel transactionModel =
                                transactions![index];
                            return Container(
                              width: double.infinity,
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
                                        transactionModel
                                                .getTransactiontypefeesCollectedModel =
                                            data;
                                      }, index: index);
                                    }

                                    // }
                                  },
                                  title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width:80.w,
                                            child: CommonText(

                                              text: transactionModel
                                                          .acknowledgementNo ==
                                                      null
                                                  ? transactionModel
                                                          .receiptNumber ??
                                                      ''
                                                  : transactionModel
                                                          .acknowledgementNo ??
                                                      '',
                                              style: AppTypography.subtitle2,
                                              softWrap: true,
                                              maxLines: 3,
                                            ),
                                          ),
                                          CommonText(
                                            text: DateFormatter.formatDate(
                                                transactionModel
                                                        .transactionDate ??
                                                    ''),
                                            style: AppTypography.caption,
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        height: 10,
                                        thickness: 1,
                                        color: AppColors.textPaleGray,
                                      ),
                                      SizedBox(width:60.w,
                                        child: CommonText(
                                          text: transactionModel.paymentMode ??
                                              'NA',
                                          style: AppTypography.subtitle2,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
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
                                          CommonSizedBox.sizedBox(
                                              height: 10, width: 10),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  String feeUrlKey =
                                                      transactionModel
                                                              .transactionUrlKey ??
                                                          '';
                                                  model.paymentHistoryModel
                                                      .downloadTransactionHistory(
                                                          fileType: 'pdf',
                                                          id: feeUrlKey);
                                                },
                                                child: SvgPicture.asset(
                                                    AppImages.eyeIcon),
                                              ),
                                              CommonSizedBox.sizedBox(
                                                  height: 10, width: 20),
                                              InkWell(
                                                  onTap: () {
                                                    String feeUrlKey =
                                                        transactionModel
                                                                .transactionUrlKey ??
                                                            '';
                                                    model.paymentHistoryModel
                                                        .downloadTransactionHistory(
                                                            fileType: 'pdf',
                                                            id: feeUrlKey);
                                                  },
                                                  child: SvgPicture.asset(
                                                      AppImages.downloadIcon)),
                                            ],
                                          ),
                                          CommonSizedBox.sizedBox(
                                              height: 10, width: 10),
                                          AppStreamBuilder<
                                              Resource<
                                                  GetTransactionTypeModel>>(
                                            stream:
                                                model.getTransactionTypeModel,
                                            initialData: Resource.none(),
                                            dataBuilder: (context, data) {
                                              return model.selectedIndex ==
                                                          index &&
                                                      data!.status ==
                                                          Status.loading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : Column(
                                                      children: List.generate(
                                                        (data?.data?.data
                                                                ?.length ??
                                                            0),
                                                        (index) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      CommonText(
                                                                        text: transactionModel.getTransactiontypefeesCollectedModel?[index].feeDetailsModel?.feeType ??
                                                                            '',
                                                                        style: AppTypography
                                                                            .subtitle2
                                                                            .copyWith(),
                                                                      ),
                                                                      CommonText(
                                                                        text: transactionModel.getTransactiontypefeesCollectedModel?[index].feeDetailsModel?.feeSubType ??
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
                                                                text: CurrencyFormatter.formatToRupee(
                                                                    transactionModel
                                                                            .getTransactiontypefeesCollectedModel?[index]
                                                                            .feeAmount ??
                                                                        ""),
                                                                color: TransactionStausEnum
                                                                            .success
                                                                            .id ==
                                                                        transactionModel
                                                                            .getTransactiontypefeesCollectedModel?[
                                                                                index]
                                                                            .paymentStatus
                                                                    ? AppColors
                                                                        .success
                                                                    : TransactionStausEnum.failure.id ==
                                                                            transactionModel
                                                                                .getTransactiontypefeesCollectedModel?[
                                                                                    index]
                                                                                .paymentStatus
                                                                        ? AppColors
                                                                            .failure
                                                                        : AppColors
                                                                            .textDark,
                                                                style: AppTypography
                                                                    .subtitle2
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
                        )),
              if (isLoading ?? false) CommonAppLoader()
            ],
          );
        });
  }
}
