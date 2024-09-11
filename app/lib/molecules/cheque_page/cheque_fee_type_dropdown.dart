import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/subjects.dart';

class ChequeFeeTypeDropdown<T extends DropDownValues> extends StatefulWidget {
  final List<T?> items;
  final bool showBorderColor;
  final String dropdownName;
  final bool showAsterisk;
  final List<String>? selectedValues;
  final double? width;
  final bool displayZerothIndex;
  final Function(T selectedValue)? onSingleSelect;
  final String? Function(T?)? validator;

  const ChequeFeeTypeDropdown({
    super.key,
    required this.items,
    required this.dropdownName,
    required this.showAsterisk,
    required this.showBorderColor,
    this.displayZerothIndex = false,
    this.width,
    this.selectedValues,
    this.validator,
    this.onSingleSelect,
  });

  @override
  State<ChequeFeeTypeDropdown> createState() =>
      _ChequeFeeTypeDropdownState<T>();
}

class _ChequeFeeTypeDropdownState<T extends DropDownValues>
    extends State<ChequeFeeTypeDropdown<T>> {
  BehaviorSubject<T> singleSelectItemSubject = BehaviorSubject<T>();

  @override
  Widget build(BuildContext context) {
    return singleSelectDropDown();
  }

  void selectedValue(T value) {
    if (widget.items.any((e) => e!.getId() == value.getId())) {
      singleSelectItemSubject.add(value);
      widget.onSingleSelect?.call(value);
    }
  }

  Widget singleSelectDropDown() {
    return StreamBuilder<T>(
      stream: singleSelectItemSubject,
      builder: (context, snapshot) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField2<T>(
                isExpanded: true,
                validator: widget.validator,
                hint: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: widget.items
                    .toList()
                    .map((T? item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(
                            item?.getTitle() ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (value) => selectedValue(value!),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
                decoration: widget.showBorderColor
                    ? InputDecoration(
                        border: Theme.of(context).inputDecorationTheme.border,
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder,
                        errorBorder:
                            Theme.of(context).inputDecorationTheme.errorBorder,
                        disabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .disabledBorder,
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                      )
                    : const InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                dropdownStyleData: DropdownStyleData(
                  direction: DropdownDirection.left,
                  maxHeight: 200,
                  width: widget.width ?? 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  offset: const Offset(1, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all<double>(6),
                    thumbVisibility: WidgetStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            Positioned(
              left: 6,
              top: -11,
              child: widget.dropdownName.isNotEmpty
                  ? Container(
                      color: Colors.white, // Match the background color
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          CommonText(
                            text: widget.dropdownName,
                            style: AppTypography.caption
                                .copyWith(color: AppColors.textNeutral35),
                          ),
                          widget.showAsterisk
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
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}

abstract class DropDownValues {
  int selectedId = -1;
  String getTitle();
  int getId();
  bool isSelected();
}
