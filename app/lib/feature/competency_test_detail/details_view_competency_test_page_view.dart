import 'package:app/feature/competency_test_detail/details_view_competency_test_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/competency_test_schedule_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
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
    return AppStreamBuilder<Resource<CompetencyTestDetailBase>>(
      stream: model.competencyTestDetailBase,
      initialData: Resource.none(),
      dataBuilder: (context, data) {
        if(data?.status == Status.loading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(data?.status == Status.success){
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
                                id: enquiryDetail.enquiryNumber??'',
                                title: enquiryDetail.school??'',
                                subtitle: "${enquiryDetail.grade} | ${enquiryDetail.board} | ${enquiryDetail.shift} | Stream-${enquiryDetail.stream}",
                                buttontext: enquiryDetail.currentStage??'',
                                status: enquiryDetail.status ?? '',),
                            const SizedBox(
                              height: 10,
                            ),
                            AppStreamBuilder<CompetencyTestDetails>(
                              stream: model.competencyTestDetails,
                              initialData: model.competencyTestDetails.value,
                              dataBuilder: (context, snapshot) {
                                return CompetencyTestScheduledDetailsWidget(competencyTestDetails: model.competencyTestDetails.value);
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: data?.data?.data?.testResult != "Pass" && data?.data?.data?.testResult != "Fail",
                child: Positioned(
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
                              Navigator.of(context).pushNamed(RoutePaths.cancelCompetencyTestPage,arguments: [enquiryDetail,model.competencyTestDetails.value]);
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
                            onPressed: () {
                              Navigator.of(context).pushNamed(RoutePaths.scheduleCompetencyTest,arguments: {'enquiryDetailArgs': enquiryDetail,'competencyTestDetail': model.competencyTestDetails.value,'isReschedule': true}).then(
                                (data){
                                  if(data != null){
                                    if(data is CompetencyTestDetails){
                                      model.competencyTestDetails.value = data;
                                    }
                                  }
                                }
                               );
                            },
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
              ),
            ],
          );  
        }
        else{
          return const Center(child: CommonText(text: 'Competency test details not found.'),);
        }
      }
    );
  }
}
