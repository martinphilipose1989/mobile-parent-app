import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Widget? suffix;
  final bool showAstreik;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final double rightPadding;
  final double leftPadding;
  final double topPadding;
  final double bottomPadding;
  final BoxConstraints? prefixIconConstraints;
  final bool enableInteractiveSelection;

  const CommonTextFormField(
      {super.key,
      this.labelText,
      this.controller,
      this.suffix,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.readOnly = false,
      this.decoration,
      this.maxLines,
      this.maxLength,
      required this.showAstreik,
      this.showSearchIcon = false,
      this.prefix,
      this.inputFormatters,
      this.onTap,
      this.focusNode,
      this.onFieldSubmitted,
      this.textInputAction,
      this.onChanged,
      this.topPadding = 0,
      this.bottomPadding = 0,
      this.rightPadding = 0,
      this.leftPadding = 0,
      this.prefixIconConstraints,
      this.enableInteractiveSelection = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
          top: topPadding,
          bottom: bottomPadding,
          left: leftPadding,
          right: rightPadding),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            //height: 48.h,
            child: TextFormField(
              enableInteractiveSelection: enableInteractiveSelection,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              controller: controller,
              cursorHeight: 20,
              readOnly: readOnly,
              maxLength: maxLength,
              style:
                  AppTypography.body1.copyWith(overflow: TextOverflow.ellipsis),
              keyboardType: keyboardType,
              validator: validator,
              obscureText: obscureText,
              maxLines: maxLines ?? 1,
              decoration: decoration ??
                  InputDecoration(
                      filled: readOnly ? true : false,
                      fillColor: readOnly
                          ? Colors.grey.shade100
                          : Theme.of(context).inputDecorationTheme.fillColor,
                      prefixIconConstraints: prefixIconConstraints,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      prefixIcon: prefix,
                      hintText: hintText ?? '',
                      counterText: ""),
              onTap: onTap,
              focusNode: focusNode ?? FocusNode(),
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
          Positioned(
            left: 6,
            top: -11,
            child: labelText != ''
                ? Container(
                    color: readOnly
                        ? Colors.grey.shade100
                        : Colors
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
      ),
    );
  }
}
