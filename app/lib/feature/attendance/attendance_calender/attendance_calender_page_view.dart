//import 'package:app/molecules/tracker/AttendanceCalender/AttendanceCalender_list.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_calender/attendance_calender_view_model.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../../model/resource.dart';
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
          BaseWidget(
            builder: (BuildContext context, AttendanceCalenderViewModel? model,
                Widget? child) {
              return AppStreamBuilder<Resource<StudentDetailsResponseModel>>(
                stream: model!.studentDetails,
                initialData: Resource.none(),
                dataBuilder: (BuildContext context, data) {
                  return data?.status == Status.success
                      ? AttendanceCalender(
                          image: data?.data?.data?.profile?.profileImageUrl,
                          name:
                              model.selectedStudent?.first.studentDisplayName ??
                                  "N/A",
                          schoolName:
                              data?.data?.data?.profile?.crtSchool ?? "N/A",
                          boardName:
                              data?.data?.data?.profile?.crtBoard ?? "N/A",
                          stream:
                              data?.data?.data?.profile?.streamName ?? "N/A",
                          grade: data?.data?.data?.profile?.crtGrade ?? "N/A",
                          course:
                              data?.data?.data?.profile?.courseName ?? "N/A",
                          shift: data?.data?.data?.profile?.crtShift ?? "N/A",
                          division:
                              data?.data?.data?.profile?.crtDivision ?? "N/A",
                          house: data?.data?.data?.profile?.crtHouse ?? "N/A",
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              );
            },
            providerBase: attendanceCalenderProvider,
          )
        ],
      ),
    );
  }
}
