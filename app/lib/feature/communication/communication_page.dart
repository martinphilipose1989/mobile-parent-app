// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/communication/communication_page_view.dart';
import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class CommunicationPage extends BasePage<CommunicationPageModel> {
  final String id;
  const CommunicationPage({
    super.key,
    required this.id,
  });

  @override
  CommunicationPageState createState() => CommunicationPageState();
}

class CommunicationPageState
    extends AppBasePageState<CommunicationPageModel, CommunicationPage> {
  @override
  ProviderBase<CommunicationPageModel> provideBase() {
    return communicationPageModelProvider;
  }

  @override
  void onModelReady(CommunicationPageModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.chatId = widget.id;
    model.getCommunicationDetails(widget.id);
    model.getUserDetails();
  }

  @override
  Widget buildView(BuildContext context, CommunicationPageModel model) {
    return CommunicationPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(CommunicationPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Edu Tickets',
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
