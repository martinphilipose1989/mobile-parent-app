import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentHistoryTransationTypeExpansion extends StatefulWidget {
  const PaymentHistoryTransationTypeExpansion({super.key});

  @override
  State<PaymentHistoryTransationTypeExpansion> createState() =>
      _CustomExpansionTileState();
}

class _CustomExpansionTileState
    extends State<PaymentHistoryTransationTypeExpansion> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: List.generate(
                  2,
                  (index) {
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: 'TTC56858TY6',
                                    style: AppTypography.subtitle2,
                                  ),
                                  CommonText(
                                    text: '21 June 2024',
                                    style: AppTypography.caption,
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 10,
                                thickness: 1,
                                color: AppColors.textPaleGray,
                              ),
                              const CommonText(
                                text: 'UPI',
                                style: AppTypography.subtitle2,
                              ),
                              const Divider(
                                height: 10,
                                thickness: 1,
                                color: AppColors.textPaleGray,
                              ),
                              CommonText(
                                text: '₹ 1,30,000',
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
                                      SvgPicture.asset(AppImages.eyeIcon),
                                      CommonSizedBox.sizedBox(
                                          height: 10, width: 20),
                                      SvgPicture.asset(AppImages.downloadIcon),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonText(
                                                text: 'Consolidated',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                              CommonText(
                                                text: 'Installment 1',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        text: '70,000',
                                        style:
                                            AppTypography.subtitle2.copyWith(),
                                      ),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonText(
                                                text: 'Consolidated',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                              CommonText(
                                                text: 'Installment 1',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        text: '50,000',
                                        style:
                                            AppTypography.subtitle2.copyWith(),
                                      ),
                                    ],
                                  ),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonText(
                                                text: 'Transpotation',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                              CommonText(
                                                text: 'Non AC',
                                                style: AppTypography.subtitle2
                                                    .copyWith(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        text: '10,000',
                                        style:
                                            AppTypography.subtitle2.copyWith(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                    );
                  },
                ),
              );
            }));
  }
}