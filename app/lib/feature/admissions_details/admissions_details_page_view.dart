import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsPageView
    extends BasePageViewWidget<AdmissionsDetailsViewModel> {
  final EnquiryDetailArgs admissionDetail;
  AdmissionsDetailsPageView(super.providerBase,{required this.admissionDetail});

  actionOnMenu(int index, BuildContext context, AdmissionsDetailsViewModel model) {
    switch (index) {
      case 0:
        return (model.isDetailView())? Navigator.of(context).pushNamed(
          RoutePaths.detailsViewSchoolTourPage,arguments: admissionDetail
        ) : Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage,arguments: {'enquiryDetailArgs': admissionDetail,});
      case 1:
        return Navigator.of(context).pushNamed(RoutePaths.payments);
      case 2:
        return UrlLauncher.launchPhone('+1234567890', context: context);
      case 3:
        return UrlLauncher.launchEmail('example@example.com', context: context);

      case 4:
        return (model.isDetailViewCompetency())? Navigator.of(context).pushNamed(
          RoutePaths.competencyTestDetailPage,arguments: admissionDetail
        ) : Navigator.of(context)
           .pushNamed(RoutePaths.scheduleCompetencyTest,arguments: {'enquiryDetailArgs': admissionDetail});
      case 5:
       return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage,arguments: admissionDetail);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, AdmissionsDetailsViewModel model) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListItem(
                  image: AppImages.personIcon,
                  name: "${admissionDetail.studentName} ",
                  year: admissionDetail.academicYear??'',
                  id: admissionDetail.enquiryId??'',
                  title: admissionDetail.school??'',
                  subtitle: "${admissionDetail.grade} | ${admissionDetail.board}",
                  buttontext: admissionDetail.enquiryStage??'',
                  compeletion: '25% Completed',
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonText(
                      text: 'Admission Journey',
                      style: AppTypography.subtitle1,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, RoutePaths.registrationDetails,arguments: { "routeFrom": "admission", "enquiryDetailArgs": admissionDetail,"enquiryDetail": model.enquiryDetails.value}),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.eyeIcon,
                            color: Theme.of(context).primaryColor,
                          ),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                          CommonText(
                            text: 'View Details',
                            style: AppTypography.subtitle1.copyWith(
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                AppStreamBuilder<Resource<AdmissionJourneyBase>>(
                stream: model.fetchAdmissionJourney,
                initialData: Resource.none(),
                dataBuilder: (context, result) {
                  switch(result?.status){
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator(),);
                    case Status.success:
                      return CommonStepperPage(
                              stepperList: List.generate(
                                (result?.data?.data??[]).length,
                                (index) {
                                  return Step(
                                      // subtitle: result?.data?[index].stage == ''
                                      //     ? null
                                      //     : CommonText(
                                      //         text: model.stepperData[index]['subtitle']),
                                      title: CommonText(
                                        text: result?.data?.data?[index].stage??'',
                                      ),
                                      state: result?.data?.data?[index].status == "Open" || result?.data?.data?[index].status == "In Progress"
                                          ? StepState.indexed
                                          : StepState.complete,
                                      isActive: result?.data?.data?[index].status == "Completed",
                                      content: const SizedBox.shrink());
                                },
                              ) ,
                              activeStep: (result?.data?.data??[]).indexWhere((element) => element.status == "Open"||element.status == "In Progress") == -1 ? 0 : (result?.data?.data??[]).indexWhere((element) => element.status == "Open"||element.status == "In Progress"));
                    case Status.error:
                      return const Center(child: Text('Enquiries not found'),);
                    default:
                      return const Center(child: CircularProgressIndicator(),);
                  }
                }
              ),
              ],
            ),
          ),
        ),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return data!
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  : SizedBox.fromSize();
            }),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return Positioned(
                  right: 20,
                  bottom: 100,
                  child: data!
                      ? Menu(
                          height: 395.h,
                          onTap: (index) {
                            actionOnMenu(index, context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                          menuData: model.menuData,
                        )
                      : SizedBox.fromSize());
            })
      ],
    );
  }
}
