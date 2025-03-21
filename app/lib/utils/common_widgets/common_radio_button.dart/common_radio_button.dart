import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CommonRadioButton<T> {
  final BehaviorSubject<T?> _selectedItem;

  CommonRadioButton(T? initialValue)
      : _selectedItem = BehaviorSubject<T?>.seeded(initialValue);

  Stream<T?> get selectedItemStream => _selectedItem.stream;

  T? get selectedItem => _selectedItem.value;

  void selectItem(T? item) {
    _selectedItem.add(item);
  }

  void dispose() {
    _selectedItem.close();
  }
}

class CommonRadioButtonWidget<T> extends StatelessWidget {
  final Function(T?)? onOptionSelected;
  final CommonRadioButton<T> commonRadioButton;
  final T value;
  final String title;
  final bool isTogglableWithValue;

  const CommonRadioButtonWidget({
    super.key,
    required this.commonRadioButton,
    required this.value,
    required this.title,
    this.onOptionSelected,
    this.isTogglableWithValue = false
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: commonRadioButton.selectedItemStream,
      builder: (context, snapshot) {
        return RadioListTile<T>(
          contentPadding: const EdgeInsets.all(0),
          title: Text(title),
          value: value,
          activeColor: Theme.of(context).colorScheme.primary,
          groupValue: snapshot.data,
          onChanged: (T? newValue) {
            if(isTogglableWithValue){
              if(newValue != null){
                commonRadioButton.selectItem(newValue);
              }
            }
            else{
              commonRadioButton.selectItem(newValue);
            }
            onOptionSelected?.call(newValue);
          },
          toggleable: isTogglableWithValue,
        );
      },
    );
  }
}
