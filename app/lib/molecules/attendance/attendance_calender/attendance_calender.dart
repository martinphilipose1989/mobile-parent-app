import 'dart:core';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/attendance/attendance_calender/calendar.dart';

import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../themes_setup.dart';
import '../../../utils/stream_builder/app_stream_builder.dart';
import '../attandance_details/student_details.dart' as studeuntdetailsmolecule;
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
  String? image;
  AttendanceCalender(
      {super.key,
      this.name,
      this.course,
      this.house,
      this.division,
      this.schoolName,
      this.stream,
      this.boardName,
      this.grade,
      this.shift,
      this.image});

  final List<Map<String, String>> events = const [
    {
      "title": "75th Independence Day",
      "description": "Animation is a method in which figures move.",
      "date": "15-08-2021"
    },
    {
      "title": "National Day of Yoga",
      "description": "Independence Day is celebrated annually on 15 August.",
      "date": "25-08-2021"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            studeuntdetailsmolecule.StudentDetails(
                image: image,
                name: name ?? "",
                title: "$schoolName|$boardName",
                subtitle: "$course| $shift| $division| $house | $grade",
                subtitle2: "Stream: $stream"),
            SizedBox(height: 20.h, width: double.infinity),
            BaseWidget(
              builder: (BuildContext context, AttendanceCalenderViewModel? model,
                  Widget? child) {
                return AppStreamBuilder<Resource<AttendanceCountResponseModel>>(
                  stream: model!.getAttendancelist,
                  dataBuilder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 350.h, child: const Calendar()),
                        SizedBox(height: 20.h, width: double.infinity),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: CommonText(
                            text: "Upcoming Events",
                            style: AppTypography.subtitle1,
                          ),
                        ),
                        SizedBox(height: 20.h, width: double.infinity),
                        snapshot?.status == Status.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                             itemCount: events.length,
                             separatorBuilder: (context, index) => const SizedBox(height: 12),
                             itemBuilder: (context, index) {
                               final event = events[index];
                               return Container(
                                 padding: const EdgeInsets.all(16),
                                 decoration: BoxDecoration(
                                   color: Color(0xFFFF8A80).withOpacity(0.5),
                                   borderRadius: BorderRadius.circular(12),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black12,
                                       blurRadius: 6,
                                       spreadRadius: 2,
                                     ),
                                   ],
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       event['title']!,
                                       style: const TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.black,
                                       ),
                                     ),
                                     const SizedBox(height: 4),
                                     Text(
                                       event['description']!,
                                       style: const TextStyle(
                                         fontSize: 14,
                                         color: Colors.black54,
                                       ),
                                     ),
                                     const SizedBox(height: 8),
                                     Text(
                                       "Date: ${event['date']!}",
                                       style: const TextStyle(
                                         fontSize: 12,
                                         color: Colors.grey,
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             },
                            )
                                 // Row(
                                 //    mainAxisAlignment:
                                 //        MainAxisAlignment.spaceEvenly,
                                 //    children: [
                                 //      AttendanceCountTile(
                                 //        count:
                                 //            snapshot?.data?.data.totalDays ?? "0",
                                 //        countType: 'Total Days',
                                 //        textColor:
                                 //            Theme.of(context).colorScheme.primary,
                                 //      ),
                                 //      AttendanceCountTile(
                                 //        count:
                                 //            snapshot?.data?.data.presentDaysCount ??
                                 //                "0",
                                 //        countType: 'Present Days',
                                 //        textColor: AppColors.success,
                                 //      ),
                                 //      AttendanceCountTile(
                                 //        count:
                                 //            snapshot?.data?.data.absentDaysCount ??
                                 //                "0",
                                 //        countType: 'Absent Days',
                                 //        textColor: AppColors.failure,
                                 //      ),
                                 //    ],
                                 //  )
        
                          ,
                      //  const Text("Coming Soon!!!"),
                        SizedBox(height: 10.h, width: double.infinity)
                      ],
                    );
                  },
                  initialData: Resource.none(),
                );
              },
              providerBase: attendanceCalenderProvider,
            ),
            SizedBox(height: 20.h, width: double.infinity),
          ],
        ),
      ),
    );
  }
}
