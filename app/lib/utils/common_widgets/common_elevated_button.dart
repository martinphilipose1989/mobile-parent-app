import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;
  final double borderWidth;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const CommonElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.padding,
      this.borderWidth = 0,
      this.borderColor,
      this.icon,
      this.textStyle,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.w,
      height: height ?? 40.h,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null
            ? Icon(icon, color: textColor)
            : const SizedBox.shrink(),
        label: Text(text,
            style: textStyle ??
                TextStyle(
                  fontFamily: 'Graphik',
                  fontWeight: FontWeight.w500, // Medium
                  fontSize: 14,
                  color: textColor,
                  textBaseline: TextBaseline.alphabetic,
                )),
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white),
      ),
    );
  }
}
