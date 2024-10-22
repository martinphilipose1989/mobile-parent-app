import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryTimeline/enquiry_timeline_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/molecules/enquiries/timeline_listitem.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesTimelinePageView
    extends BasePageViewWidget<EnquiriesTimelinePageModel> {
  final EnquiryDetailArgs enquiryDetail;
  EnquiriesTimelinePageView(super.providerBase,this.enquiryDetail);
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
          ListItem(
              image: AppImages.personIcon,
              name: enquiryDetail.studentName??'',
              year: enquiryDetail.academicYear??'',
              id: enquiryDetail.enquiryNumber??'',
              title: enquiryDetail.school??'',
              subtitle: "${enquiryDetail.grade} | ${enquiryDetail.board} | ${enquiryDetail.shift} | Stream-${enquiryDetail.stream}",
              buttontext: enquiryDetail.currentStage??'',
              status: enquiryDetail.status??'',),
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
          AppStreamBuilder<Resource<EnquiryTimeLineBase>>(
                stream: model.fetchEnquiryTimeline,
                initialData: Resource.none(),
                dataBuilder: (context, result) {
                  switch (result?.status) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator(),);
                    case Status.success:
                      return Expanded(
                        child: ListView.builder(
                          itemCount: (result?.data?.data?.timeline??[]).length,
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            return TimelineListitem(index: index,length: (result?.data?.data?.timeline??[]).length,timeline: (result?.data?.data?.timeline??[])[index],);
                          },
                        ),
                      );
                    default:
                      return const Center(child: CircularProgressIndicator(),);
                  }
                }
          ),
          
        ],
      ),
    );
  }
}
