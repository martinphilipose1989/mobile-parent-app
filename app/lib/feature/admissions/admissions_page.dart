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
    extends AppBasePageState<AdmissionsViewModel, AdmissionsPage>  {
  @override
  void onModelReady(AdmissionsViewModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(AdmissionsViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Admissions',
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
  Widget buildView(BuildContext context, AdmissionsViewModel model) {
    // TODO: implement buildView
    return AdmissionsPageView(provideBase());
  }

  

  @override
  ProviderBase<AdmissionsViewModel> provideBase() {
    return admissionsProvider;
  }
}
