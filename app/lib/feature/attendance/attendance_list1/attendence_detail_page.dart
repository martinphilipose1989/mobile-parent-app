import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:data/data.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'attendance_details_page_view.dart';

import 'attendance_details_view_model.dart';

// ignore: must_be_immutable
class AttendanceDetailsPage extends BasePage<AttendanceDetailsViewModel> {
  AttendanceDetailPageParameter attendanceDetailPageParameter;

  AttendanceDetailsPage(
      {super.key, required this.attendanceDetailPageParameter});

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
    debugPrint(model.selectedStudent?.first.id.toString());
    model.getAttendance(
        model: AttendanceDetailsRequestModel(
            studentId: [model.selectedStudent?.first.id.toString() ?? "10"],
            academicYearId: widget.attendanceDetailPageParameter.academicyearId,
            attendanceStartDate:
                widget.attendanceDetailPageParameter.fromDate.toString(),
            attendanceEndDate:
                widget.attendanceDetailPageParameter.fromDate.toString()));

    model.getStudentDetail(id: model.selectedStudent?.first.id);
  }

  @override
  PreferredSizeWidget? buildAppbar(AttendanceDetailsViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Student Attendance',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, AttendanceDetailsViewModel model) {
    return AttendanceDetailsPageView(provideBase());
  }

  @override
  ProviderBase<AttendanceDetailsViewModel> provideBase() {
    return attendanceDetailsProvider;
  }
}

class AttendanceDetailPageParameter {
  List<dynamic>? studentId;
  String? toDate;
  String? fromDate;
  int? academicyearId;

  AttendanceDetailPageParameter(
      {this.studentId,
      this.toDate,
      this.fromDate,
      this.academicyearId}); // toJson method
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'toDate': toDate,
      'fromDate': fromDate,
      'academicyearId': academicyearId
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
        academicyearId: json['academicyearId']);
  }
}
