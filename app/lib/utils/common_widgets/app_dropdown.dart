import 'package:app/themes_setup.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomAppDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final bool isMutiSelect;
  final bool showBorderColor;
  final String dropdownName;
  final bool showAstreik;
  final double? width;
  final bool displayZerothIndex;
  final Function(List<T> selectedValues) onMultiSelect;
  final Function(T selectedValue)? onSingleSelect;
  final BehaviorSubject<T?>? singleSelectItemSubject;
  final FormFieldValidator<T>? validator;
  final T? intialValue;
  final bool isDisable;
  final bool isSearchable;
  final String Function(T) itemAsString;

  const CustomAppDropdownButton({
    super.key,
    required this.items,
    required this.isMutiSelect,
    required this.dropdownName,
    required this.showAstreik,
    required this.showBorderColor,
    this.displayZerothIndex = false,
    this.width,
    this.validator,
    required this.onMultiSelect,
    this.onSingleSelect,
    this.intialValue,
    this.singleSelectItemSubject,
    this.isDisable = false,
    this.isSearchable = false,
    required this.itemAsString,
  });

  @override
  State<CustomAppDropdownButton<T>> createState() => _CustomAppDropdownButtonState<T>();
}

class _CustomAppDropdownButtonState<T> extends State<CustomAppDropdownButton<T>> {
  BehaviorSubject<List<T>> selectedItemsSubject = BehaviorSubject<List<T>>.seeded([]);
  late BehaviorSubject<T?> singleSelectItemSubject;
  late TextEditingController textEditingController;

  T? selectedValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    if (widget.displayZerothIndex && widget.items.isNotEmpty) {
      selectedItemsSubject.add([widget.items[0]]);
    }
    if (!widget.isMutiSelect) {
      singleSelectItemSubject = widget.singleSelectItemSubject ?? BehaviorSubject<T?>.seeded(null);
    }
  }

  @override
  void didUpdateWidget(covariant CustomAppDropdownButton<T> oldWidget) {
    if (oldWidget.intialValue != widget.intialValue && widget.intialValue != null) {
      singleSelectItemSubject.add(widget.intialValue);
    }
    super.didUpdateWidget(oldWidget);
  }

  // ... existing dispose method ...

  @override
  Widget build(BuildContext context) {
    return widget.isMutiSelect ? multiSelectDropDown() : singleSelectDropDown();
  }

  Widget singleSelectDropDown() {
    return StreamBuilder<T?>(
      stream: singleSelectItemSubject,
      builder: (context, snapshot) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            AbsorbPointer(
              absorbing: widget.isDisable,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField2<T>(
                  isExpanded: true,
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
                  validator: widget.validator,
                  items: widget.items
                      .map((T item) => DropdownMenuItem<T>(
                            value: item,
                            child: Text(
                              widget.itemAsString(item),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: singleSelectItemSubject.value,
                  onChanged: (value) {
                    if (value != null) {
                      widget.onSingleSelect!(value);
                      singleSelectItemSubject.add(value);
                    }
                  },
                  // ... rest of the existing properties ...
                ),
              ),
            ),
            // ... existing Positioned widget for dropdown name ...
          ],
        );
      },
    );
  }

  Widget multiSelectDropDown() {
    return StreamBuilder<List<T>>(
      stream: selectedItemsSubject.stream,
      builder: (context, snapshot) {
        List<T> selectedItems = snapshot.data ?? [];
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<T>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select ',
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          fontWeight: FontWeight.normal,
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
                                : selectedItems.add(item);

                            selectedItemsSubject.add(List.from(selectedItems));
                            widget.onMultiSelect(selectedItemsSubject.value);
                            menuSetState(() {});
                          },
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                if (isSelected)
                                  Icon(
                                    Icons.check_box,
                                    color: Theme.of(context).colorScheme.primary,
                                  )
                                else
                                  const Icon(
                                    Icons.check_box_outline_blank,
                                    color: AppColors.titleNeutral5,
                                  ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    widget.itemAsString(item),
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
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return widget.items.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          selectedItems.map(widget.itemAsString).join(', '),
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
                // ... rest of the existing properties ...
              ),
            ),
            // ... existing Positioned widget for dropdown name ...
          ],
        );
      },
    );
  }
}

// ... rest of the file remains unchanged ...