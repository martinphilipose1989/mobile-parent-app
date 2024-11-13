import 'package:app/utils/common_widgets/toggle_option_item.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/subjects.dart';

class ToggleOption<T> {
  const ToggleOption({required this.value, required this.text});

  final T value;
  final String text;
}

class ToggleOptionList<T> extends StatelessWidget {
  const ToggleOptionList(
      {super.key,
      required this.selectedValue,
      required this.options,
      this.spacing = 16,
      this.runSpacing = 16,
      this.onSelect});

  final BehaviorSubject<T> selectedValue;

  final List<ToggleOption<T>> options;
  final double spacing;
  final double runSpacing;
  final ValueSetter<T>? onSelect;

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<T>(
        stream: selectedValue,
        initialData: selectedValue.value,
        dataBuilder: (context, data) {
          return Wrap(
              spacing: spacing,
              runSpacing: runSpacing,
              children: options.map((option) {
                return ToggleOptionItem<T>(
                    value: option.value,
                    text: option.text,
                    selectedValue: data,
                    onSelect: () {
                      selectedValue.add(option.value);
                      onSelect?.call(option.value);
                    });
              }).toList());
        });
  }
}
