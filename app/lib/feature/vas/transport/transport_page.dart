import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/transport/transport_page_view.dart';
import 'package:app/feature/vas/transport/transport_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class TransportPage extends BasePage<TransportDetailViewModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final bool hideAppBar;
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  const TransportPage(
      {super.key,
      required this.enquiryDetailArgs,
      this.hideAppBar = false,
      this.onSelectVasEnrolment});

  @override
  TransportPageState createState() => TransportPageState();
}

class TransportPageState
    extends AppBasePageState<TransportDetailViewModel, TransportPage> {
  @override
  ProviderBase<TransportDetailViewModel> provideBase() {
    return transportPageModelProvider;
  }

  @override
  void onModelReady(TransportDetailViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  TransportDetailViewModel get viewModel =>
      ProviderScope.containerOf(context).read(transportPageModelProvider);

  @override
  void didUpdateWidget(covariant TransportPage oldWidget) {
    if (oldWidget.enquiryDetailArgs.academicYearId !=
        widget.enquiryDetailArgs.academicYearId) {
      viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
      viewModel.getTransportEnrollmentDetail();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  didChangeDependencies() {
    viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
    viewModel.getTransportEnrollmentDetail();
    super.didChangeDependencies();
  }

  @override
  Widget buildView(BuildContext context, TransportDetailViewModel model) {
    return TransportPageView(provideBase(),
        onSelectVasEnrolment: widget.onSelectVasEnrolment);
  }

  @override
  PreferredSizeWidget? buildAppbar(TransportDetailViewModel model) {
    return widget.hideAppBar
        ? null
        :  CommonAppBar(
            appbarTitle: Strings.of(context).transport,
            notShowNotificationAndUserBatch: false,
            showBackButton: true,
          );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
