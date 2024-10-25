import 'dart:ffi';

import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:data/data.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'attendance_details_page_view.dart';

import 'attendance_details_view_model.dart';


class AttendanceDetailsPage extends BasePage<AttendanceDetailsViewModel> {
  AttendanceDetailPageParameter attendanceDetailPageParameter;

  AttendanceDetailsPage({required this.attendanceDetailPageParameter});

  @override
  State<AttendanceDetailsPage> createState() => _AttendanceDetailsPageState();

 }

class _AttendanceDetailsPageState extends AppBasePageState<
    AttendanceDetailsViewModel, AttendanceDetailsPage> {
  @override
  void onModelReady(AttendanceDetailsViewModel model) {
//widget.attendanceDetailPageParameter.studentId??
//widget.attendanceDetailPageParameter.fromDate??DateTime.now()
    //widget.attendanceDetailPageParameter.toDate??DateTime.now()
    model.selectedStudent = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;
    print(model.selectedStudent?.first.id.toString() );
    model.getAttendance(
        model: AttendanceDetailsRequestModel(
            studentId: [model.selectedStudent?.first.id.toString() ?? "10"],
            attendanceStartDate:
                widget.attendanceDetailPageParameter.fromDate.toString(),
            attendanceEndDate:
                widget.attendanceDetailPageParameter.fromDate.toString()));
  }

  @override
  PreferredSizeWidget? buildAppbar(AttendanceDetailsViewModel model) {
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
  Widget buildView(BuildContext context, AttendanceDetailsViewModel model) {
    // TODO: implement buildView
    return AttendanceDetailsPageView(provideBase());
  }

  @override
  ProviderBase<AttendanceDetailsViewModel> provideBase() {
    return attendanceDetailsProvider;
  }
}

class AttendanceDetailPageParameter {
  List<String>? studentId;
  String? toDate;
  String? fromDate;

  AttendanceDetailPageParameter({this.studentId, this.toDate, this.fromDate}); // toJson method
  Map<String, dynamic> toJson() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return {
      'studentId': studentId,
      'toDate': toDate,
      'fromDate': fromDate,
    };

  }

  // fromJson method
  factory AttendanceDetailPageParameter.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailPageParameter(
      studentId: (json['studentId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      toDate: json['toDate'],
      fromDate: json['fromDate'],
    );
  }
}
