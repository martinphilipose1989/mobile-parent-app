import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_page_view.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SummerCampDetailPage extends BasePage<SummerCampDetailViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  final bool hideAppBar;
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  const SummerCampDetailPage(
      {super.key,
      this.enquiryDetailArgs,
      this.hideAppBar = false,
      this.onSelectVasEnrolment});

  @override
  SummerCampDetailPageState createState() => SummerCampDetailPageState();
}

class SummerCampDetailPageState
    extends AppBasePageState<SummerCampDetailViewModel, SummerCampDetailPage> {
  @override
  ProviderBase<SummerCampDetailViewModel> provideBase() {
    return summerCampPageModelProvider;
  }

  @override
  void onModelReady(SummerCampDetailViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  SummerCampDetailViewModel get viewModel =>
      ProviderScope.containerOf(context).read(summerCampPageModelProvider);

  @override
  void didChangeDependencies() {
    viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
    viewModel.getSummerCampDetail();
    super.didChangeDependencies();
  }

  @override
  Widget buildView(BuildContext context, SummerCampDetailViewModel model) {
    return SummerCampDetailPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(SummerCampDetailViewModel model) {
    return widget.hideAppBar
        ? null
        :  CommonAppBar(
            appbarTitle: Strings.of(context).summer_camp,
            notShowNotificationAndUserBatch: false,
            showBackButton: true,
          );
  }

  @override
  void didUpdateWidget(covariant SummerCampDetailPage oldWidget) {
    if (oldWidget.enquiryDetailArgs?.academicYearId !=
        widget.enquiryDetailArgs?.academicYearId) {
      viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
      viewModel.getSummerCampDetail();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
