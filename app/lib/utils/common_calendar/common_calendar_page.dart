import 'package:app/di/states/viewmodels.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_calendar/common_calendar_model.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonCalendarPage extends StatelessWidget {
  final Function(String) onDateSelected;
  final DateTime? initialDate;
  const CommonCalendarPage({super.key, required this.onDateSelected,this.initialDate});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommonCalendarModel>(
        builder: (context, model, child) {
          model!.selectedDate.value = initialDate??DateTime.now();
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: AppColors.textPaleGray),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AppStreamBuilder<DateTime>(
                    stream: model.selectedDate,
                    initialData: model.selectedDate.value,
                    dataBuilder: (context, data) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: model.nextSevenDays.map((date) {
                          bool isSelected = date.day ==
                                  model.selectedDate.value.day &&
                              date.month == model.selectedDate.value.month &&
                              date.year == model.selectedDate.value.year;
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                if(date.weekday == DateTime.sunday){
                                  return;
                                }
                                model.selectedDate.add(date);
                                onDateSelected(model.dateFormatter.format(date));
                              },
                              child: Container(
                                height: 68.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      :(date.weekday == DateTime.sunday) ? AppColors.primary.withOpacity(0.05) :  Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  children: [
                                    CommonText(
                                      text: model.dayFormat
                                          .format(date)
                                          .toUpperCase(),
                                      style: AppTypography.overline.copyWith(
                                        letterSpacing: 0.25,
                                        color: isSelected
                                            ? Colors.white
                                            : (date.weekday == DateTime.sunday) ? AppColors.textGray.withOpacity(0.3) : AppColors.textGray,
                                      ),
                                    ),
                                    CommonText(
                                      text: model.dateFormat.format(date),
                                      style: AppTypography.body1.copyWith(
                                        fontSize: 16,
                                        color: isSelected
                                            ? Colors.white
                                            : (date.weekday == DateTime.sunday) ? AppColors.textGray.withOpacity(0.3) : AppColors.textGray,
                                      ),
                                    ),
                                    CommonText(
                                      text: model.monthFormat
                                          .format(date)
                                          .toUpperCase(),
                                      style: AppTypography.overline.copyWith(
                                        letterSpacing: 0.25,
                                        color: isSelected
                                            ? Colors.white
                                            : (date.weekday == DateTime.sunday)
                                                ? AppColors.textGray
                                                    .withOpacity(0.3)
                                                : AppColors.textGray,
                                      ),
                                    ),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: isSelected
                                            ? Colors.white
                                            : (date.weekday == DateTime.sunday) ? null : AppColors.primary,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )),
            ),
          );
        },
        providerBase: commonCalendarModelProvider);
  }
}
