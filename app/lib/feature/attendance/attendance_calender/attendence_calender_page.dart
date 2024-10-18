import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/attendance/attendance_list1/attendance_details_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'attendance_calender_page_view.dart';
import 'attendance_calender_view_model.dart';

class AttendanceCalenderPage extends BasePage<AttendanceCalenderViewModel> {
  const AttendanceCalenderPage({super.key});

  @override
  State<AttendanceCalenderPage> createState() => _AttendanceCalenderPageState();
}

class _AttendanceCalenderPageState
    extends AppBasePageState<AttendanceCalenderViewModel, AttendanceCalenderPage> {
  @override
  void onModelReady(AttendanceCalenderViewModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(AttendanceCalenderViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Student Attendance',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,

    );
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, AttendanceCalenderViewModel model) {
    // TODO: implement buildView
    return AttendanceCalenderPageView(provideBase());
  }

  @override
  ProviderBase<AttendanceCalenderViewModel> provideBase() {
    return attendanceCalenderProvider;
  }
}