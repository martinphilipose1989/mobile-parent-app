import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/new_enrolment/new_enrolment_viewmodel.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'new_enrolment_pageview.dart';

class NewEnrolmentPage extends BasePage<NewEnrolmentViewModel> {
  const NewEnrolmentPage({super.key});

  @override
  NewEnrolmentPageState createState() => NewEnrolmentPageState();
}

class NewEnrolmentPageState
    extends AppBasePageState<NewEnrolmentViewModel, NewEnrolmentPage>
    with SingleTickerProviderStateMixin {
  late final NewEnrolmentViewModel newEnrolmentViewModel;

  @override
  void initState() {
    super.initState();
    newEnrolmentViewModel = ProviderScope.containerOf(context, listen: false)
        .read(newEnrolmentViewModelProvider)
      ..tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // newEnrolmentViewModel.tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context, NewEnrolmentViewModel model) {
    return NewEnrolmentPageView(provideBase());
  }

  @override
  ProviderBase<NewEnrolmentViewModel> provideBase() {
    return newEnrolmentViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  @override
  PreferredSizeWidget? buildAppbar(NewEnrolmentViewModel model) {
    return CommonAppBar(
      appbarTitle: "New Enrolment",
      showBackButton: true,
    );
  }

  @override
  void didChangeDependencies() {
    final list = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;

    if ((list?.isEmpty ?? false) || list?.first.id == null) {
      return;
    } else {
      newEnrolmentViewModel.selectedStudentId = list?.first.id;
      newEnrolmentViewModel.getStudentDetails();
    }
    super.didChangeDependencies();
  }

  // @override
  // Widget? buildBottomNavigationBar(NewEnrolmentViewModel model) {
  //   return Container(
  //     height: 100.h,
  //     padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         CommonOutlineButton(
  //             title: "Cancel",
  //             onPressed: () {
  //               Navigator.pop(context);
  //             }),
  //         CommonPrimaryElevatedButton(title: "Submit", onPressed: () {}),
  //       ],
  //     ),
  //   );
  // }
}
