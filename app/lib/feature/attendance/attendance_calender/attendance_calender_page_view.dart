//import 'package:app/molecules/tracker/AttendanceCalender/AttendanceCalender_list.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../../molecules/attendance/attendance_calender/attendance_calender.dart';

class AttendanceCalenderPageView extends BasePageViewWidget {
  AttendanceCalenderPageView(super.providerBase);

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CommonSizedBox.sizedBox(height: 20, width: 10),
         // const StudentDetails(image: image, name: name, title: title, subtitle: subtitle, subtitle2: subtitle2),
         const AttendanceCalender()
        ],
      ),
    );
  }
}
