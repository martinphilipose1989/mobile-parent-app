import 'package:app/molecules/attendance/attendance_calender/calendar.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/common_widgets/app_images.dart';
import '../attandance_details/student_details.dart';
import 'attendance_count.dart';

class AttendanceCalender extends StatelessWidget {
  const AttendanceCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentDetails(
            image: AppImages.personIcon,
            name: "Khevna Shah",
            title: "Vibgyor Schools|CBSE",
            subtitle: "Regular| Shift| Grade V",
            subtitle2: "Stream|NA"),
        SizedBox(height: 20, width: double.infinity),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: const CommonText(
                text: "Attendance",
                style: AppTypography.subtitle1,
              ),
            ),
            SizedBox(height: 20, width: double.infinity),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AttendanceCountTile(

                  count: 28,
                  countType: 'Total Days',
                  textColor: Theme.of(context).colorScheme.primary,
                ),
                const AttendanceCountTile(
                  count: 28,
                  countType: 'Present Days',
                  textColor: AppColors.success,
                ),
                const AttendanceCountTile(
                  count: 28,
                  countType: 'Absent Days',
                  textColor: AppColors.failure,
                )
              ],
            ),
            SizedBox(height: 10.h, width: double.infinity)
          ],
        ),
        const SizedBox(height: 20, width: double.infinity),
        SizedBox(height: 350.h, child: const Calendar())
      ],
    );
  }
}
