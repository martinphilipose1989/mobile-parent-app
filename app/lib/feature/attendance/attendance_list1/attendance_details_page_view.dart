//import 'package:app/molecules/tracker/AttendanceDetails/AttendanceDetails_list.dart';
import 'package:app/molecules/attendance/attandance_details/attendance_list.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../molecules/attendance/attandance_details/attendance_details.dart';

class AttendanceDetailsPageView extends BasePageViewWidget {
  AttendanceDetailsPageView(super.providerBase, );

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const AttendanceDetails(date: '20/4/2024',),
         SizedBox(height:MediaQuery.of(context).size.height*0.6,child: const AttendanceList())
        ],
      ),
    );
  }
}
