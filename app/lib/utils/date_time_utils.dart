import 'package:flutter/material.dart';

class DateTimeUtils {
  static DateTime? selectedDate;
  static TimeOfDay? selectedTime;

  /// Display the date picker and optionally the time picker
  static Future<void> pickDateTime(BuildContext context,
      {bool pickTime = false,
      void Function(DateTime selectedDateTime)? onSelect}) async {
    DateTime now = DateTime.now();

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;
    selectedDate = pickedDate;

    if (pickTime) {
      if (context.mounted) {
        await pickTimePicker(context,
            pickedDate: selectedDate, onSelect: onSelect);
      }
    } else {
      onSelect?.call(pickedDate);
    }
  }

  /// Display the time picker
  static Future<void> pickTimePicker(BuildContext context,
      {DateTime? pickedDate,
      void Function(DateTime selectedDateTime)? onSelect}) async {
    TimeOfDay nowTime = TimeOfDay.now();

    // Ensure valid time picker behavior
    TimeOfDay initialTime =
        pickedDate?.isAtSameMomentAs(DateTime.now().toLocal().dayOnly()) ??
                false
            ? nowTime.replacing(
                minute: nowTime.minute + 1) // Ensure valid initial time
            : const TimeOfDay(hour: 0, minute: 0);

    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);

    if (pickedTime == null) return;
    selectedTime = pickedTime;
    DateTime combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute);
    onSelect?.call(combinedDateTime);
  }
}

extension DateOnlyCompare on DateTime {
  /// Compare only the year, month, and day of two dates
  DateTime dayOnly() => DateTime(year, month, day);
}
