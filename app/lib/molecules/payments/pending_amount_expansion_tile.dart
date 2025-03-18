import 'package:app/feature/payments/payments_pages/payments_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

import 'package:localisation/strings.dart';

class PendingAmountExpansionTile extends StatefulWidget {
  final PaymentsModel model;
  const PendingAmountExpansionTile({super.key, required this.model});

  @override
  State<PendingAmountExpansionTile> createState() =>
      _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<PendingAmountExpansionTile> {
  int? selectedIndex;
  late PaymentsModel model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<Resource<List<domain.PendingFeesAsPerStudentIds>>>(
      stream: model.pendingFeesFilteredById,
      initialData: Resource.none(),
      dataBuilder: (context, data) {
        return data!.status == Status.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  data.data?.length ?? 0,
                  (i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.data?.length == 1
                            ? const SizedBox()
                            : (data.data?[i].fees.isEmpty ?? false)
                                ? const SizedBox()
                                : Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 8, 8),
                                    child: CommonText(
                                        text: data.data?[i].studentName ?? ""),
                                  ),
                        data.data?[i].fees.isEmpty == true &&
                                data.data?.length == 1
                            ? SizedBox(
                                height: 300,
                                child: Center(
                                  child: CommonText(
                                      text: Strings.of(context)
                                          .no_pending_fees_found),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                  data.data?[i].fees.length ?? 0,
                                  (index) {
                                    return Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textLightGray)),
                                      child: ExpansionTile(
                                          childrenPadding: EdgeInsets.zero,
                                          tilePadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                          leading: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Checkbox(
                                              value: data.data?[i].fees[index]
                                                  .isSelected,
                                              onChanged: (value) {
                                                model.isFeesSelectable(
                                                    onCallBack: (failure) {},
                                                    feeIndex: index,
                                                    studentIdIndex: i,
                                                    pendingAmount: data
                                                            .data?[i]
                                                            .fees[index]
                                                            .pending ??
                                                        "",
                                                    feeId: data
                                                            .data?[i]
                                                            .fees[index]
                                                            .feeId ??
                                                        0);
                                              },
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CommonText(
                                                      text: data
                                                              .data?[i]
                                                              .fees[index]
                                                              .feeDisplayName ??
                                                          '',
                                                      style: AppTypography
                                                          .subtitle2
                                                          .copyWith(
                                                              color: AppColors
                                                                  .textDark),
                                                    ),
                                                    CommonText(
                                                      text: CurrencyFormatter
                                                          .formatToRupee(data
                                                                  .data?[i]
                                                                  .fees[index]
                                                                  .pending ??
                                                              ''),
                                                      style: AppTypography
                                                          .subtitle2
                                                          .copyWith(
                                                              color: AppColors
                                                                  .textGray),
                                                    ),
                                                  ],
                                                ),
                                                CommonSizedBox.sizedBox(
                                                    height: 5, width: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const SizedBox(),
                                                    CommonText(
                                                      text: data
                                                              .data?[i]
                                                              .fees[index]
                                                              .overdueLabel ??
                                                          '',
                                                      style: AppTypography
                                                          .caption
                                                          .copyWith(
                                                              color: data
                                                                          .data?[
                                                                              i]
                                                                          .fees[
                                                                              index]
                                                                          .isOverdue ==
                                                                      1
                                                                  ? AppColors
                                                                      .failure
                                                                  : AppColors
                                                                      .success),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 0, 30, 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  const Divider(
                                                    height: 1,
                                                    thickness: 1,
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      data.data?[i].fees[index]
                                                                  .feeType !=
                                                              null
                                                          ? CommonText(
                                                              text: data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .feeType ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                                      data.data?[i].fees[index]
                                                                  .feeSubType !=
                                                              null
                                                          ? CommonText(
                                                              text: data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .feeSubType ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                                      data.data?[i].fees[index]
                                                                  .feeCategory !=
                                                              null
                                                          ? CommonText(
                                                              text: data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .feeCategory ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                                      data.data?[i].fees[index]
                                                                  .feeSubCategory !=
                                                              null
                                                          ? CommonText(
                                                              text: data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .feeSubCategory ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  const Divider(
                                                    height: 1,
                                                    thickness: 1,
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(Strings.of(context)
                                                          .academic_year),
                                                      Text(data
                                                              .data?[i]
                                                              .fees[index]
                                                              .academicYear ??
                                                          ''),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(Strings.of(context)
                                                          .period_of_service),
                                                      Text(data
                                                              .data?[i]
                                                              .fees[index]
                                                              .periodOfService ??
                                                          ''),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(Strings.of(context)
                                                          .fees),
                                                      Text(CurrencyFormatter
                                                          .formatToRupee(data
                                                                  .data?[i]
                                                                  .fees[index]
                                                                  .amount ??
                                                              '')),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          Strings.of(context)
                                                              .concession,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .green)),
                                                      Text(
                                                          CurrencyFormatter
                                                              .formatToRupee(data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .discount ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          Strings.of(context)
                                                              .partially_paid,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .green)),
                                                      Text(
                                                          CurrencyFormatter
                                                              .formatToRupee(data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .paid ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          Strings.of(context)
                                                              .reallocation, // 'Reallocation (Transport)',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .green)),
                                                      Text(
                                                          CurrencyFormatter
                                                              .formatToRupee(data
                                                                      .data?[i]
                                                                      .fees[
                                                                          index]
                                                                      .adjustment ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ],
                                                  ),
                                                  CommonSizedBox.sizedBox(
                                                      height: 10, width: 10),
                                                  data.data?[i].fees[index]
                                                              .actualDueDate ==
                                                          null
                                                      ? const SizedBox.shrink()
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(Strings.of(
                                                                    context)
                                                                .due_date),
                                                            Text(DateFormatter
                                                                .formatDate(data
                                                                        .data?[
                                                                            i]
                                                                        .fees[
                                                                            index]
                                                                        .actualDueDate!
                                                                        .toIso8601String() ??
                                                                    "")),
                                                          ],
                                                        ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                      ],
                    );
                  },
                ));
      },
    );
  }
}
