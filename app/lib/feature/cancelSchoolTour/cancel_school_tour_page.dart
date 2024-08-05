import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class CancelSchoolTourPage extends BasePage<CancelSchoolTourPageModel> {
  const CancelSchoolTourPage({super.key});

  @override
  CancelSchoolTourPageState createState() => CancelSchoolTourPageState();
}

class CancelSchoolTourPageState
    extends AppBasePageState<CancelSchoolTourPageModel, CancelSchoolTourPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<CancelSchoolTourPageModel> provideBase() {
    return cancelSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(CancelSchoolTourPageModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(CancelSchoolTourPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Cancel School Tour',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, CancelSchoolTourPageModel model) {
    return CancelSchoolTourPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
