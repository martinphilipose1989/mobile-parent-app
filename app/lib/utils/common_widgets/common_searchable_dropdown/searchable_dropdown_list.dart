import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class CommonSearchableDropDown extends StatefulWidget {
  final List<String> items;
  final bool isMutiSelect;
  final bool showBorderColor;
  final String dropdownName;
  final bool showAstreik;
  final double? width;
  final bool displayZerothIndex;
  final Function(List<String> selectedValues)? onMultiSelect;
  final Function(String selectedValue)? onSingleSelect;
  final BehaviorSubject<String>? singleSelectItemSubject;
  const CommonSearchableDropDown(
      {super.key,
      required this.items,
      required this.isMutiSelect,
      required this.dropdownName,
      required this.showAstreik,
      required this.showBorderColor,
      this.displayZerothIndex = false,
      this.width,
      this.onMultiSelect,
      this.onSingleSelect,
      this.singleSelectItemSubject});

  @override
  State<CommonSearchableDropDown> createState() =>
      _CommonSearchableDropDownState();
}

class _CommonSearchableDropDownState extends State<CommonSearchableDropDown> {
  BehaviorSubject<List<String>> selectedItemsSubject =
      BehaviorSubject<List<String>>.seeded([]);

  late BehaviorSubject<String> singleSelectItemSubject;

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.displayZerothIndex) {
      List<String> addedZerothIndex = [];
      addedZerothIndex.add(widget.items[0]);
      selectedItemsSubject.add(addedZerothIndex);
    }
    if (!widget.isMutiSelect) {
      singleSelectItemSubject =
          widget.singleSelectItemSubject ?? BehaviorSubject<String>.seeded('');
    }
  }

  @override
  void dispose() {
    selectedItemsSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DropdownSearch<String>(
          items: (filter, _) => widget.items,
          // asyncItems: (text) {

          // },
          onChanged: (value) {
            widget.onSingleSelect!(value ?? "");
            singleSelectItemSubject.add(value ?? "");
          },
          selectedItem: singleSelectItemSubject.value == ''
              ? null
              : singleSelectItemSubject.value,

          // dropdownButtonProps: DropdownButtonProps(
          //   constraints: BoxConstraints(
          //     maxWidth: widget.width ?? 100.w,
          //     minHeight: 40.h,
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 14.w),
          //   color: Colors.white,
          //   icon: const Icon(
          //     Icons.keyboard_arrow_down_sharp,
          //     color: Colors.black,
          //   ),
          //   iconSize: 14.r,
          // ),

          // dropdownDecoratorProps: const DropDownDecoratorProps(),
          decoratorProps: DropDownDecoratorProps(),

          popupProps: PopupProps.dialog(
            dialogProps: DialogProps(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
            ),
            showSearchBox: true,
            fit: FlexFit.tight,
            itemBuilder: (context, item, isDisabled, isSelected) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  CommonText(
                    text: item,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Divider(height: 1, color: AppColors.textGray),
                ],
              );
            },
          ),
        ),
        Positioned(
          left: 6,
          top: -11,
          child: widget.dropdownName != ''
              ? Container(
                  color: Colors
                      .white, // Match the background color to avoid overlap
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      CommonText(
                        text: widget.dropdownName,
                        style: AppTypography.caption
                            .copyWith(color: AppColors.textNeutral35),
                      ),
                      widget.showAstreik
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
  }
}
