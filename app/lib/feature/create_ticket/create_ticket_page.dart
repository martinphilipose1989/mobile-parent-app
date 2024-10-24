import 'package:flutter/cupertino.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'create_ticket_page_view.dart';
import 'create_ticket_view_model.dart';
class CreateTicketPage extends BasePage<CreateTicketViewModel> {
  const CreateTicketPage({super.key});

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState
    extends AppBasePageState<CreateTicketViewModel, CreateTicketPage>  with TickerProviderStateMixin{
  @override
  void onModelReady(CreateTicketViewModel model) {
    model.getCategories();
    model.getSubCategories();
  }

  @override
  PreferredSizeWidget? buildAppbar(CreateTicketViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Edu Tickets',
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
  Widget buildView(BuildContext context, CreateTicketViewModel model) {
    // TODO: implement buildView
    return CreateTicketPageView(provideBase(),model);
  }

  @override
  ProviderBase<CreateTicketViewModel> provideBase() {
    return createTicketProvider;
  }
}
