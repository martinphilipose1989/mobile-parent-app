import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/vas/transport/transport_page_view.dart';
import 'package:app/feature/vas/transport/transport_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class TransportPage extends BasePage<TransportDetailViewModel> {
  const TransportPage({super.key});

  @override
  TransportPageState createState() => TransportPageState();
}

class TransportPageState extends AppBasePageState<TransportDetailViewModel, TransportPage> {
  @override
  ProviderBase<TransportDetailViewModel> provideBase() {
    return transportPageModelProvider;
  }

  @override
  void onModelReady(TransportDetailViewModel model) {
    // bind exception handler here.
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  Widget buildView(BuildContext context, TransportDetailViewModel model) {
    return TransportPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(TransportDetailViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Transport',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

}
