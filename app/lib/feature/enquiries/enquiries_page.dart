import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/feature/enquiries/enquiries_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesPage extends BasePage<EnquiriesPageModel> {
  const EnquiriesPage({super.key});

  @override
  EnquiriesPageState createState() => EnquiriesPageState();
}

class EnquiriesPageState
    extends AppBasePageState<EnquiriesPageModel, EnquiriesPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<EnquiriesPageModel> provideBase() {
    return enquiriesPageModelProvider;
  }

  @override
  void onModelReady(EnquiriesPageModel model) {
    model.controller = TabController(length: 2, vsync: this);
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiries',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesPageModel model) {
    return EnquiriesPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
