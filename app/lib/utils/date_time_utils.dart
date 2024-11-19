import 'package:app/utils/dateformate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime? selectedDate;
  static TimeOfDay? selectedTime;

  /// Display the date picker and optionally the time picker
  static Future<void> pickDateTime(BuildContext context,
      {bool pickTime = false}) async {
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
        await pickTimePicker(context, pickedDate: selectedDate);
      }
    }
  }

  /// Display the time picker
  static Future<void> pickTimePicker(BuildContext context,
      {DateTime? pickedDate}) async {
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
  }

  /// Format the selected date and time into the desired display format
  static String getFormattedDateTime() {
    if (selectedDate == null || selectedTime == null) {
      return DateTime.now().toIso8601String().dateFormatToDDMMYYYhhmma();
    }

    DateTime combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute);

    return combinedDateTime.toIso8601String().dateFormatToDDMMYYYhhmma();
  }

  /// Get the selected date in `dd-MM-yyyy` format
  static String getFormattedDate() {
    if (selectedDate == null) {
      return DateTime.now().toIso8601String().dateFormattodd_mm_yyyy();
    }
    return selectedDate!.toIso8601String().dateFormattodd_mm_yyyy();
  }

  /// Get the selected time in `hh:mm:ss` format (24-hour format)
  static String getFormattedTime() {
    if (selectedTime == null) {
      return DateTime.now().toIso8601String().convertTo24HourFormat();
    }

    final now = DateTime.now();
    DateTime combinedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    return combinedDateTime.toIso8601String().convertTo24HourFormat();
  }
}

extension DateOnlyCompare on DateTime {
  /// Compare only the year, month, and day of two dates
  DateTime dayOnly() => DateTime(year, month, day);
}
