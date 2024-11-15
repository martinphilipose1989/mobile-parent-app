import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'ticket_list_page_view.dart';
import 'ticket_list_view_model.dart';

class TicketListPage extends BasePage<TicketListViewModel> {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState
    extends AppBasePageState<TicketListViewModel, TicketListPage>
    with TickerProviderStateMixin {
  @override
  void onModelReady(TicketListViewModel model) {
    model.tabController = TabController(length: 3, vsync: this);
  }

  @override
  PreferredSizeWidget? buildAppbar(TicketListViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Tickets',
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
  Widget buildView(BuildContext context, TicketListViewModel model) {
    // TODO: implement buildView
    return TicketListPageView(provideBase(), model);
  }

  @override
  ProviderBase<TicketListViewModel> provideBase() {
    return ticketListProvider;
  }
}
