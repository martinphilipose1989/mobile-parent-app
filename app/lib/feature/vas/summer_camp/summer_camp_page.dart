import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_page_view.dart';
import 'package:app/feature/vas/summer_camp/summer_camp_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SummerCampDetailPage extends BasePage<SummerCampDetailViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  const SummerCampDetailPage({super.key, this.enquiryDetailArgs});

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
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    model.getSummerCampDetail();
  }

  @override
  Widget buildView(BuildContext context, SummerCampDetailViewModel model) {
    return SummerCampDetailPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(SummerCampDetailViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Summer Camp',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
