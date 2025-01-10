import 'dart:developer';

import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/kids_club/kids_club_page_view.dart';
import 'package:app/feature/vas/kids_club/kids_club_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class KidsClubDeatilDetailPage extends BasePage<KidsClubViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  final bool? hideAppBar;
  // new enrollment fee
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;
  const KidsClubDeatilDetailPage(
      {super.key,
      this.enquiryDetailArgs,
      this.hideAppBar = false,
      this.onSelectVasEnrolment});

  @override
  KidsClubDeatilDetailPageState createState() =>
      KidsClubDeatilDetailPageState();
}

class KidsClubDeatilDetailPageState
    extends AppBasePageState<KidsClubViewModel, KidsClubDeatilDetailPage> {
  @override
  ProviderBase<KidsClubViewModel> provideBase() {
    return kidsClubPageModelProvider;
  }

  @override
  void didUpdateWidget(covariant KidsClubDeatilDetailPage oldWidget) {
    if (oldWidget.enquiryDetailArgs?.academicYearId !=
        widget.enquiryDetailArgs?.academicYearId) {
      viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
      viewModel.getKidsClubDetail();
    }
    super.didUpdateWidget(oldWidget);
  }

  KidsClubViewModel get viewModel =>
      ProviderScope.containerOf(context).read(kidsClubPageModelProvider);

  @override
  didChangeDependencies() {
    viewModel.enquiryDetailArgs = widget.enquiryDetailArgs;
    viewModel.getKidsClubDetail();
    super.didChangeDependencies();
  }

  @override
  Widget buildView(BuildContext context, KidsClubViewModel model) {
    return KidsClubDetailPageView(provideBase(),
        onSelectVasEnrolment: widget.onSelectVasEnrolment);
  }

  @override
  PreferredSizeWidget? buildAppbar(KidsClubViewModel model) {
    return widget.hideAppBar == true
        ? null
        : const CommonAppBar(
            appbarTitle: 'Kids Club',
            notShowNotificationAndUserBatch: false,
            showBackButton: true,
          );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
