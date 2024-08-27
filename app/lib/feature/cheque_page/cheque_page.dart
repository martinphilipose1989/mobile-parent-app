import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cheque_page/cheque_page_view.dart';
import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ChequePage extends BasePage<ChequePageModel> {
  const ChequePage({super.key});

  @override
  ChequePageState createState() => ChequePageState();
}

class ChequePageState extends AppBasePageState<ChequePageModel, ChequePage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<ChequePageModel> provideBase() {
    return chequePageModelProvider;
  }

  @override
  void onModelReady(ChequePageModel model) {
    model.amount = ProviderScope.containerOf(context)
        .read(paymentsPageModelProvider)
        .amount;
    model.inFavour = ProviderScope.containerOf(context)
        .read(paymentsPageModelProvider)
        .inFavour;
    model.payemntType = ProviderScope.containerOf(context)
        .read(paymentsPageModelProvider)
        .payemntType;
  }

  @override
  Widget buildView(BuildContext context, ChequePageModel model) {
    return ChequePageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(ChequePageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Cheque Page',
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
