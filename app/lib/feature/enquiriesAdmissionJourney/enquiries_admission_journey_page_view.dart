import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page_model.dart';
import 'package:app/model/resource.dart';

import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/registration_details/registrations_widgets_read_only/menu.dart';

// ignore: must_be_immutable
class EnquiriesAdmissionsJourneyPageView
    extends BasePageViewWidget<EnquiriesAdmissionsJourneyViewModel> {
  EnquiryDetailArgs enquiryDetail;
  // ignore: use_key_in_widget_constructors
  EnquiriesAdmissionsJourneyPageView(
    super.providerBase, {
    required this.enquiryDetail,
  });

  actionOnMenu(String menuKey, BuildContext context,
      EnquiriesAdmissionsJourneyViewModel model) {
    setEnquiryDetailsArgs(model);
    switch (menuKey) {
      case 'registration':
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: {
          "routeFrom": "enquiry",
          "enquiryDetailArgs": enquiryDetail,
          "enquiryDetail": model.enquiryDetail
        }).then((_) {
          model.getEnquiryDetail(enquiryID: "${enquiryDetail.enquiryId}");
          model.getAdmissionJourney(
              enquiryID: "${enquiryDetail.enquiryId}", type: "enquiry");
        });
      case 'call':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 'email':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 'tour':
        {
          model.showMenuOnFloatingButton.add(false);
          return (model.isDetailView())
              ? Navigator.of(context)
                  .pushNamed(RoutePaths.detailsViewSchoolTourPage,
                      arguments: enquiryDetail)
                  .then((value) {
                  model.getEnquiryDetail(
                      enquiryID: "${enquiryDetail.enquiryId}");
                  model.getAdmissionJourney(
                      enquiryID: "${enquiryDetail.enquiryId}", type: "enquiry");
                })
              : Navigator.of(context).pushNamed(
                  RoutePaths.scheduleSchoolTourPage,
                  arguments: {'enquiryDetailArgs': enquiryDetail}).then(
                  (value) {
                    if (value != null) {
                      model.getEnquiryDetail(
                          enquiryID: "${enquiryDetail.enquiryId}");
                      model.getAdmissionJourney(
                          enquiryID: "${enquiryDetail.enquiryId}",
                          type: "enquiry");
                    }
                  },
                );
        }
      case 'timeline':
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context).pushNamed(RoutePaths.enquiriesTimelinePage,
            arguments: enquiryDetail);
      case 'payments':
        model.showMenuOnFloatingButton.add(false);

        model.moveToNextStage();
        return;
      default:
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailViewCompetency())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.competencyTestDetailPage,
                    arguments: enquiryDetail)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: enquiryDetail.enquiryId ?? '');
              })
            : Navigator.of(context).pushNamed(RoutePaths.scheduleCompetencyTest,
                arguments: {'enquiryDetailArgs': enquiryDetail}).then((value) {
                if (value != null) {
                  model.getEnquiryDetail(
                      enquiryID: "${enquiryDetail.enquiryId}");
                  model.getAdmissionJourney(
                      enquiryID: "${enquiryDetail.enquiryId}", type: "enquiry");
                }
              });
    }
  }

  @override
  Widget build(
      BuildContext context, EnquiriesAdmissionsJourneyViewModel model) {
    return Stack(
      children: [
        StudentEnquiryDetailsCard(
            enquiryDetail: enquiryDetail,
            model: model,
            callback: () {
              setEnquiryDetailsArgs(model);
            }),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return data == true
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
                          menuData: model.menuData
                              .where((e) => e['isActive'] == true)
                              .toList(),
                          onTap: (index) {
                            final activeMenuList = model.menuData
                                .where((e) => e['isActive'] == true)
                                .toList();

                            actionOnMenu(
                                activeMenuList[index]['key'], context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                        )
                      : SizedBox.fromSize());
            }),
        AppStreamBuilder<bool>(
          stream: model.isLoading,
          initialData: model.isLoading.value,
          dataBuilder: (context, isLoading) {
            return isLoading == true
                ? const CommonAppLoader()
                : const SizedBox.shrink();
          },
        )
      ],
    );
  }

  void setEnquiryDetailsArgs(EnquiriesAdmissionsJourneyViewModel model) {
    enquiryDetail.brandId = model.enquiryDetail?.brandId;
    enquiryDetail.brandName = model.enquiryDetail?.brandName;
    enquiryDetail.schoolId = model.enquiryDetail?.schoolId;
    enquiryDetail.boardId = model.enquiryDetail?.boardId;
    enquiryDetail.academicYearId = model.enquiryDetail?.academicYearId;
    enquiryDetail.gradeId = model.enquiryDetail?.gradeId;
    enquiryDetail.courseId = model.enquiryDetail?.courseId;
  }
}

class StudentEnquiryDetailsCard extends StatelessWidget {
  const StudentEnquiryDetailsCard(
      {super.key,
      required this.enquiryDetail,
      required this.model,
      required this.callback});

  final EnquiryDetailArgs enquiryDetail;
  final EnquiriesAdmissionsJourneyViewModel model;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStreamBuilder<Resource<EnquiryDetailBase>>(
            stream: model.fetchEnquiryDetail,
            dataBuilder: (context, snapshot) {
              return snapshot?.status == Status.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListItem(
                      image: AppImages.personIcon,
                      name:
                          "${snapshot?.data?.data?.studentFirstName} ${snapshot?.data?.data?.studentLastName}",
                      year: "${snapshot?.data?.data?.academicYear}",
                      id: snapshot?.data?.data?.enquiryNumber ?? '',
                      title: snapshot?.data?.data?.existingSchoolName ?? '',
                      subtitle:
                          "${snapshot?.data?.data?.grade} | ${snapshot?.data?.data?.boardName} | ${enquiryDetail.shift} | Stream-${enquiryDetail.stream}",
                      buttontext: snapshot?.data?.data?.currentStage ?? '',
                      compeletion: '',
                      status: enquiryDetail.status ?? '',
                    );
            },
            initialData: Resource.none(),
          ),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Strings.of(context).admission_journey,
                style: AppTypography.subtitle1,
              ),
              InkWell(
                onTap: () {
                  callback.call();

                  Navigator.pushNamed(context, RoutePaths.enquiriesDetailsPage,
                          arguments: enquiryDetail)
                      .then((value) {
                    model.getEnquiryDetail(
                        enquiryID: "${enquiryDetail.enquiryId}");
                    model.getAdmissionJourney(
                        enquiryID: "${enquiryDetail.enquiryId}",
                        type: Strings.of(context).enquiry);
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.eyeIcon,
                      // ignore: deprecated_member_use
                      color: Theme.of(context).primaryColor,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    CommonText(
                      text: Strings.of(context).view_details,
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
              onData: (value) {},
              dataBuilder: (context, result) {
                switch (result?.status) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    return CommonStepperPage(
                        stepperList: List.generate(
                          (result?.data?.data ?? []).length,
                          (index) {
                            return Step(
                                subtitle:
                                    (result?.data?.data?[index].comment ?? '')
                                            .isEmptyOrNull()
                                        ? null
                                        : CommonText(
                                            text: result?.data?.data?[index]
                                                    .comment ??
                                                ''),
                                title: CommonText(
                                  text: result?.data?.data?[index].stage ?? '',
                                ),
                                state: result?.data?.data?[index].status ==
                                            "Open" ||
                                        result?.data?.data?[index].status ==
                                            "In Progress"
                                    ? StepState.indexed
                                    : StepState.complete,
                                isActive:
                                    result?.data?.data?[index].status != "Open",
                                content: const SizedBox.shrink());
                          },
                        ),
                        activeStep: (result?.data?.data ?? []).indexWhere(
                                    (element) => (element.status != "Open")) ==
                                -1
                            ? 0
                            : (result?.data?.data ?? []).indexWhere(
                                (element) => (element.status != "Open")));
                  case Status.error:
                    return  Center(
                      child: Text(Strings.of(context).enquiry_not_found),
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              }),
        ],
      ),
    );
  }
}
