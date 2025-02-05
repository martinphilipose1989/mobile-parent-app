import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import 'package:app/themes_setup.dart';

import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);
  DateTime get dayStart => DateTime(year, month, day);

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime selectedMonth;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  String converter(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (BuildContext context, AttendanceCalenderViewModel? model,
          Widget? child) {
        return Scaffold(
          body: Center(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Header(
                    selectedMonth: selectedMonth,
                    selectedDate: selectedDate,
                    onChange: (value) => setState(() {
                      selectedMonth = value;
                      model?.selectedmonth = selectedMonth;
                      debugPrint(selectedMonth.toString());
                      // model?.getAttendanceList(
                      //     model: AttendanceCountRequestModel(
                      //         studentId: model?.selectedStudent?.first.id,
                      //         attendanceDate:
                      //             DateFormatter.convertDateToYearMonth(
                      //                 selectedMonth),
                      //         academicYearId: model?.academicId ?? 26));
                    }),
                  ),
                  Expanded(
                    child: _Body(
                      selectedDate: selectedDate,
                      selectedMonth: selectedMonth,
                      selectDate: (DateTime value) => setState(() {
                        selectedDate = value;

                        // Navigator.pushNamed(
                        //     context, RoutePaths.attendanceDetailspage,
                        //     arguments: AttendanceDetailPageParameter(
                        //         academicyearId: model?.academicId,
                        //         studentId: [model?.selectedStudent?.first.id],
                        //         toDate: converter(selectedDate),
                        //         fromDate: converter(selectedDate)));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      providerBase: attendanceCalenderProvider,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('M',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('T',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('W',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('T',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('F',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('S',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
            Text('S',
                style: AppTypography.subtitle1
                    .copyWith(color: AppColors.textGray)),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: _RowItem(
                      hasRightBorder: false,
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({
    required this.hasRightBorder,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool hasRightBorder;
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isAfter(DateTime.now());

    return GestureDetector(
      onTap: isPassed ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        height: 35.h,
        decoration: isSelected
            ? BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle)
            : isToday
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
        child: Text(
          number.toString(),
          style: isSelected
              ? AppTypography.subtitle2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500)
              : TextStyle(
                  fontSize: 14.sp,
                  color: isPassed
                      ? isActiveMonth
                          ? Colors.grey
                          : Colors.transparent
                      : isActiveMonth
                          ? Colors.black
                          : AppColors.textGray),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.selectedMonth,
    required this.selectedDate,
    required this.onChange,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          CommonText(
            text: "Select Date",
            style: AppTypography.subtitle2.copyWith(color: AppColors.textGray),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${intToDay(selectedDate!.weekday)} ${intToMonth(selectedMonth.month)} ${selectedDate!.day}',
                  textAlign: TextAlign.left,
                  style: AppTypography.h6.copyWith(color: AppColors.textGray),
                ),
              ),
              IconButton(
                onPressed: () {
                  onChange(selectedMonth.addMonth(-1));
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 24.w,
                  color: AppColors.textGray,
                ),
              ),
              IconButton(
                onPressed: () {
                  onChange(selectedMonth.addMonth(1));
                },
                icon: Icon(
                  Icons.chevron_right,
                  size: 24.w,
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarMonthData {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);
  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const CalendarMonthData({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;

    return (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
  }

  List<List<CalendarDayData>> get weeks {
    final res = <List<CalendarDayData>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDayData>.generate(
        7,
        (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDayData(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}

class CalendarDayData {
  final DateTime date;
  final bool isActiveMonth;
  final bool isActiveDate;

  const CalendarDayData({
    required this.date,
    required this.isActiveMonth,
    required this.isActiveDate,
  });
}

String intToMonth(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "Invalid month";
  }
}

String intToDay(int day) {
  switch (day) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
    default:
      return "Invalid day";
  }
}
