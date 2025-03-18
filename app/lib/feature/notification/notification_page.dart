import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/notification/notification_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'notification_pageview.dart';

class NotificationPage extends BasePage<NotificationPageViewModel> {
  const NotificationPage({super.key});

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState
    extends AppBasePageState<NotificationPageViewModel, NotificationPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<NotificationPageViewModel> provideBase() {
    return notificationProvider;
  }

  @override
  void onModelReady(NotificationPageViewModel model) {
    model.getUserDetails();

    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, NotificationPageViewModel model) {
    return NotificationPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  PreferredSizeWidget? buildAppbar(NotificationPageViewModel model) {
    return AppBar(
      title: Text(Strings.of(context).notification),
    );
  }
}
