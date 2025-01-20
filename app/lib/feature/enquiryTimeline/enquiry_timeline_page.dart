import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesTimelinePage extends BasePage<EnquiriesTimelinePageModel> {
  final EnquiryDetailArgs enquiryDetail;
  const EnquiriesTimelinePage({super.key, required this.enquiryDetail});

  @override
  EnquiriesTimelinePageState createState() => EnquiriesTimelinePageState();
}

class EnquiriesTimelinePageState
    extends AppBasePageState<EnquiriesTimelinePageModel, EnquiriesTimelinePage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<EnquiriesTimelinePageModel> provideBase() {
    return enquiriesTimelinePageModelProvider;
  }

  @override
  void onModelReady(EnquiriesTimelinePageModel model) {
    model.getEnquiryTimeLine(
      enquiryID: widget.enquiryDetail.enquiryId ?? '',
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesTimelinePageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiry Timeline',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesTimelinePageModel model) {
    return EnquiriesTimelinePageView(provideBase(), widget.enquiryDetail);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
