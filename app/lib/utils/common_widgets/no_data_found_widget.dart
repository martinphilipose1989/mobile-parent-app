import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget(
      {super.key, required this.title, this.subtitle, this.onPressed});

  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.noDataFound,
          width: 96.w,
          height: 96.w,
        ),
        Center(
          child: Text(
            title,
            style: AppTypography.h6,
            textAlign: TextAlign.center,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Center(
            child: Text(
              subtitle!,
              style:
                  AppTypography.subtitle1.copyWith(color: AppColors.textGray),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        if (onPressed != null) ...[
          const SizedBox(height: 8),
          CommonOutlineButton(
              onPressed: () {
                onPressed?.call();
              },
              title: "Try again")
        ]
      ],
    );
  }
}
