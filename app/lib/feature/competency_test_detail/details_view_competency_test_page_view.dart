import 'package:app/feature/competency_test_detail/details_view_competency_test_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/competency_test_schedule_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DetailsViewCompetencyTestPageView
    extends BasePageViewWidget<DetailsViewCompetencyTestPageModel> {
  final EnquiryDetailArgs enquiryDetail;
  DetailsViewCompetencyTestPageView(super.providerBase,{required this.enquiryDetail});
  @override
  Widget build(BuildContext context, DetailsViewCompetencyTestPageModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
          child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                          image: AppImages.personIcon,
                          name: enquiryDetail.studentName??'',
                          year: enquiryDetail.academicYear??'',
                          id: enquiryDetail.enquiryId??'',
                          title: enquiryDetail.school??'',
                          subtitle: "${enquiryDetail.grade} | ${enquiryDetail.board}",
                          buttontext: enquiryDetail.enquiryStage??'',),
                      const SizedBox(
                        height: 10,
                      ),
                      AppStreamBuilder<Resource<CompetencyTestDetails>>(
                        stream: model.competencyTestDetail,
                        initialData: Resource.none(),
                        dataBuilder: (context, result) {
                          switch(result?.status){
                            case Status.loading:
                              return const Center(child: CircularProgressIndicator(),);
                            case Status.success:
                              return CompetencyTestScheduledDetailsWidget(competencyTestDetails: result?.data??CompetencyTestDetails());
                            default:
                              return const Center(child: CircularProgressIndicator(),);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(RoutePaths.cancelSchoolTourPage,arguments: [enquiryDetail,model.schoolVisitDetailData]);
                    },
                    text: 'Cancel Test',
                    borderColor: Theme.of(context).primaryColor,
                    borderWidth: 1,
                    width: 171.w,
                    height: 40.h,
                    textColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Reschedule Test',
                    backgroundColor: AppColors.accent,
                    width: 171.w,
                    height: 40.h,
                    textColor: AppColors.accentOn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
