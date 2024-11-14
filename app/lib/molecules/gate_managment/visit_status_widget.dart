import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitStatusWidget extends StatelessWidget {
  final String visitStatus;

  const VisitStatusWidget({super.key, required this.visitStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: visitStatus == "in"
            ? AppColors.primaryLighter
            : AppColors.textPalerGray,
        border: Border.all(
          width: 1,
          color: visitStatus == "in"
              ? AppColors.primary
              : AppColors.textLighterGray,
        ),
      ),
      child: CommonText(
        text: visitStatus == "in" ? "In" : "Out",
        style: AppTypography.overline.copyWith(
          color:
              visitStatus == "in" ? AppColors.primary : AppColors.textLightGray,
          fontSize: 14.sp,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
