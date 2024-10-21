// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/review_page/rate_page_view.dart';
import 'package:app/feature/review_page/rate_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';

class RatePage extends BasePage<RatePageModel> {
  const RatePage({
    super.key,
  });

  @override
  RatePageState createState() => RatePageState();
}

class RatePageState extends AppBasePageState<RatePageModel, RatePage> {
  @override
  ProviderBase<RatePageModel> provideBase() {
    return ratePageModelProvider;
  }

  @override
  void onModelReady(RatePageModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  Widget buildView(BuildContext context, RatePageModel model) {
    return RatePageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(RatePageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Review Page',
      showBackButton: true,
    );
  }

  @override
  Widget? buildBottomNavigationBar(RatePageModel model) {
    // TODO: implement buildBottomNavigationBar
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CommonElevatedButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        text: "Submit",
        textColor: Colors.black,
      ),
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
