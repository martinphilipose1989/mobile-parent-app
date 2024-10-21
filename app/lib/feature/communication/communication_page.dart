// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/communication/communication_page_view.dart';
import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';

class CommunicationPage extends BasePage<CommunicationPageModel> {
  const CommunicationPage({
    super.key,
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
  }

  @override
  Widget buildView(BuildContext context, CommunicationPageModel model) {
    return CommunicationPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(CommunicationPageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Edu Tickets',
      showBackButton: true,
    );
  }

  // @override
  // Widget? buildBottomNavigationBar(CommunicationPageModel model) {
  //   // TODO: implement buildBottomNavigationBar
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: CommonElevatedButton(
  //       onPressed: () {},
  //       backgroundColor: Theme.of(context).colorScheme.secondary,
  //       text: "Submit",
  //       textColor: Colors.black,
  //     ),
  //   );
  // }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
