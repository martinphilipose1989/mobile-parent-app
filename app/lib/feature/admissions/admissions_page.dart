import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/admissions/admissions_page_view.dart';
import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsPage extends BasePage<AdmissionsViewModel> {
  const AdmissionsPage({super.key});

  @override
  State<AdmissionsPage> createState() => _AdmissionsPageState();
}

class _AdmissionsPageState
    extends AppBasePageState<AdmissionsViewModel, AdmissionsPage>
    with TickerProviderStateMixin {
  @override
  void onModelReady(AdmissionsViewModel model) {
    model.controller = TabController(length: 2, vsync: this);

    // model.fetchAdmissionList();
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(AdmissionsViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Admissions',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, AdmissionsViewModel model) {
    return AdmissionsPageView(provideBase());
  }

  @override
  ProviderBase<AdmissionsViewModel> provideBase() {
    return admissionsProvider;
  }
}
