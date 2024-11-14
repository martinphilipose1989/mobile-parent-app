import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSearchTextField extends StatelessWidget {
  const CommonSearchTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.prefixIcon,
      this.onChanged,
      this.focusNode});

  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  // void _handleKeyPress(KeyEvent event) {
  //   if (event is KeyDownEvent) {
  //     // Check if the Backspace key is pressed
  //     if (event.logicalKey == LogicalKeyboardKey.backspace) {
  //       log("Backspace Pressed");
  //       // // Call your custom function here
  //       // if (_controller.text.isEmpty) {
  //       //   _handleTextFieldCleared();
  //       // }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double calculatedPadding = (constraints.maxHeight - 24.h) / 2;
      return TextField(
        controller: controller,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.isNotEmpty && value.startsWith(' ')) {
            controller.text = value.trimLeft(); // Remove leading spaces
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          } else {
            onChanged?.call(value);
          }
        },
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            height: 24.w,
            width: 24.w,
            child: prefixIcon ?? SvgPicture.asset(AppImages.searchIcon),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: calculatedPadding),
          hintStyle: AppTypography.subtitle1.copyWith(
            fontFamily: 'Poppins',
            color: AppColors.textLightGray,
          ),
          labelStyle: AppTypography.subtitle1.copyWith(
            fontFamily: 'Poppins',
            color: AppColors.textLightGray,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textLightGray),
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textLightGray),
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textLightGray),
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
          ),
        ),
      );
    });
  }
}
