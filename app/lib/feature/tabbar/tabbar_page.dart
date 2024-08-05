import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashboard_page.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
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
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<TabbarViewModel> provideBase() {
    return tabbarViewModelProvider;
  }

  @override
  void onModelReady(TabbarViewModel model) {
    // bind exception handler here.
    model.tabController = TabController(length: 4, vsync: this);
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  Future<bool> onBackPressed({param}) {
    // TODO: implement onBackPressed
    log("onback being called");
    return super.onBackPressed(param: true);
  }

  Future<bool> _onWillPop(bool showPopUp) {
    if (showPopUp) {
      CommonPopups().showAppClose(context, 'Are you sure you eant to exit?');
    }
    return Future.value(true);
  }

  @override
  Widget buildView(BuildContext context, TabbarViewModel model) {
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
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.purple,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
        ),
      ],
    );
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
                model.onItemTapped(0);
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
                model.onItemTapped(1);
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
                model.onItemTapped(2);
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
                model.onItemTapped(3);
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
          ],
        ));
  }
}
