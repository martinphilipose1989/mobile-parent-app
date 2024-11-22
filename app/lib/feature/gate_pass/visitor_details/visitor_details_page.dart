import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_page_view.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_viewmodel.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class VisitorDetailsPage extends BasePage<VisitorDetailsViewModel> {
  final VisitorDetailsPageParams? params;

  const VisitorDetailsPage({super.key, this.params});

  @override
  VisitorDetailsPageState createState() => VisitorDetailsPageState();
}

class VisitorDetailsPageState
    extends AppBasePageState<VisitorDetailsViewModel, VisitorDetailsPage> {
  @override
  Widget buildView(BuildContext context, VisitorDetailsViewModel model) {
    return VisitorDetailsPageView(provideBase(), params: widget.params);
  }

  @override
  Color scaffoldBackgroundColor() => Colors.white;

  @override
  ProviderBase<VisitorDetailsViewModel> provideBase() {
    return visitorDetailsViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar(VisitorDetailsViewModel model) {
    return const CommonAppBar(
        appbarTitle: "View GatePass",
        showBackButton: false,
        notShowNotificationAndUserBatch: true);
  }

  @override
  void onModelReady(VisitorDetailsViewModel model) {
    model.getVisitorDetails(
        mobile: widget.params?.mobileNo,
        studentId: widget.params?.studentId,
        gatePassId: widget.params?.gatePassId);
    super.onModelReady(model);
  }
}

class VisitorDetailsPageParams {
  final String? mobileNo;
  final dynamic studentId;
  final String routeFrom;
  final String? gatePassId;

  VisitorDetailsPageParams(
      {required this.mobileNo,
      required this.studentId,
      this.gatePassId,
      this.routeFrom = RoutePaths.tabbar});
}
