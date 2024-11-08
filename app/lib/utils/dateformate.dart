import 'dart:developer';

import 'package:intl/intl.dart';

extension DateFormate on DateTime {
  String dateFormatoHHmmss() {
    try {
      return DateFormat('hh:mm:ss a').format(this);
    } catch (e) {
      return '';
    }
  }

  String dateFormatToyyyMMdd() {
    try {
      return DateFormat('yyyy-MM-dd').format(this);
    } catch (e) {
      return '';
    }
  }
}

extension DateFormatExtension on String {
  String dateFormatDdMMyyyy() {
    try {
      log("message $this");
      DateTime dateTime = DateTime.parse(this);
      return '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
    } catch (e) {
      return '';
    }
  }

  String dateFormatDdMMyyyyWithSlash() {
    try {
      log("message $this");
      DateTime dateTime = DateTime.parse(this);
      return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
    } catch (e) {
      return '';
    }
  }

  String dateFormatToDDMMYYYhhmma() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('dd/MM/yyyy - hh:mma').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  String dateFormatToddMMMyyyhmma() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('dd MMM yyyy h:mm a').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  String dateFormattoddMMMyyyy() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return "";
    }
  }

  String dateFormat() {
    try {
      DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(this);
      String dayWithSuffix = _getDayWithSuffix(parsedDate.day);
      String month = DateFormat('MMM').format(parsedDate);
      String year = DateFormat('yyyy').format(parsedDate);
      return '$dayWithSuffix $month $year';
    } catch (e) {
      return "";
    }
  }

  // Helper method to add suffix to the day
  String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  String convertTo12HourFormat() {
    try {
      DateTime dateTime = DateFormat("HH:mm:ss").parse(this);
      String time12Hour = DateFormat("hh:mm:ss a").format(dateTime);
      return time12Hour;
    } catch (e) {
      return "";
    }
  }

  String formatTimeWithoutIntl() {
    // Split the time string by space and colon
    List<String> parts = split(' ');
    List<String> timeParts = parts[0].split(':');

    // Concatenate hours and minutes, and keep the AM/PM part
    String formattedTime = '${timeParts[0]}:${timeParts[1]} ${parts[1]}';

    return formattedTime;
  }
}
