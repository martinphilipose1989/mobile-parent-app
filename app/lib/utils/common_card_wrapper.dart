import 'package:app/themes_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonCardWrapper extends StatelessWidget {
  const CommonCardWrapper(
      {super.key,
      required this.child,
      this.isPrimary = true,
      this.primaryColor = AppColors.listItem,
      this.secondaryColor = AppColors.listItemDisabled,
      this.bottom = 16,
      this.top = 0,
      this.left = 0,
      this.right = 0,
      this.contentPadding});

  final Widget child;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isPrimary;
  final double top;
  final double right;
  final double left;
  final double bottom;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          REdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      padding: contentPadding ?? REdgeInsets.all(16),
      decoration: BoxDecoration(
          color: isPrimary ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [AppColors.boxShadow]),
      child: child,
    );
  }
}
