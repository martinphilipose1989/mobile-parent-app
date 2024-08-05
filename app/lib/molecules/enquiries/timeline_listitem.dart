import 'package:app/molecules/enquiries/dashline.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimelineListitem extends StatelessWidget {

  final int index;
  const TimelineListitem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.listItem,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      border: Border.all(width: 5,color: Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Enquiry Received",
                        style: AppTypography.body2.copyWith(
                          color: AppColors.textDark
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.instagramIcon),
                          const SizedBox(width: 5,),
                          CommonText(text: "New Admission",
                            style: AppTypography.body2.copyWith(
                              color: AppColors.textGray,
                              fontSize: 12,
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 15,),
                      CommonText(text: "01/05/2024 10:30 Am",
                        style: AppTypography.body2.copyWith(
                          fontSize: 10,
                          color: AppColors.textDark
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        index==4?
            const SizedBox()
        :Positioned(
          left: 29,
          top: 50,
          child: CustomPaint(
              size: const Size(2, 120),
              painter: DashedLineVerticalPainter()
          ),
        ),
      ],
    );
  }
}
