import 'package:app/navigation/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';

class PaymentHistoryStudentLedgerList extends StatefulWidget {
  const PaymentHistoryStudentLedgerList({super.key});

  @override
  State<PaymentHistoryStudentLedgerList> createState() =>
      _PaymentHistoryStudentLedgerState();
}

class _PaymentHistoryStudentLedgerState
    extends State<PaymentHistoryStudentLedgerList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutePaths.paymentDetails);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
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
                        Row(
                          children: [
                            CommonText(
                              text: '₹ 1,30,000',
                              style: AppTypography.subtitle2
                                  .copyWith(color: AppColors.success),
                            ),
                            CommonSizedBox.sizedBox(height: 10, width: 20),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  thickness: 1,
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
