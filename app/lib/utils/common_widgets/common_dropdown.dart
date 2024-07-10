import 'package:app/utils/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final bool isMutiSelect;
  const CustomDropdownButton(
      {super.key, required this.items, required this.isMutiSelect});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  BehaviorSubject<List<String>> selectedItemsSubject =
      BehaviorSubject<List<String>>.seeded([]);

  @override
  void dispose() {
    selectedItemsSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: selectedItemsSubject.stream,
      builder: (context, snapshot) {
        List<String> selectedItems = snapshot.data ?? [];
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
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
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(item);
                    return InkWell(
                      onTap: () {
                        if (!widget.isMutiSelect) {
                          selectedItems = [item];
                        } else {
                          isSelected
                              ? selectedItems.remove(item)
                              : selectedItems.add(item);
                        }
                        selectedItemsSubject.add(List.from(selectedItems));
                        menuSetState(() {}); // This will rebuild the icons
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            if (isSelected)
                              const Icon(
                                Icons.check_box_outlined,
                                color: AppColors.primary,
                              )
                            else
                              const Icon(
                                Icons.check_box_outline_blank,
                                color: AppColors.titleNeutral5,
                              ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item,
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
                    alignment: AlignmentDirectional.center,
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
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black26, width: 1),
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
              width: 200,
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
        );
      },
    );
  }
}

class DropdownData {
  final String dropDownValue;
  final bool isSelected;

  DropdownData({required this.dropDownValue, this.isSelected = false});
}
