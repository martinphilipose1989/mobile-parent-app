import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorDetailsRow extends StatelessWidget {
  final String title1;
  final String value1;
  final String? title2;
  final String? value2;

  const VisitorDetailsRow({
    super.key,
    required this.title1,
    required this.value1,
    this.title2, // Optional
    this.value2, // Optional
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: AppTypography.body2.copyWith(
                    color: AppColors.textGray,
                    fontSize: 14.sp,
                    height:
                        1.1 // Line height as a multiple of font size 1.1  (height = line height in px / font size in px ) so 15.4/14 = 1.1
                    ),
              ),
              Text(
                value1,
                style: AppTypography.subtitle2.copyWith(
                  color: AppColors.textDark,
                  fontSize: 14.sp,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
        if (title2 != null &&
            value2 != null) // Check if title2 and value2 are provided
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2!,
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textGray,
                    fontSize: 14.sp,
                    height: 1.1,
                  ),
                ),
                Text(
                  value2!,
                  style: AppTypography.subtitle2.copyWith(
                    color: AppColors.textDark,
                    fontSize: 14.sp,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
