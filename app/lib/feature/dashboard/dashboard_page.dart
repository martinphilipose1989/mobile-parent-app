import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/dashboard/dashboard_page_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';

class DashboardPage extends BasePage<DashboardPageModel> {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState
    extends AppBasePageState<DashboardPageModel, DashboardPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<DashboardPageModel> provideBase() {
    return dashboardViewModelProvider;
  }

  @override
  void onModelReady(DashboardPageModel model) async {
    // bind exception handler here.
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.getUserRoleBaseDetails();
  }

  @override
  Widget buildView(BuildContext context, DashboardPageModel model) {
    return DashboardPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
