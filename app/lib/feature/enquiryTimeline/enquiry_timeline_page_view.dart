import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/molecules/enquiries/timeline_listitem.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesTimelinePageView
    extends BasePageViewWidget<EnquiriesTimelinePageModel> {
  EnquiriesTimelinePageView(super.providerBase);
  @override
  Widget build(BuildContext context, EnquiriesTimelinePageModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const ListItem(
              image: AppImages.personIcon,
              name: "Rajeev",
              year: "AY 2024-2025",
              id: "ENADMS#4402",
              title: "Vibgyor Kids & High - Malad West",
              subtitle: "Grade V | CBSE",
              buttontext: "School Visit"),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          CommonText(
            text: "Timeline",
            style: AppTypography.body1.copyWith(color: AppColors.textDark),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                return TimelineListitem(index);
              },
            ),
          )
        ],
      ),
    );
  }
}
