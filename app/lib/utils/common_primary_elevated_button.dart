import 'package:app/themes_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonPrimaryElevatedButton extends StatelessWidget {
  const CommonPrimaryElevatedButton(
      {super.key,
      required this.title,
      this.titleTextStyle,
      this.isLoading = false,
      this.isDisabled = false,
      required this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      this.loaderColor,
      this.shadowColor,
      this.elevation = 2,
      this.height,
      this.width,
      this.disabledForegroundColor,
      this.disabledBackgroundColor,
      this.icon});

  final VoidCallback onPressed;
  final String title;
  final TextStyle? titleTextStyle;
  final bool isDisabled;
  final bool isLoading;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? disabledForegroundColor;
  final Color? disabledBackgroundColor;
  final Color? loaderColor;
  final Color? shadowColor;
  final double elevation;
  final double? height;
  final double? width;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisabled || isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox.square(
              dimension: 16.w,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation(loaderColor ?? Colors.white),
              ),
            )
          : icon,
      style: ElevatedButton.styleFrom(
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shadowColor: shadowColor ?? AppColors.shadowColor,
          foregroundColor: foregroundColor ?? AppColors.accentOn,
          backgroundColor: backgroundColor ?? AppColors.accent,
          elevation: elevation,
          textStyle: titleTextStyle,
          fixedSize: Size(width ?? double.infinity, height ?? 40.h)),
      label: Text(title),
    );
  }
}
