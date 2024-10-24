//import 'package:app/molecules/tracker/AttendanceDetails/AttendanceDetails_list.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_list1/attendance_details_view_model.dart';
import 'package:app/molecules/attendance/attandance_details/attendance_list.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../model/resource.dart';
import '../../../molecules/attendance/attandance_details/attendance_details.dart';
import '../../../molecules/disciplinarySlip/disciplinary_slip_list_item.dart';
import '../../../utils/stream_builder/app_stream_builder.dart';

class AttendanceDetailsPageView extends BasePageViewWidget {
  AttendanceDetailsPageView(super.providerBase, );

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding:  EdgeInsets.all(16),
      child: BaseWidget(builder: (BuildContext context, AttendanceDetailsViewModel? model,
          Widget? child){

     return   AppStreamBuilder<Resource<AttendanceDetailsResponseModel>>(
          stream: model!.getAttendanceDetail,
          dataBuilder: (context, snapshot) {
            return

              snapshot?.data!.data.data.isNotEmpty==true?Column(
              children: [
                CommonSizedBox.sizedBox(height: 20, width: 10),
                AttendanceDetails(date: dateFormatToDDMMYYYhhmma(snapshot!.data!.data.data.first.attendanceDate.toString())),
                SizedBox(height:MediaQuery.of(context).size.height*0.6,child:  const AttendanceList())
              ],
            ):const CircularProgressIndicator();
          }, initialData:Resource.none(),
        );
      }, providerBase: attendanceDetailsProvider,

      ),
    );
  }
}
