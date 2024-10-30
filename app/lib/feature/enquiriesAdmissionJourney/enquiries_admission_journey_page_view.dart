import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/model/resource.dart';

import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import '../../molecules/registration_details/registrations_widgets_read_only/menu.dart';

class EnquiriesAdmissionsJourneyPageView
    extends BasePageViewWidget<EnquiriesAdmissionsJourneyViewModel> {
  EnquiryDetailArgs enquiryDetail;
  EnquiriesAdmissionsJourneyPageView(super.providerBase,{required this.enquiryDetail,});

  actionOnMenu(int index, BuildContext context,
      EnquiriesAdmissionsJourneyViewModel model) {
    switch (index) {
      case 0:
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: {"routeFrom": "enquiry", "enquiryDetailArgs": enquiryDetail});
      case 1:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 2:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 3:{
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailView())? Navigator.of(context).pushNamed(
          RoutePaths.detailsViewSchoolTourPage,arguments: enquiryDetail
        ).then((value){
          model.getEnquiryDetail(enquiryID: enquiryDetail.enquiryId??'');
        }) : Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage,arguments: {'enquiryDetailArgs': enquiryDetail}).then((value) {
              if(value!=null){
                model.getEnquiryDetail(enquiryID: enquiryDetail.enquiryId??'');
              }
            },);
      }
      case 4:
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage,arguments: enquiryDetail);
      default:
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailViewCompetency())? Navigator.of(context).pushNamed(
          RoutePaths.competencyTestDetailPage,arguments: enquiryDetail
        ).then((value){
          model.getEnquiryDetail(enquiryID: enquiryDetail.enquiryId??'');
        }) : Navigator.of(context)
           .pushNamed(RoutePaths.scheduleCompetencyTest,arguments: {'enquiryDetailArgs': enquiryDetail}).then((value){
            if(value!=null){
              model.getEnquiryDetail(enquiryID: enquiryDetail.enquiryId??'');
            }
           });
    }
  }

  @override
  Widget build(
      BuildContext context, EnquiriesAdmissionsJourneyViewModel model) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStreamBuilder<Resource<EnquiryDetailBase>>(
                stream: model.fetchEnquiryDetail,
                dataBuilder: (context, snapshot) {
                  return snapshot?.status==Status.loading?const Center(child: CircularProgressIndicator(),):
                  ListItem(
                    image: AppImages.personIcon,
                    name: "${snapshot?.data?.data?.parentFirstName} ${snapshot?.data?.data?.parentLastName}",
                    year: "${snapshot?.data?.data!.academicYearId}",
                    id: snapshot?.data?.data?.enquiryNumber??'',
                    title: snapshot?.data?.data?.existingSchoolName??'',
                    subtitle: "${snapshot?.data?.data?.grade} | ${snapshot?.data?.data?.existingSchoolBoard} | ${enquiryDetail.shift} | Stream-${enquiryDetail.stream}",
                    buttontext: snapshot?.data?.data?.currentStage??'',
                    compeletion: '',
                    status: enquiryDetail.status??'',
                  );
                }, initialData: Resource.none(),
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
                        context, RoutePaths.enquiriesDetailsPage,arguments: enquiryDetail),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.eyeIcon,
                          color: Theme.of(context).primaryColor,
                        ),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
                        CommonText(
                          text: 'View Details',
                          style: AppTypography.subtitle1
                              .copyWith(color: Theme.of(context).primaryColor),
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
                onData: (value) {

                },
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
                                      subtitle:(result?.data?.data?[index].comment??'').isEmptyOrNull()
                                          ? null
                                          : CommonText(
                                              text: result?.data?.data?[index]
                                                    .comment ??
                                                ''),
                                      title: CommonText(
                                        text: result?.data?.data?[index].stage??'',
                                      ),
                                      state: result?.data?.data?[index].status == "Open" || result?.data?.data?[index].status == "In Progress"
                                          ? StepState.indexed
                                          : StepState.complete,
                                      isActive: result?.data?.data?[index].status != "Open",
                                      content: const SizedBox.shrink());
                                },
                              ) ,
                              activeStep: (result?.data?.data??[]).indexWhere((element) => (element.status != "Open")) == -1 ? 0 :
                                (result?.data?.data??[]).indexWhere((element) => (element.status != "Open")));
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
                  bottom: 110,
                  child: data!
                      ? Menu(
                          height: 340.h,
                          menuData: model.menuData,
                          onTap: (index) {
                            actionOnMenu(index, context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                        )
                      : SizedBox.fromSize());
            })
      ],
    );
  }
}
