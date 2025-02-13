import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'student_detail_page_viewmodel.dart';
import 'student_detail_pageview.dart';

class StudentDetailPage extends BasePage<StudentDetailPageViewModel> {
  StudentDetailPage({super.key});

  @override
  StudentDetailPageState createState() => StudentDetailPageState();
}

class StudentDetailPageState
    extends AppBasePageState<StudentDetailPageViewModel, StudentDetailPage> {
  @override
  Widget buildView(BuildContext context, StudentDetailPageViewModel model) {
    return StudentDetailPageView(
      provideBase(),
    );
  }

  @override
  ProviderBase<StudentDetailPageViewModel> provideBase() {
    return studentDetailPageViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(StudentDetailPageViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.selectedStudent = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;
    if (model.selectedStudent!.isEmpty ||
        model.selectedStudent?.first.id == null) {
      return;
    } else {
      final student = model.selectedStudent?.first.id;
      model.getStudentDetail(studentId: student);
    }
    super.onModelReady(model);

    model.getBearerList(studentId: model.selectedStudent?.first.id);
  }

  // @override
  // PreferredSizeWidget? buildAppbar(StudentDetailPageViewModel model) {
  //   return const CommonAppBar(
  //       appbarTitle: "Student Profile", showBackButton: true);
  // }
}
