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
        BaseWidget(builder: (BuildContext context, AttendanceCalenderViewModel? model, Widget? child) {


          return AppStreamBuilder<Resource<StudentDetailsResponseModel>>(  stream: model!.studentDetails,
            initialData: Resource.none(),
            dataBuilder: (BuildContext context,  data) {
       return data?.status == Status.success
                ? AttendanceCalender(name: model.selectedStudent?.first.studentDisplayName??"",
              schoolName: data?.data?.data?.profile?.crtSchool??"",
              boardName:data?.data?.data?.profile?.crtBoard??"" ,stream: data?.data?.data?.profile?.streamName??"",
              grade: data?.data?.data?.profile?.crtGrade??"",
              course: data?.data?.data?.profile?.courseName??"",
              shift: data?.data?.data?.profile?.crtShift??"",
              division: data?.data?.data?.profile?.crtDivision??"",house: data?.data?.data?.profile?.crtHouse??"",

            ):const Center(
         child: CircularProgressIndicator(),
       )
              ;

          },);
        },
        providerBase: attendanceCalenderProvider,
)
        ],
      ),
    );
  }
}
