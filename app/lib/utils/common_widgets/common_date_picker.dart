import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonDatePickerWidget extends StatefulWidget {
  final String? labelName;
  final DateTime? initialDate;
  final bool isDisabled;
  const CommonDatePickerWidget(
      {super.key, this.labelName, this.initialDate, this.isDisabled = false});

  @override
  CommonDatePickerWidgetState createState() => CommonDatePickerWidgetState();
}

class CommonDatePickerWidgetState extends State<CommonDatePickerWidget> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    if (widget.initialDate != null) {
      _dateController.text =
          DateFormat('dd/MM/yyyy').format(widget.initialDate!);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonDatePickerWidget oldWidget) {
    if (oldWidget.initialDate != widget.initialDate &&
        widget.initialDate != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dateController.text =
            DateFormat('dd/MM/yyyy').format(widget.initialDate!);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelName == null
            ? const SizedBox()
            : Text(
                widget.labelName ?? "",
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
        widget.labelName == null ? const SizedBox() : const SizedBox(height: 8),
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
            hintText: '[DD/MM/YYYY]',
            prefixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_outlined),
              onPressed: () {
                _selectDate(context);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          readOnly: true,
          onTap: () {
            if (!widget.isDisabled) {
              _selectDate(context);
            }
          },
        ),
      ],
    );
  }
}
