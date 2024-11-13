import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';

import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ArrivalInfoTile extends StatelessWidget {
  final String vehicleNumber;
  final String startTime;
  final int totalStudents;

  const ArrivalInfoTile(
      {super.key,
      required this.vehicleNumber,
      required this.startTime,
      required this.totalStudents});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.textPalerGray),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.bus),
                SizedBox(width: 4.w),
                Flexible(
                  child: CommonText(
                      text: vehicleNumber, style: AppTypography.smallCaption),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.textPalerGray),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.clockIcon),
                SizedBox(width: 4.w),
                Flexible(
                    child: CommonText(
                        text: startTime, style: AppTypography.smallCaption)),
              ],
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.textPalerGray),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.userIcon),
                SizedBox(width: 4.w),
                Flexible(
                  child: CommonText(
                      text: "$totalStudents Students",
                      style: AppTypography.smallCaption),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
