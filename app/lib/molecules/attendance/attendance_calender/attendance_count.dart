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

  final String? count;
  final String countType;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h,),
            CommonText(
                text: "$count",
                style: AppTypography.subtitle2.copyWith(color: textColor)),
            CommonText(
                text: countType,
                style: AppTypography.caption
                    .copyWith(color: AppColors.textNeutral35)),
          ],
        ),
      ),
    );
  }
}
