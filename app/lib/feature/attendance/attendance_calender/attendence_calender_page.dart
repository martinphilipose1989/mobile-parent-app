import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'attendance_calender_page_view.dart';
import 'attendance_calender_view_model.dart';

class AttendanceCalenderPage extends BasePage<AttendanceCalenderViewModel> {
  const AttendanceCalenderPage({super.key});

  @override
  State<AttendanceCalenderPage> createState() => _AttendanceCalenderPageState();
}

class _AttendanceCalenderPageState extends AppBasePageState<
    AttendanceCalenderViewModel, AttendanceCalenderPage> {
  @override
  void onModelReady(AttendanceCalenderViewModel model) {
    model.selectedStudent = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;

    if (model.selectedStudent!.isEmpty ||
        model.selectedStudent?.first.id == null) {
      return;
    } else {
      model.getStudentDetail(id: model.selectedStudent?.first.id);
    }
  }

  @override
  PreferredSizeWidget? buildAppbar(AttendanceCalenderViewModel model) {
    return  CommonAppBar(
      appbarTitle: Strings.of(context).student_profile,
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, AttendanceCalenderViewModel model) {
    return AttendanceCalenderPageView(provideBase());
  }

  @override
  ProviderBase<AttendanceCalenderViewModel> provideBase() {
    return attendanceCalenderProvider;
  }
}
