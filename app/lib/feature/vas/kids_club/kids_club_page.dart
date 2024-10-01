import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/kids_club/kids_club_page_view.dart';
import 'package:app/feature/vas/kids_club/kids_club_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class KidsClubDeatilDetailPage extends BasePage<KidsClubViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  const KidsClubDeatilDetailPage({super.key,this.enquiryDetailArgs});

  @override
  KidsClubDeatilDetailPageState createState() => KidsClubDeatilDetailPageState();
}

class KidsClubDeatilDetailPageState
    extends AppBasePageState<KidsClubViewModel, KidsClubDeatilDetailPage> {
  @override
  ProviderBase<KidsClubViewModel> provideBase() {
    return kidsClubPageModelProvider;
  }

  @override
  void onModelReady(KidsClubViewModel model) {    
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    model.getKidsClubDetail();
  }

  @override
  Widget buildView(BuildContext context, KidsClubViewModel model) {
    return KidsClubDetailPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(KidsClubViewModel model) {
    return const CommonAppBar(
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
