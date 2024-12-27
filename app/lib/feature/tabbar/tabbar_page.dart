import 'dart:ffi';

import 'package:app/di/states/viewmodels.dart';

import 'package:app/feature/dashboard/dashboard_page.dart';

import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';

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
        TabController(initialIndex: BOTTOM_NAV_INDEX, length: 2, vsync: this);
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
      items: drawerItems,
    );
  }

  Widget buildDrawers({
    BuildContext? context,
    required List<DrawerItems>? items,
    VoidCallback? onTap, // The callback function to handle taps
    bool? isActive, // Determines if the widget is active
    int? selectedIndex, // Determines if the widget is selected
  }) {
    return Drawer(
      width: MediaQuery.of(context!).size.width * 0.6,
      child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
              itemCount: items?.length,
              itemBuilder: (context, index) {
                final item = items?[index];
                return ListTile(
                  selected: model.selectedIndex.value == index,
                  selectedTileColor: AppColors.listItem,
                  title: Text(items?[index].menu ?? ""),
                  onTap: () {
                    model.selectedIndex.value =
                        index; // Update the selected index

                    if (onTap != null) {
                      onTap!(); // Pass the selected index to the callback
                    }
                    if (items?[index].route != null &&
                        items![index].route!.isNotEmpty) {
                      Navigator.pushNamed(context,
                          items[index].route!); // Navigate to the route
                    }
                  },
                );
              })),
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

final List<DrawerItems> drawerItems = [
  DrawerItems('Fees', ""),
  DrawerItems('Payments', ""),
  DrawerItems('Transaction History', RoutePaths.myDutyPage),
  DrawerItems('Receipt', ""),
  DrawerItems('Daily Diary', ""),
  DrawerItems('Class Update', ""),
  DrawerItems('Assignment', ""),
];

class DrawerItems {
  final String? menu;
  final String? route;

  DrawerItems(this.menu, this.route);
}
