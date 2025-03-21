import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'my_duty_page_viewmodel.dart';
import 'my_duty_pageview.dart';

class MyDutyPage extends BasePage<MyDutyPageViewModel> {
  const MyDutyPage({super.key});

  @override
  MyDutyPageState createState() => MyDutyPageState();
}

class MyDutyPageState
    extends AppBasePageState<MyDutyPageViewModel, MyDutyPage> {
  @override
  ProviderBase<MyDutyPageViewModel> provideBase() {
    return myDutyPageViewModelProvider;
  }

  @override
  void onModelReady(MyDutyPageViewModel model) {
    model.selectedStudent = ProviderScope.containerOf(context)
        .read(dashboardViewModelProvider)
        .selectedStudentId;
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
   model.getMyDutyList();

    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, MyDutyPageViewModel model) {
    return MyDutyPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  PreferredSizeWidget? buildAppbar(MyDutyPageViewModel model) {
    return  CommonAppBar(
      appbarTitle: Strings.of(context).track_bus,
      showBackButton: true,
    );
  }
}
