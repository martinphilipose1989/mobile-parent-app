import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';

import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/edit_enquiry_details.dart';
import 'package:app/molecules/enquiries/enquiries_details_view.dart';
import 'package:app/molecules/enquiries/upload_documents.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesDetailsPageView
    extends BasePageViewWidget<EnquiriesDetailsPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  EnquiriesDetailsPageView(super.providerBase, this.enquiryDetailArgs);

  actionOnMenu(
      String menuKey, BuildContext context, EnquiriesDetailsPageModel model) {
    switch (menuKey) {
      case 'registration':
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: {
          "routeFrom": "enquiry",
          "enquiryDetailArgs": enquiryDetailArgs,
          "enquiryDetail": model.enquiryDetail.value
        });
      case 'call':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 'email':
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 'edit':
        if (model.selectedValue.value == 0) {
          List<Future> mdmAttributes = [
            model.getMdmAttribute(infoType: 'grade'),
            model.getMdmAttribute(infoType: 'schoolLocation'),
            model.getMdmAttribute(infoType: 'gender'),
            model.getMdmAttribute(infoType: 'board'),
            model.getMdmAttribute(infoType: 'course'),
            model.getMdmAttribute(infoType: 'stream'),
            model.getMdmAttribute(infoType: 'shift'),
            model.getMdmAttribute(infoType: 'batch'),
            model.getMdmAttribute(infoType: 'psaSubType'),
            model.getMdmAttribute(infoType: 'psaCategory'),
            model.getMdmAttribute(infoType: 'psaSubCategory'),
            model.getMdmAttribute(infoType: 'periodOfService')
          ];
          Future.wait(mdmAttributes).then((_) {
            if (enquiryDetailArgs.enquiryType?.toLowerCase() ==
                EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
              model.getIvtDetails(
                  enquiryID: enquiryDetailArgs.enquiryId ?? '', isEdit: true);
            } else if (enquiryDetailArgs.enquiryType ==
                EnquiryTypeEnum.psa.type) {
              model.getPsaDetails(
                  enquiryID: enquiryDetailArgs.enquiryId ?? '', isEdit: true);
            } else {
              model.getNewAdmissionDetails(
                  enquiryID: enquiryDetailArgs.enquiryId ?? '', isEdit: true);
            }
          });
          model.editRegistrationDetails.add(true);
          model.showMenuOnFloatingButton.add(false);
        } else {
          model.getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
          model.editRegistrationDetails.add(true);
          model.showMenuOnFloatingButton.add(false);
        }
        return null;
      case 'tour':
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailView())
            ? Navigator.of(context)
                .pushNamed(RoutePaths.detailsViewSchoolTourPage,
                    arguments: enquiryDetailArgs)
                .then((value) {
                model.getEnquiryDetail(
                    enquiryID: enquiryDetailArgs.enquiryId ?? '');
              })
            : Navigator.of(context).pushNamed(RoutePaths.scheduleSchoolTourPage,
                arguments: {'enquiryDetailArgs': enquiryDetailArgs}).then(
                (value) {
                  if (value != null) {
                    model.getEnquiryDetail(
                        enquiryID: enquiryDetailArgs.enquiryId ?? '');
                  }
                },
              );
      case 'timeline':
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context).pushNamed(RoutePaths.enquiriesTimelinePage,
            arguments: enquiryDetailArgs);
      case 'payments':
        model.showMenuOnFloatingButton.add(false);
        model.moveToNextStage();
        return;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, EnquiriesDetailsPageModel model) {
    return AppStreamBuilder<bool>(
        stream: model.isLoading,
        initialData: model.isLoading.value,
        dataBuilder: (context, snapshot) {
          return Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
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
                                        year:
                                            "${snapshot?.data?.data?.academicYear}",
                                        id: snapshot
                                                ?.data?.data?.enquiryNumber ??
                                            '',
                                        title: snapshot?.data?.data
                                                ?.existingSchoolName ??
                                            '',
                                        subtitle:
                                            "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board} | ${enquiryDetailArgs.shift} | Stream-${enquiryDetailArgs.stream}",
                                        buttontext: snapshot
                                                ?.data?.data?.currentStage ??
                                            '',
                                        compeletion: '',
                                        status: enquiryDetailArgs.status ?? '',
                                      );
                              },
                              initialData: Resource.none(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: Strings.of(context).admission_journey,
                                style: AppTypography.body1,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.remove_red_eye_outlined,
                                      color: AppColors.primary),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CommonText(
                                    text: Strings.of(context).view_details,
                                    style: AppTypography.subtitle2.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CommonTabPage(
                                firstTabTitle: Strings.of(context).enquiry_details,
                                secondTabTitle: Strings.of(context).upload_documents,
                                tabController: model.tabController,
                                selectedValue: model.selectedValue,
                                onSecondTabChange: () {
                                  model.getEnquiryDetail(
                                      enquiryID:
                                          enquiryDetailArgs.enquiryId ?? '');
                                },
                                onFirstTabChange: () {
                                  if (enquiryDetailArgs.enquiryType
                                          ?.toLowerCase() ==
                                      EnquiryTypeEnum.kidsClub.type
                                          .toLowerCase()) {
                                    model.getIvtDetails(
                                        enquiryID:
                                            enquiryDetailArgs.enquiryId ?? '',
                                        isEdit: model
                                            .editRegistrationDetails.value);
                                  } else if (enquiryDetailArgs.enquiryType ==
                                      EnquiryTypeEnum.psa.type) {
                                    model.getPsaDetails(
                                        enquiryID:
                                            enquiryDetailArgs.enquiryId ?? '',
                                        isEdit: model
                                            .editRegistrationDetails.value);
                                  } else {
                                    model.getNewAdmissionDetails(
                                        enquiryID:
                                            enquiryDetailArgs.enquiryId ?? '',
                                        isEdit: model
                                            .editRegistrationDetails.value);
                                  }
                                },
                              ),
                              AppStreamBuilder<bool>(
                                stream: model.editRegistrationDetails,
                                initialData:
                                    model.editRegistrationDetails.value,
                                dataBuilder:
                                    (context, editRegistrationDetailsData) {
                                  return AppStreamBuilder<int>(
                                    stream: model.selectedValue,
                                    initialData: model.selectedValue.value,
                                    dataBuilder: (context, data) {
                                      return data == 1
                                          ? AppStreamBuilder<
                                                  Resource<EnquiryDetailBase>>(
                                              stream: model.fetchEnquiryDetail,
                                              initialData: Resource.none(),
                                              onData: (value) {
                                                if (value.status ==
                                                    Status.success) {
                                                  value.data?.data
                                                      ?.enquiryDocuments
                                                      ?.forEach((file) => model
                                                          .isDocumentUploaded
                                                          .add(ValueNotifier(
                                                              (file.file ?? "")
                                                                      .isNotEmpty ||
                                                                  file.file !=
                                                                      null)));
                                                }
                                              },
                                              dataBuilder: (context, snapshot) {
                                                if (snapshot?.status ==
                                                    Status.success) {
                                                  return UploadDocuments(
                                                    model: model,
                                                    enquiryID: enquiryDetailArgs
                                                            .enquiryId ??
                                                        '',
                                                    enquiryDetail:
                                                        snapshot?.data?.data,
                                                  );
                                                }
                                                if (snapshot?.status ==
                                                        Status.loading ||
                                                    snapshot?.status ==
                                                        Status.none) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return UploadDocuments(
                                                    model: model,
                                                    enquiryID: enquiryDetailArgs
                                                            .enquiryId ??
                                                        '',
                                                  );
                                                }
                                              })
                                          : model.editRegistrationDetails.value
                                              ? SingleChildScrollView(
                                                  child: ((enquiryDetailArgs
                                                                  .enquiryType ??
                                                              '')
                                                          .contains(
                                                              "New Admission"))
                                                      ? AppStreamBuilder<
                                                              Resource<
                                                                  NewAdmissionBase>>(
                                                          stream: model
                                                              .newAdmissionDetail,
                                                          initialData:
                                                              Resource.none(),
                                                          dataBuilder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    ?.status ==
                                                                Status
                                                                    .loading) {
                                                              return const CircularProgressIndicator();
                                                            }
                                                            if (snapshot
                                                                    ?.status ==
                                                                Status
                                                                    .success) {
                                                              return EditEnquiriesDetailsWidget(
                                                                enquiryDetailArgs:
                                                                    enquiryDetailArgs,
                                                                newAdmissionDetail:
                                                                    model
                                                                        .newAdmissionDetails
                                                                        ?.value,
                                                                model: model,
                                                              );
                                                            }
                                                            if (snapshot
                                                                    ?.status ==
                                                                Status.error) {
                                                              return  CommonText(
                                                                  text:
                                                                      Strings.of(context).details_not_found);
                                                            } else {
                                                              return const CircularProgressIndicator();
                                                            }
                                                          })
                                                      : (enquiryDetailArgs
                                                                  .enquiryType ==
                                                              EnquiryTypeEnum
                                                                  .psa.type)
                                                          ? AppStreamBuilder<
                                                                  Resource<
                                                                      PsaResponse>>(
                                                              stream: model
                                                                  .psaDetail,
                                                              initialData:
                                                                  Resource
                                                                      .none(),
                                                              dataBuilder:
                                                                  (context,
                                                                      snapshot) {
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .loading) {
                                                                  return const CircularProgressIndicator();
                                                                }
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .success) {
                                                                  return EditEnquiriesDetailsWidget(
                                                                    enquiryDetailArgs:
                                                                        enquiryDetailArgs,
                                                                    psaDetail: model
                                                                        .psaDetails
                                                                        ?.value,
                                                                    model:
                                                                        model,
                                                                  );
                                                                }
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .error) {
                                                                  return CommonText(
                                                                      text:
                                                                      Strings.of(context).details_not_found);
                                                                } else {
                                                                  return const CircularProgressIndicator();
                                                                }
                                                              })
                                                          : AppStreamBuilder<
                                                                  Resource<IVTBase>>(
                                                              stream: model.ivtDetail,
                                                              initialData: Resource.none(),
                                                              dataBuilder: (context, snapshot) {
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .loading) {
                                                                  return const CircularProgressIndicator();
                                                                }
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .error) {
                                                                  return  CommonText(
                                                                      text:
                                                                      Strings.of(context).details_not_found);
                                                                }
                                                                if (snapshot
                                                                        ?.status ==
                                                                    Status
                                                                        .success) {
                                                                  return EditEnquiriesDetailsWidget(
                                                                    enquiryDetailArgs:
                                                                        enquiryDetailArgs,
                                                                    ivtDetail: model
                                                                        .ivtDetails
                                                                        ?.value,
                                                                    model:
                                                                        model,
                                                                  );
                                                                } else {
                                                                  return const CircularProgressIndicator();
                                                                }
                                                              }))
                                              : (enquiryDetailArgs.enquiryType?.toLowerCase() == EnquiryTypeEnum.kidsClub.type.toLowerCase())
                                                  ? AppStreamBuilder<Resource<IVTBase>>(
                                                      stream: model.ivtDetail,
                                                      initialData: Resource.none(),
                                                      dataBuilder: (context, snapshot) {
                                                        if (snapshot?.status ==
                                                                Status
                                                                    .loading ||
                                                            snapshot?.status ==
                                                                Status.none) {
                                                          return const CircularProgressIndicator();
                                                        }
                                                        if (snapshot?.status ==
                                                            Status.error) {
                                                          return CommonText(
                                                              text:
                                                              Strings.of(context).details_not_found);
                                                        } else {
                                                          return EnquiriesDetailsViewWidget(
                                                            enquiryDetailArgs:
                                                                enquiryDetailArgs,
                                                            ivtDetail: model
                                                                .ivtDetails
                                                                ?.value,
                                                          );
                                                        }
                                                      })
                                                  : (enquiryDetailArgs.enquiryType == EnquiryTypeEnum.psa.type)
                                                      ? AppStreamBuilder<Resource<PsaResponse>>(
                                                          stream: model.psaDetail,
                                                          initialData: Resource.none(),
                                                          dataBuilder: (context, snapshot) {
                                                            if (snapshot?.status == Status.loading ||
                                                                snapshot?.status ==
                                                                    Status
                                                                        .loading ||
                                                                snapshot?.status ==
                                                                    Status
                                                                        .none) {
                                                              return const CircularProgressIndicator();
                                                            }
                                                            if (snapshot
                                                                    ?.status ==
                                                                Status.error) {
                                                              return  CommonText(
                                                                  text:
                                                                  Strings.of(context).details_not_found);
                                                            } else {
                                                              return EnquiriesDetailsViewWidget(
                                                                enquiryDetailArgs:
                                                                    enquiryDetailArgs,
                                                                psaDetail: model
                                                                    .psaDetails
                                                                    ?.value,
                                                              );
                                                            }
                                                          })
                                                      : AppStreamBuilder<Resource<NewAdmissionBase>>(
                                                          stream: model.newAdmissionDetail,
                                                          initialData: Resource.none(),
                                                          dataBuilder: (context, snapshot) {
                                                            if (snapshot?.status == Status.loading ||
                                                                snapshot?.status ==
                                                                    Status
                                                                        .loading ||
                                                                snapshot?.status ==
                                                                    Status
                                                                        .none) {
                                                              return const CircularProgressIndicator();
                                                            }
                                                            if (snapshot
                                                                    ?.status ==
                                                                Status.error) {
                                                              return CommonText(
                                                                  text:
                                                                  Strings.of(context).details_not_found);
                                                            } else {
                                                              return EnquiriesDetailsViewWidget(
                                                                enquiryDetailArgs:
                                                                    enquiryDetailArgs,
                                                                newAdmissionDetail:
                                                                    model
                                                                        .newAdmissionDetails
                                                                        ?.value,
                                                              );
                                                            }
                                                          });
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                                height: 400.h,
                                menuData: model.menuData
                                    .where((e) => e['isActive'] == true)
                                    .toList(),
                                onTap: (index) {
                                  final activeMenuList = model.menuData
                                      .where((e) => e['isActive'] == true)
                                      .toList();

                                  actionOnMenu(activeMenuList[index]['key'],
                                      context, model);
                                },
                                showMenuOnFloatingButton:
                                    model.showMenuOnFloatingButton,
                              )
                            : SizedBox.fromSize());
                  }),
              if (model.isLoading.value) ...[const CommonAppLoader()]
            ],
          );
        });
  }
}
