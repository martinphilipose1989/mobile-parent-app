import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesTimelinePage extends BasePage<EnquiriesTimelinePageModel> {
  const EnquiriesTimelinePage({super.key});

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
  void onModelReady(EnquiriesTimelinePageModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesTimelinePageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiry Timeline',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesTimelinePageModel model) {
    return EnquiriesTimelinePageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
