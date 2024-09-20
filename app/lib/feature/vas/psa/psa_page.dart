import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/vas/psa/psa_page_view.dart';
import 'package:app/feature/vas/psa/psa_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PsaDetailPage extends BasePage<PsaDetailViewModel> {
  const PsaDetailPage({super.key});

  @override
  PsaDetailPageState createState() => PsaDetailPageState();
}

class PsaDetailPageState
    extends AppBasePageState<PsaDetailViewModel, PsaDetailPage> {
  @override
  ProviderBase<PsaDetailViewModel> provideBase() {
    return psaPageModelProvider;
  }

  @override
  void onModelReady(PsaDetailViewModel model) {
    // bind exception handler here.
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  Widget buildView(BuildContext context, PsaDetailViewModel model) {
    return PsaDetailPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(PsaDetailViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'PSA Activity',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
