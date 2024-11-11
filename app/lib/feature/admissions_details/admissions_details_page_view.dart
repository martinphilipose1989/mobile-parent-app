import 'dart:developer';

import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
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
      int index, BuildContext context, AdmissionsDetailsViewModel model) {
    setEnquiryDetailsArgs(model);
    switch (index) {
      case 0:
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailView())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.detailsViewSchoolTourPage,
                    arguments: admissionDetail)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: admissionDetail.enquiryId ?? '');
              })
            : Navigator.of(context)
                .pushNamed(RoutePaths.scheduleSchoolTourPage, arguments: {
                'enquiryDetailArgs': admissionDetail,
              }).then(
                (value) {
                  model.getEnquiryDetail(
                      enquiryID: admissionDetail.enquiryId ?? '');
                },
              );
      case 1:
        model.showMenuOnFloatingButton.add(false);

        model.moveToNextStage();
      // return Navigator.of(context)
      //     .pushNamed(
      //   RoutePaths.payments,
      //   arguments: PaymentArguments(
      //     phoneNo: model.enquiryDetails.value.parentMobile ?? '',
      //     enquiryId: admissionDetail.enquiryId,
      //     enquiryNo: admissionDetail.enquiryNumber,
      //     studentName:
      //         "${model.enquiryDetails.value.studentFirstName} ${model.enquiryDetails.value.studentLastName}",
      //   ),
      // )
      //     .then((value) {
      // TODO: call admision journey api
      //  model.getAdmissionJourney(enquiryID: admissionDetail.enquiryId, type: admissionDetail.enquiryType);
      // });
      case 2:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 3:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);

      case 4:
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailViewCompetency())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.competencyTestDetailPage,
                    arguments: admissionDetail)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: admissionDetail.enquiryId ?? '');
              })
            : Navigator.of(context).pushNamed(RoutePaths.scheduleCompetencyTest,
                arguments: {
                    'enquiryDetailArgs': admissionDetail
                  }).then((value) {
                if (value != null) {
                  model.getEnquiryDetail(
                      enquiryID: admissionDetail.enquiryId ?? '');
                }
              });
      case 5:
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context).pushNamed(RoutePaths.enquiriesTimelinePage,
            arguments: admissionDetail);
      case 6:
        model.showMenuOnFloatingButton.add(false);
        log("enquiryDetails ==> ${model.enquiryDetails.value.schoolId}");
        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: {
          "routeFrom": "admission",
          "enquiryDetailArgs": admissionDetail,
          "enquiryDetail": model.enquiryDetails.value,
          "editRegistrationDetails": true
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
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListItem(
                  image: AppImages.personIcon,
                  name: "${admissionDetail.studentName} ",
                  year: admissionDetail.academicYear ?? '',
                  id: admissionDetail.enquiryNumber ?? '',
                  title: admissionDetail.school ?? '',
                  subtitle:
                      "${admissionDetail.grade} | ${admissionDetail.board} | ${admissionDetail.shift} | Stream-${admissionDetail.stream} ",
                  buttontext: admissionDetail.currentStage ?? '',
                  compeletion:
                      "${(admissionDetail.formCompletionPercentage ?? 0).toString()}% Completed",
                  status: admissionDetail.status ?? '',
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
                      onTap: () {
                        setEnquiryDetailsArgs(model);
                        Navigator.pushNamed(
                            context, RoutePaths.registrationDetails,
                            arguments: {
                              "routeFrom": "admission",
                              "enquiryDetailArgs": admissionDetail,
                              "enquiryDetail": model.enquiryDetails.value
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
                            log("model.menuData ${model.menuData[index]['id']} ${model.menuData[index]}");
                            final isRegistrationNotActive = model
                                        .menuData.first['name']
                                        .toString()
                                        .toLowerCase() ==
                                    'book test' &&
                                model.menuData.first['isActive'] == false;
                            if (isRegistrationNotActive) {
                              log("model.menuData ${model.menuData[index]['id']} ${model.menuData[index]}");

                              actionOnMenu(model.menuData[index]['id'] + 1,
                                  context, model);
                            } else {
                              actionOnMenu(
                                  model.menuData[index]['id'], context, model);
                            }
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                          menuData: model.menuData
                              .where((e) => e['isActive'] == true)
                              .toList(),
                        )
                      : SizedBox.fromSize());
            }),
        AppStreamBuilder<Resource<MoveToNextStageEnquiryResponse>>(
            stream: model.moveStageSubject,
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
    log("admissionDetail.brandId ${model.enquiryDetails.value.brandId}");
    log("admissionDetail.brandName ${model.enquiryDetails.value.brandName}");

    admissionDetail.brandId = model.enquiryDetails.value.brandId;
    admissionDetail.brandName = model.enquiryDetails.value.brandName;
    admissionDetail.schoolId = model.enquiryDetails.value.schoolId;
    admissionDetail.boardId = model.enquiryDetails.value.boardId;
    admissionDetail.academicYearId = model.enquiryDetails.value.academicYearId;
    admissionDetail.gradeId = model.enquiryDetails.value.gradeId;
    admissionDetail.courseId = model.enquiryDetails.value.courseId;
  }
}
