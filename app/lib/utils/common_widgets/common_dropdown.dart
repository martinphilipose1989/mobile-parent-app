import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CommonDropDownWidget extends StatefulWidget {
  final List<String> items;
  final bool isMultiSelect;
  final String label;
  final void Function(List<String> selectedItems)? onSelectionChanged;

  const CommonDropDownWidget({
    super.key,
    required this.items,
    required this.isMultiSelect,
    required this.label,
    this.onSelectionChanged,
  });

  @override
  CommonDropDownWidgetState createState() => CommonDropDownWidgetState();
}

class CommonDropDownWidgetState extends State<CommonDropDownWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<String>? _selectedItems;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FormBuilderDropdown<String>(
            name: 'dropdown',
            decoration: InputDecoration(
              labelText: 'Select ${widget.isMultiSelect ? 'items' : 'item'}',
            ),
            items: widget.items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                if (widget.isMultiSelect) {
                  // _selectedItems =
                  //     value != null ? List<String>.from(value) : null;
                } else {
                  _selectedItems = value != null ? [value] : null;
                }
                if (widget.onSelectionChanged != null) {
                  widget.onSelectionChanged!(_selectedItems ?? []);
                }
              });
            },
            // multipleItems: widget.isMultiSelect,
            valueTransformer: (value) {
              if (widget.isMultiSelect) {
                //return value != null ? List<String>.from(value) : null;
              } else {
                return value != null ? value : null;
              }
            },
          ),
          SizedBox(height: 10),
          if (_selectedItems != null && _selectedItems!.isNotEmpty)
            Text(
              'Selected: ${_selectedItems!.join(', ')}',
              style: TextStyle(fontSize: 14.0),
            ),
        ],
      ),
    );
  }
}
