import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String?> items;
  final bool isMutiSelect;
  final bool showBorderColor;
  final String dropdownName;
  final bool showAstreik;

  final String? selectedValue;
  final double? width;
  final bool displayZerothIndex;
  final Function(List<String> selectedValues) onMultiSelect;
  final Function(String selectedValue)? onSingleSelect;
  final String? Function(String?)? validator;
  const CustomDropdownButton(
      {super.key,
      required this.items,
      required this.isMutiSelect,
      required this.dropdownName,
      required this.showAstreik,
      required this.showBorderColor,
      this.displayZerothIndex = false,
      this.width,
      this.selectedValue,
      required this.onMultiSelect,
      this.validator,
      this.onSingleSelect});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  BehaviorSubject<List<String>> selectedItemsSubject =
      BehaviorSubject<List<String>>.seeded([]);

  BehaviorSubject<String> singleSelectItemSubject =
      BehaviorSubject<String>.seeded('');

  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.items);
    eitherDisplayZerothIndexOrSelectedName();
  }

  void eitherDisplayZerothIndexOrSelectedName() {
    if (widget.displayZerothIndex) {
      List<String> addedZerothIndex = [];
      addedZerothIndex.add(widget.items[0] ?? '');
      selectedItemsSubject.add(addedZerothIndex);
    } else {
      for (var element in widget.items) {
        if (element == widget.selectedValue) {
          List<String> tempList = [];
          tempList.add(element ?? "");
          selectedItemsSubject.add(tempList);
        }
      }
    }
  }

  @override
  void dispose() {
    selectedItemsSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMutiSelect ? multiSelectDropDown() : singleSelectDropDown();
  }

  Widget singleSelectDropDown() {
    return StreamBuilder(
      stream: singleSelectItemSubject,
      builder: (context, snapshot) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField2<String>(
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
                    .map((String? item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: singleSelectItemSubject.value == ''
                    ? null
                    : singleSelectItemSubject.value,
                onChanged: (value) {
                  widget.onSingleSelect?.call(value ?? '');
                  singleSelectItemSubject.add(value ?? "");
                },
                buttonStyleData: ButtonStyleData(
                  height: 48.h,
                  width: widget.width ?? 175.w,
                  //  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
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
      },
    );
  }

  Widget multiSelectDropDown() {
    return StreamBuilder<List<String>>(
      stream: selectedItemsSubject.stream,
      builder: (context, snapshot) {
        List<String> selectedItems = snapshot.data ?? [];
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                validator: widget.validator,

                hint: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select ',
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          fontWeight: FontWeight.normal, // Regular
                          fontSize: 16,
                          color: Colors.black,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: widget.items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        final isSelected = selectedItems.contains(item);
                        return InkWell(
                          onTap: () {
                            isSelected
                                ? selectedItems.remove(item)
                                : selectedItems.add(item ?? "");

                            selectedItemsSubject.add(List.from(selectedItems));
                            widget.onMultiSelect(selectedItemsSubject.value);
                            menuSetState(() {}); // This will rebuild the icons
                          },
                          child: Container(
                            height: double.infinity,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                if (isSelected)
                                  Icon(
                                    Icons.check_box,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                else
                                  const Icon(
                                    Icons.check_box_outline_blank,
                                    color: AppColors.titleNeutral5,
                                  ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    "AY $item",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return widget.items.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          selectedItems.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                buttonStyleData: ButtonStyleData(
                  height: 48.h,
                  width: widget.width ?? 175.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
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
            )
          ],
        );
      },
    );
  }
}

class DropdownData {
  final String name;
  final int id;

  DropdownData({required this.name, required this.id});
}
