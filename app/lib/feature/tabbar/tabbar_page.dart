import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/dashboard/dashboard_page.dart';
import 'package:app/feature/gate_pass/create_edit_gate_pass/create_edit_gate_pass_page.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_page.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';

class TabbarPage extends BasePage<TabbarViewModel> {
  const TabbarPage({super.key});

  @override
  TabbarPageState createState() => TabbarPageState();
}

class TabbarPageState extends AppBasePageState<TabbarViewModel, TabbarPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<TabbarViewModel> provideBase() {
    return tabbarViewModelProvider;
  }

  TabbarViewModel get model =>
      ProviderScope.containerOf(context).read(tabbarViewModelProvider);

  @override
  void didChangeDependencies() {
    model.tabController =
        TabController(initialIndex: BOTTOM_NAV_INDEX, length: 4, vsync: this);
    super.didChangeDependencies();
  }

  @override
  Future<bool> onBackPressed({param}) {
    return super.onBackPressed(param: true);
  }

  // Future<bool> _onWillPop(bool showPopUp) {
  //   if (showPopUp) {
  //     CommonPopups().showAppClose(context, 'Are you sure you eant to exit?');
  //   }
  //   return Future.value(true);
  // }

  @override
  Widget buildView(BuildContext context, TabbarViewModel model) {
    return StreamBuilder<int>(
        stream: model.indexSteam,
        builder: (context, snapshot) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: model.tabController,
            children: [
              const DashboardPage(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   color: Colors.green,
              // ),
              BaseWidget<DashboardPageModel>(
                builder: (contet, model, _) {
                  log("MODEL ${model?.userSubject.valueOrNull?.data?.phoneNumber}");
                  log("MODEL ${model?.dashboardState.selectedStudent?.id}");

                  return VisitorDetailsPage(
                    params: VisitorDetailsPageParams(
                        mobileNo:
                            model?.userSubject.valueOrNull?.data?.phoneNumber,
                        studentId: model?.dashboardState.selectedStudent?.id,
                        routeFrom: RoutePaths.tabbar),
                  );
                },
                providerBase: dashboardViewModelProvider,
              ),
              const CreateEditGatePassPage()
            ],
          );
        });
  }

  @override
  PreferredSizeWidget? buildAppbar(TabbarViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Dashboard',
    );
  }

  @override
  Widget? buildBottomNavigationBar(TabbarViewModel model) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 2.0, spreadRadius: 2.0, color: Colors.grey.shade200)
        ]),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                BOTTOM_NAV_INDEX = 0;
                model.onItemTapped(BOTTOM_NAV_INDEX);
              },
              child: AbsorbPointer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CommonText(
                          text: 'Home',
                          style: Theme.of(context).textTheme.bodyMedium),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                BOTTOM_NAV_INDEX = 1;
                model.onItemTapped(BOTTOM_NAV_INDEX);
              },
              child: AbsorbPointer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CommonText(
                          text: 'Home',
                          style: Theme.of(context).textTheme.bodyMedium),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                BOTTOM_NAV_INDEX = 2;
                model.onItemTapped(BOTTOM_NAV_INDEX);
              },
              child: AbsorbPointer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CommonText(
                          text: 'View Gate Pass',
                          style: Theme.of(context).textTheme.bodyMedium),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                BOTTOM_NAV_INDEX = 3;
                model.onItemTapped(BOTTOM_NAV_INDEX);
              },
              child: AbsorbPointer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Icon(Icons.school),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CommonText(
                          text: 'Gate Pass',
                          style: Theme.of(context).textTheme.bodyMedium),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
