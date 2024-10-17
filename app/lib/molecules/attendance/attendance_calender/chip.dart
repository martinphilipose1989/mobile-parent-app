import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceCountTile extends StatelessWidget {
  const AttendanceCountTile(
      {super.key,
        required this.count,
        required this.countType,
        required this.textColor});

  final int count;
  final String countType;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(height: 48.h,
        decoration: BoxDecoration(color: AppColors.textPaleGray),
        padding:
        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
                text: "$count",
                style: AppTypography.subtitle2.copyWith(
                color: textColor)),
            CommonText(
                text: countType,
                style: AppTypography.caption.copyWith(
                    color: AppColors.textNeutral35)),
          ],
        ),
      ),
    );
  }
}
