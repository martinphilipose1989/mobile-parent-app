import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final int? maxLines;
  final bool showSearchIcon;
  final Widget? prefix;
  final bool showAstreik;

  const CommonTextFormField(
      {super.key,
      this.labelText,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.decoration,
      this.maxLines,
      required this.showAstreik,
      this.showSearchIcon = false,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          controller: controller,
          cursorHeight: 20,
          style: AppTypography.body1,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines ?? 1,
          decoration: decoration ??
              InputDecoration(
                prefixIcon: prefix,
                hintText: hintText ?? '',
              ),
        ),
        Positioned(
          left: 6,
          top: -11,
          child: labelText != ''
              ? Container(
                  color: Colors
                      .white, // Match the background color to avoid overlap
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      CommonText(
                        text: labelText ?? "",
                        style: AppTypography.caption
                            .copyWith(color: AppColors.textNeutral35),
                      ),
                      showAstreik
                          ? CommonText(
                              text: ' *',
                              style: AppTypography.caption.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.failure,
                                  fontSize: 12.sp),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
