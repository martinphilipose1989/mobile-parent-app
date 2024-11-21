import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CommonDatePickerWidget extends StatefulWidget {
  final String? labelName;
  DateTime? initialDate;
  DateTime? lastDate;
  final bool isDisabled;
  final bool showAstreik;
  final Function(DateTime?)? onDateSelected;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isDOB;

  CommonDatePickerWidget({
    super.key,
    this.labelName,
    this.initialDate,
    this.isDisabled = false,
    this.showAstreik = false,
    this.onDateSelected,
    this.validator,
    required this.controller,
    this.isDOB = false,
    this.lastDate,
  });

  @override
  CommonDatePickerWidgetState createState() => CommonDatePickerWidgetState();
}

class CommonDatePickerWidgetState extends State<CommonDatePickerWidget> {
  @override
  void initState() {
    super.initState();
    // Set the initial value for the controller
    widget.controller.text = widget.initialDate != null
        ? formatDateToDDMMYYYY(widget.initialDate!)
        : '';
  }

  String formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: widget.isDOB
          ? widget.lastDate ?? DateTime(DateTime.now().year - 1)
          : DateTime(2101),
    );

    if (picked != null) {
      widget.controller.text = formatDateToDDMMYYYY(picked); // Update controller
      widget.onDateSelected?.call(picked); // Notify listener
      setState(() {
        widget.initialDate = picked; // Update the internal state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: '[DD/MM/YYYY]',
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today), // Replace with Svg if needed
              onPressed: () {
                if (!widget.isDisabled) {
                  _selectDate(context);
                }
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
        if (widget.labelName != null)
          Positioned(
            left: 6,
            top: -11,
            child: Container(
              color: Colors.white, // Match background color
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    widget.labelName ?? "",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  if (widget.showAstreik)
                    Text(
                      ' *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
