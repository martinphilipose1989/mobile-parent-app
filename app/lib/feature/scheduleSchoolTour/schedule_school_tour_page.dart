import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ScheduleSchoolTourPage extends BasePage<ScheduleSchoolTourPageModel> {
  const ScheduleSchoolTourPage({super.key});

  @override
  ScheduleSchoolTourPageState createState() => ScheduleSchoolTourPageState();
}

class ScheduleSchoolTourPageState extends AppBasePageState<ScheduleSchoolTourPageModel, ScheduleSchoolTourPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<ScheduleSchoolTourPageModel> provideBase() {
    return scheduleSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(ScheduleSchoolTourPageModel model) {
  }

  @override
  PreferredSizeWidget? buildAppbar(ScheduleSchoolTourPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Schedule School Tour',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, ScheduleSchoolTourPageModel model) {
    return ScheduleSchoolTourPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
