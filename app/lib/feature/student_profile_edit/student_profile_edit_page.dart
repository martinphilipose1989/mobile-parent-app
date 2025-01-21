import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'student_profile_edit_page_viewmodel.dart';
import 'student_profile_edit_pageview.dart';

class StudentProfileEdit extends BasePage<StudentProfileEditViewModel> {
  StudentProfileEdit({super.key, required this.studentData});

  final StudentDataArgs studentData;

  @override
  StudentProfileEditState createState() => StudentProfileEditState();
}

class StudentProfileEditState
    extends AppBasePageState<StudentProfileEditViewModel, StudentProfileEdit> {
  @override
  Widget buildView(BuildContext context, StudentProfileEditViewModel model) {
    return StudentProfileEditView(
      provideBase(),widget.studentData.studentData!

    );
  }

  @override
  ProviderBase<StudentProfileEditViewModel> provideBase() {
    return studentProfileEditViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(StudentProfileEditViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    // model.selectedStudent = ProviderScope.containerOf(context)
    //     .read(dashboardViewModelProvider)
    //     .selectedStudentId;
    // if (model.selectedStudent!.isEmpty ||
    //     model.selectedStudent?.first.id == null) {
    //   return;
    // } else {
    //   // model.selectedStudent?.first.id;
    //   model.getStudentProfileEdit(studentId: widget.studentId);
    // }
    super.onModelReady(model);
  }

  @override
  PreferredSizeWidget? buildAppbar(StudentProfileEditViewModel model) {
    return const CommonAppBar(
        appbarTitle: "Student Profile", showBackButton: true);
  }
}

class StudentDataArgs {
  final StudentData? studentData;

  StudentDataArgs({this.studentData});
}
