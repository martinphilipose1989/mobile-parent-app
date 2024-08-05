import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponList extends StatelessWidget {
  const CouponList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appbarTitle: 'Apply Coupon',
        notShowNotificationAndUserBatch: true,
        showBackButton: true,
      ),
      body: ListView(
        children: List.generate(
          10,
          (index) {
            return SizedBox(
              height: 200.h,
              width: 350.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.sbiBankIcon),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                            CustomPaint(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40.h,
                                  width: 145.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2)),
                                  child: CommonText(
                                    text: 'VIBGYORSBI20%',
                                    style: AppTypography.subtitle2.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                                painter: DashRectPainter(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    strokeWidth: 1.5,
                                    gap: 3)),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: CommonText(
                                text: 'Apply',
                                style: AppTypography.subtitle2.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
                        const CommonText(
                          text: 'Flat 20% discount with SBI card payments',
                          style: AppTypography.subtitle2,
                        ),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
                        const Divider(),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
                        const CommonText(
                          text:
                              'Pay your ward’s fee with Sbi card to avail the offer',
                          style: AppTypography.caption,
                        ),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
                        const CommonText(
                          text: '+ Show More',
                          style: AppTypography.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
