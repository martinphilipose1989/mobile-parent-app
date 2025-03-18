import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_page_view.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CafeteriaPage extends BasePage<CafeteriaDetailViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  final bool hideAppBar;
  // new enrollment fee
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  const CafeteriaPage(
      {super.key,
      this.enquiryDetailArgs,
      this.hideAppBar = false,
      this.onSelectVasEnrolment});

  @override
  CafeteriaPageState createState() => CafeteriaPageState();
}

class CafeteriaPageState
    extends AppBasePageState<CafeteriaDetailViewModel, CafeteriaPage> {
  @override
  ProviderBase<CafeteriaDetailViewModel> provideBase() {
    return cafeteriaPageModelProvider;
  }

  @override
  void onModelReady(CafeteriaDetailViewModel model) {
    // bind exception handler here.

    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  CafeteriaDetailViewModel get viewModel =>
      ProviderScope.containerOf(context).read(cafeteriaPageModelProvider);

  @override
  void didChangeDependencies() {
    viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
    viewModel.getCafeteriaDetail();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CafeteriaPage oldWidget) {
    if (oldWidget.enquiryDetailArgs?.academicYearId !=
        widget.enquiryDetailArgs?.academicYearId) {
      viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
      viewModel.getCafeteriaDetail();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget buildView(BuildContext context, CafeteriaDetailViewModel model) {
    return CafeteriaPageView(provideBase(),
        onSelectVasEnrolment: widget.onSelectVasEnrolment);
  }

  @override
  PreferredSizeWidget? buildAppbar(CafeteriaDetailViewModel model) {
    return widget.hideAppBar
        ? null
        :  CommonAppBar(
            appbarTitle: Strings.of(context).cafeteria,
            notShowNotificationAndUserBatch: false,
            showBackButton: true,
          );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  dispose() {
    //viewModel.dispose();
    super.dispose();
  }
}
