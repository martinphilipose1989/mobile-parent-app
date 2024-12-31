import 'dart:ffi';

import 'package:app/di/states/viewmodels.dart';

import 'package:app/feature/dashboard/dashboard_page.dart';
import 'package:app/feature/tabbar/tabbar_class.dart';

import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/molecules/drawer/expansionList.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';

import 'package:app/utils/common_widgets/common_appbar.dart';

import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';
import '../payments/payments_pages/payments.dart';

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
        TabController(initialIndex: BOTTOM_NAV_INDEX, length: 2, vsync: this);
    super.didChangeDependencies();
  }

  @override
  Future<bool> onBackPressed({param}) {
    return super.onBackPressed(param: true);
  }

  @override
  void onModelReady(TabbarViewModel model) {
    model.menuItems = [
      MenuItem(
          menuItem: "Fees", menuItemActive: true, drawerItmes: model.fessItems),
      MenuItem(
          menuItem: "Child Progress/Academic Progress",
          menuItemActive: true,
          drawerItmes: model.progressItems),
      MenuItem(
          menuItem: "Parent Services",
          menuItemActive: false,
          drawerItmes: model.parentServices),
      MenuItem(
          menuItem: "Info",
          menuItemActive: false,
          drawerItmes: model.infoItems),
      MenuItem(
          menuItem: "Daily Diary",
          menuItemActive: false,
          drawerItmes: model.dailyDiary)
    ];
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, TabbarViewModel model) {
    return StreamBuilder<int>(
        stream: model.indexStream,
        builder: (context, snapshot) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: model.tabController,
            children: [
              const DashboardPage(),
              Container(
                color: AppColors.primaryOn,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CommonText(
                    text: "Coming Soon !!!",
                    style: AppTypography.body1,
                  ),
                ),
              ),
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
  Widget? buildDrawer() {
    return buildDrawers(
      context: context,
    );
  }

  Widget buildDrawers({
    BuildContext? context,
    VoidCallback? onTap, // The callback function to handle taps
    bool? isActive, // Determines if the widget is active
    int? selectedIndex, // Determines if the widget is selected
  }) {
    return Drawer(
        width: MediaQuery.of(context!).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: ListView(
              //    SizedBox(),
              children: model.menuItems
                  .map((e) => Visibility(
                      visible: e.menuItemActive ?? false,
                      child: CustomExpansionList(
                        title: e.menuItem ?? "",
                        nameList: e.drawerItmes,
                      )))
                  .toList()
              //   CustomExpansionList(
              //     title: "Fees",
              //     nameList: model.fessItems,
              //   ),
              //   CustomExpansionList(
              //     title: "Child Progress/ Academic Progress",
              //     nameList: model.progressItems,
              //   ),
              // //  CustomExpansionList(
              //   //   title: "Daily Diary",
              //   //   nameList: model.dailyDiary,
              //   // ),
              //   CustomExpansionList(
              //     title: "Parent Services",
              //     nameList: model.parentServices,
              //   ),
              // CustomExpansionList(
              //   title: "Info",
              //   nameList: model.infoItems,
              // )
              ),
        ));
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
                    const Icon(Icons.notifications),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CommonText(
                          text: 'Notification',
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
