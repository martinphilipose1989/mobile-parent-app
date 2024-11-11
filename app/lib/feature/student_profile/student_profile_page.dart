import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'student_profile_page_viewmodel.dart';
import 'student_profile_pageview.dart';

class StudentProfilePage extends BasePage<StudentProfilePageViewModel> {
  const StudentProfilePage({super.key, required this.studentId});

  final int studentId;

  @override
  StudentProfilePageState createState() => StudentProfilePageState();
}

class StudentProfilePageState
    extends AppBasePageState<StudentProfilePageViewModel, StudentProfilePage> {
  @override
  Widget buildView(BuildContext context, StudentProfilePageViewModel model) {
    return StudentProfilePageView(provideBase(), studentId: widget.studentId);
  }

  @override
  ProviderBase<StudentProfilePageViewModel> provideBase() {
    return studentProfilePageViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  void onModelReady(StudentProfilePageViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    //getViewModel()
    model.getStudentProfile(studentId: widget.studentId);
    super.onModelReady(model);
  }

  @override
  PreferredSizeWidget? buildAppbar(StudentProfilePageViewModel model) {
    return const CommonAppBar(
        appbarTitle: "Student Profile", showBackButton: true);
  }
}
