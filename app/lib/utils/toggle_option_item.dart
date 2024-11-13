import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleOptionItem<T> extends StatelessWidget {
  const ToggleOptionItem(
      {super.key,
      required this.value,
      required this.text,
      required this.selectedValue,
      required this.onSelect,
      this.selectedBackgroundColor = AppColors.primaryLighter,
      this.unselectedBackgroundColor = Colors.white,
      this.selectedBorderColor = AppColors.primary,
      this.unselectedBorderColor = AppColors.textLightGray,
      this.selectedTextColor = AppColors.primary,
      this.unselectedTextColor = AppColors.textGray});

  final T value;
  final String text;
  final T? selectedValue;
  final VoidCallback onSelect;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedValue == value;
    return InkWell(
      onTap: () {
        onSelect.call();
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color:
              isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
          border: Border.all(
              width: 1,
              color: isSelected ? selectedBorderColor : unselectedBorderColor),
        ),
        child: CommonText(
          text: text,
          style: AppTypography.subtitle2.copyWith(
              color: isSelected ? selectedTextColor : unselectedTextColor,
              fontSize: 14.sp,
              letterSpacing: 0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
