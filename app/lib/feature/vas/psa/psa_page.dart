import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/psa/psa_page_view.dart';
import 'package:app/feature/vas/psa/psa_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PsaDetailPage extends BasePage<PsaDetailViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  final bool hideAppBar;
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  const PsaDetailPage(
      {super.key,
      this.enquiryDetailArgs,
      this.hideAppBar = false,
      this.onSelectVasEnrolment});

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

  PsaDetailViewModel get viewModel =>
      ProviderScope.containerOf(context).read(psaPageModelProvider);

  @override
  didChangeDependencies() {
    viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
    viewModel.getPsaDetail();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant PsaDetailPage oldWidget) {
    if (oldWidget.enquiryDetailArgs?.academicYearId !=
        widget.enquiryDetailArgs?.academicYearId) {
      viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
      viewModel.getPsaDetail();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget buildView(BuildContext context, PsaDetailViewModel model) {
    return PsaDetailPageView(provideBase(),
        onSelectVasEnrolment: widget.onSelectVasEnrolment);
  }

  @override
  PreferredSizeWidget? buildAppbar(PsaDetailViewModel model) {
    return widget.hideAppBar
        ? null
        : const CommonAppBar(
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
