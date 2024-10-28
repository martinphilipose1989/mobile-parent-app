import 'dart:core';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/attendance/attendance_calender/calendar.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../../utils/common_widgets/app_images.dart';
import '../../../utils/stream_builder/app_stream_builder.dart';
import '../attandance_details/student_details.dart';
import 'attendance_count.dart';

class AttendanceCalender extends StatelessWidget {
 String? name;
 String? schoolName;
  String? boardName;
 String? grade;
 String? shift;
 String? division;
 String? stream;
 String? course;
 String? house;

 AttendanceCalender({
    super.key, this.name,this.course,this.house, this.division,this.schoolName,this.stream  ,this.boardName, this.grade,  this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentDetails(
            image: AppImages.personIcon,
            name: name??"",
            title: "$schoolName|$boardName",
            subtitle: "$course| $shift| $division| $house",
            subtitle2: "$stream|NA"),
          SizedBox(height: 20.h, width: double.infinity),
          BaseWidget(
          builder: (BuildContext context, AttendanceCalenderViewModel? model, Widget? child) {
         return   AppStreamBuilder<Resource<AttendanceCountResponseModel>>(
           stream: model!.getAttendancelist,
           dataBuilder: (context, snapshot) {
             return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left:5),
                      child: CommonText(
                        text: "Attendance",
                        style: AppTypography.subtitle1,
                      ),
                    ),
                    SizedBox(height: 20.h, width: double.infinity),
                  snapshot?.status==Status.loading?const Center(child: CircularProgressIndicator()): snapshot?.data?.data.attendanceSummary!=[]? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AttendanceCountTile(

                          count: snapshot?.data?.data.totalDays??"0",
                          countType: 'Total Days',
                          textColor: Theme.of(context).colorScheme.primary,
                        ),
                  AttendanceCountTile(
                          count: snapshot?.data?.data.presentDaysCount??"0",
                          countType: 'Present Days',
                          textColor: AppColors.success,
                        ),
          AttendanceCountTile(
                          count: snapshot?.data?.data.absentDaysCount??"0",
                          countType: 'Absent Days',
                          textColor: AppColors.failure,
                        )
                      ],
                    ):CommonText(text: "No data Available"),
                    SizedBox(height: 10.h, width: double.infinity)
                  ],
                );
           }, initialData: Resource.none(),
         );

          },
          providerBase: attendanceCalenderProvider,

        ),
  SizedBox(height: 20.h, width: double.infinity),
        SizedBox(height: 350.h, child: const Calendar())
      ],
    );
  }
}
