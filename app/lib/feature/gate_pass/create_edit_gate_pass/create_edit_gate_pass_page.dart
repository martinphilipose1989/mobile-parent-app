import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'create_edit_gate_pass_page_view.dart';
import 'create_edit_gate_pass_viewmodel.dart';

class CreateEditGatePassPage extends BasePage<CreateEditGatePassViewModel> {
  const CreateEditGatePassPage({super.key});

  @override
  CreateEditGatePassPageState createState() => CreateEditGatePassPageState();
}

class CreateEditGatePassPageState extends AppBasePageState<
    CreateEditGatePassViewModel, CreateEditGatePassPage> {
  @override
  Widget buildView(BuildContext context, CreateEditGatePassViewModel model) {
    return CreateEditGatePassPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() => Colors.white;

  @override
  ProviderBase<CreateEditGatePassViewModel> provideBase() {
    return createEditGatePassViewModelProvider;
  }

  CreateEditGatePassViewModel get model =>
      ProviderScope.containerOf(context).read(
        createEditGatePassViewModelProvider,
      );

  @override
  void didChangeDependencies() {
    model.setStudentData(context);

    /// api calls
    model.getPurposeOfVisitList();
    model.getUserDetails();
    super.didChangeDependencies();
  }

  @override
  PreferredSizeWidget? buildAppbar(CreateEditGatePassViewModel model) {
    return const CommonAppBar(
        appbarTitle: "Create Gate Pass",
        showBackButton: true,
        notShowNotificationAndUserBatch: true);
  }
}
