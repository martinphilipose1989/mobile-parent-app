import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'disciplinary_details_page_view.dart';
import 'disciplinary_details_view_model.dart';

class DisplinaryDetailsPage extends BasePage<DisplinaryDetailsViewModel> {
  const DisplinaryDetailsPage({super.key});

  @override
  State<DisplinaryDetailsPage> createState() => _DisplinaryDetailsPageState();
}

class _DisplinaryDetailsPageState extends AppBasePageState<
    DisplinaryDetailsViewModel, DisplinaryDetailsPage> {
  @override
  void onModelReady(DisplinaryDetailsViewModel model) {
    model.getCoReasonList();
    model.selectedStudent = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;
    if (model.selectedStudent!.isEmpty ||
        model.selectedStudent?.first.id == null) {
      return;
    } else {
      model.getSlipList(
        studentId: model.selectedStudent?.first.id ?? 0,
      );
      model.getStudentDetail(id: model.selectedStudent?.first.id);
    }
  }

  @override
  PreferredSizeWidget? buildAppbar(DisplinaryDetailsViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Disciplinary Slip',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, DisplinaryDetailsViewModel model) {
    return DisplinaryDetailsPageView(provideBase());
  }

  @override
  ProviderBase<DisplinaryDetailsViewModel> provideBase() {
    return disciplinarySlipProvider;
  }
}
