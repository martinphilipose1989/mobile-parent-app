import 'dart:developer';

import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';

import 'package:app/model/resource.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';

import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsPageView
    extends BasePageViewWidget<AdmissionsDetailsViewModel> {
  final EnquiryDetailArgs admissionDetail;
  AdmissionsDetailsPageView(super.providerBase,
      {required this.admissionDetail});

  actionOnMenu(
      String key, BuildContext context, AdmissionsDetailsViewModel model) {
    setEnquiryDetailsArgs(model);
    switch (key) {
      case 'schooltour':
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailView())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.detailsViewSchoolTourPage,
                    arguments: admissionDetail)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: admissionDetail.enquiryId ?? '');
                model.getAdmissionJourney(
                    enquiryID: admissionDetail.enquiryId ?? '',
                    type: 'admission');
              })
            : Navigator.of(context)
                .pushNamed(RoutePaths.scheduleSchoolTourPage, arguments: {
                'enquiryDetailArgs': admissionDetail,
              }).then(
                (value) {
                  model.getEnquiryDetail(
                      enquiryID: admissionDetail.enquiryId ?? '');
                  model.getAdmissionJourney(
                      enquiryID: admissionDetail.enquiryId ?? '',
                      type: 'admission');
                },
              );
      case 'payment':
        model.showMenuOnFloatingButton.add(false);

        model.makePaymentRequest();

      case 'call':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 'email':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);

      case 'competency':
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailViewCompetency())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.competencyTestDetailPage,
                    arguments: admissionDetail)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: admissionDetail.enquiryId ?? '');
                model.getAdmissionJourney(
                    enquiryID: admissionDetail.enquiryId ?? '',
                    type: 'admission');
              })
            : Navigator.of(context).pushNamed(RoutePaths.scheduleCompetencyTest,
                arguments: {
                    'enquiryDetailArgs': admissionDetail
                  }).then((value) {
                model.getEnquiryDetail(
                    enquiryID: admissionDetail.enquiryId ?? '');
                model.getAdmissionJourney(
                    enquiryID: admissionDetail.enquiryId ?? '',
                    type: 'admission');
              });
      case 'timeline':
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage,
                arguments: admissionDetail)
            .then((_) {
          model.getEnquiryDetail(enquiryID: admissionDetail.enquiryId ?? '');
          model.getAdmissionJourney(
              enquiryID: admissionDetail.enquiryId ?? '', type: 'admission');
        });
      case 'registration':
        model.showMenuOnFloatingButton.add(false);
        setEnquiryDetailsArgs(model);

        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: {
          "routeFrom": "admission",
          "enquiryDetailArgs": admissionDetail,
          "enquiryDetail": model.enquiryDetails.value,
          "editRegistrationDetails": true
        }).then((_) {
          model.getEnquiryDetail(enquiryID: admissionDetail.enquiryId ?? '');
          model.getAdmissionJourney(
              enquiryID: admissionDetail.enquiryId ?? '', type: 'admission');
        });

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
            margin:  EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStreamBuilder<Resource<EnquiryDetailBase>>(
                  dataBuilder: (context, snapshot) {
                    return snapshot?.status == Status.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListItem(
                            image: AppImages.personIcon,
                            name:
                                "${snapshot?.data?.data?.studentFirstName} ${snapshot?.data?.data?.studentLastName} ",
                            year: admissionDetail.academicYear ?? '',
                            id: snapshot?.data?.data?.enquiryNumber ?? '',
                            title:
                                snapshot?.data?.data?.existingSchoolName ?? '',
                            subtitle:
                                "${snapshot?.data?.data?.grade} | ${snapshot?.data?.data?.existingSchoolBoard} | ${admissionDetail.shift} | Stream-${admissionDetail.stream} ",
                            buttontext: admissionDetail.currentStage ?? '',
                            compeletion:
                                "${(admissionDetail.formCompletionPercentage ?? 0).toString()}% Completed",
                            status: snapshot?.data?.data?.currentStage ?? '',
                          );
                  },
                  stream: model.fetchEnquiryDetail,
                  initialData: Resource.none(),
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: 'Admission Journey',
                      style: AppTypography.subtitle1,
                    ),
                    if ((model.enquiryDetailArgs.enquiryType ==
                            EnquiryTypeEnum.psa.type &&
                        model.enquiryDetailArgs.admissionStatus ==
                            "Approved")) ...{
                      InkWell(
                        onTap: () {
                          setEnquiryDetailsArgs(model);
                          Navigator.pushNamed(
                              context, RoutePaths.registrationDetails,
                              arguments: {
                                "routeFrom": "admission",
                                "enquiryDetailArgs": admissionDetail,
                                "enquiryDetail": model.enquiryDetails.value,
                                "editRegistrationDetails":
                                    admissionDetail.enquiryType ==
                                        EnquiryTypeEnum.psa.type
                              }).then((val) {
                            model.getEnquiryDetail(
                                enquiryID: admissionDetail.enquiryId ?? '');
                            model.getAdmissionJourney(
                                enquiryID: admissionDetail.enquiryId ?? '',
                                type: 'admission');
                          });
                        },
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
                    } else if ((model.enquiryDetailArgs.enquiryType ==
                            EnquiryTypeEnum.kidsClub.type &&
                        model.enquiryDetailArgs.admissionStatus ==
                            "Approved")) ...{
                      InkWell(
                        onTap: () {
                          setEnquiryDetailsArgs(model);
                          Navigator.pushNamed(
                              context, RoutePaths.registrationDetails,
                              arguments: {
                                "routeFrom": "admission",
                                "enquiryDetailArgs": admissionDetail,
                                "enquiryDetail": model.enquiryDetails.value,
                                "editRegistrationDetails":
                                    admissionDetail.enquiryType ==
                                        EnquiryTypeEnum.kidsClub.type
                              }).then((val) {
                            model.getEnquiryDetail(
                                enquiryID: admissionDetail.enquiryId ?? '');
                            model.getAdmissionJourney(
                                enquiryID: admissionDetail.enquiryId ?? '',
                                type: 'admission');
                          });
                        },
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
                    } else if (model.enquiryDetailArgs.enquiryType ==
                        EnquiryTypeEnum.newAdmission.type) ...{
                      InkWell(
                        onTap: () {
                          setEnquiryDetailsArgs(model);
                          Navigator.pushNamed(
                              context, RoutePaths.registrationDetails,
                              arguments: {
                                "routeFrom": "admission",
                                "enquiryDetailArgs": admissionDetail,
                                "enquiryDetail": model.enquiryDetails.value,
                                "editRegistrationDetails": false
                              }).then((val) {
                            model.getEnquiryDetail(
                                enquiryID: admissionDetail.enquiryId ?? '');
                            model.getAdmissionJourney(
                                enquiryID: admissionDetail.enquiryId ?? '',
                                type: 'admission');
                          });
                        },
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
                    }
                  ],
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                AppStreamBuilder<Resource<AdmissionJourneyBase>>(
                    stream: model.fetchAdmissionJourney,
                    initialData: Resource.none(),
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
                                          (result?.data?.data?[index].comment ??
                                                      '')
                                                  .isEmptyOrNull()
                                              ? null
                                              : CommonText(
                                                  text: result
                                                          ?.data
                                                          ?.data?[index]
                                                          .comment ??
                                                      ''),
                                      title: CommonText(
                                        text:
                                            result?.data?.data?[index].stage ??
                                                '',
                                      ),
                                      state:
                                          result?.data?.data?[index].status !=
                                                      "Open" ||
                                                  result?.data?.data?[index]
                                                          .status !=
                                                      "In Progress"
                                              ? StepState.indexed
                                              : StepState.complete,
                                      isActive:
                                          result?.data?.data?[index].status !=
                                              "Open",
                                      content: const SizedBox.shrink());
                                },
                              ),
                              activeStep: (result?.data?.data ?? []).indexWhere(
                                          (element) =>
                                              (element.status != "Open")) ==
                                      -1
                                  ? 0
                                  : (result?.data?.data ?? []).indexWhere(
                                      (element) => (element.status != "Open")));
                        case Status.error:
                          return const Center(
                            child: Text('Admission journey not found'),
                          );
                        default:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                      }
                    }),
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
                  bottom: 110,
                  child: data!
                      ? Menu(
                          height: 395.h,
                          onTap: (index) {
                            final newMenuData = model.menuData
                                .where((e) => e['isActive'] == true)
                                .toList();

                            actionOnMenu(
                                newMenuData[index]['key'], context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                          menuData: model.menuData
                              .where((e) => e['isActive'] == true)
                              .toList(),
                        )
                      : SizedBox.fromSize());
            }),
        AppStreamBuilder<Resource<bool>>(
            stream: model.isLoadingSubject,
            initialData: Resource.none(),
            dataBuilder: (context, data) {
              return data?.status == Status.loading
                  ? const CommonAppLoader()
                  : const SizedBox.shrink();
            }),
      ],
    );
  }

  void setEnquiryDetailsArgs(AdmissionsDetailsViewModel model) {
    admissionDetail.brandId = model.enquiryDetails.value.brandId;
    admissionDetail.brandName = model.enquiryDetails.value.brandName;
    admissionDetail.schoolId = model.enquiryDetails.value.schoolId;
    admissionDetail.boardId = model.enquiryDetails.value.boardId;
    admissionDetail.academicYearId = model.enquiryDetails.value.academicYearId;
    admissionDetail.gradeId = model.enquiryDetails.value.gradeId;
    admissionDetail.courseId = model.enquiryDetails.value.courseId;
    admissionDetail.streamId = model.enquiryDetails.value.streamId;
    admissionDetail.shiftId = model.enquiryDetails.value.shiftId;
  }
}
