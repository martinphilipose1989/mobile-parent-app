import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_view.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:network_retrofit/network_retrofit.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesDetailsPage extends BasePage<EnquiriesDetailsPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  const EnquiriesDetailsPage({super.key, required this.enquiryDetailArgs});

  @override
  EnquiriesDetailsPageState createState() => EnquiriesDetailsPageState();
}

class EnquiriesDetailsPageState
    extends AppBasePageState<EnquiriesDetailsPageModel, EnquiriesDetailsPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<EnquiriesDetailsPageModel> provideBase() {
    return enquiriesDetailsPageModelProvider.call(widget.enquiryDetailArgs);
  }

  @override
  void onModelReady(EnquiriesDetailsPageModel model) {
    model.tabController = TabController(length: 2, vsync: this);
    model.context = context;
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesDetailsPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiry Details',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesDetailsPageModel model) {
    return EnquiriesDetailsPageView(provideBase(), widget.enquiryDetailArgs);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildFloatingButton(EnquiriesDetailsPageModel model) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? const SizedBox.shrink()
            : AppStreamBuilder<bool>(
                stream: model.showMenuOnFloatingButton,
                initialData: model.showMenuOnFloatingButton.value,
                dataBuilder: (context, data) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                        height: 56.h,
                        width: 130.w,
                        child: CommonElevatedButton(
                          onPressed: () {
                            if (model.showMenuOnFloatingButton.value) {
                              model.showMenuOnFloatingButton.add(false);
                            } else {
                              model.showMenuOnFloatingButton.add(true);
                            }
                          },
                          text: data! ? 'Close' : 'Action',
                          icon: data ? Icons.close : Icons.add,
                          borderRadius: BorderRadius.circular(10),
                          textColor: Theme.of(context).colorScheme.onTertiary,
                          backgroundColor: AppColors.accent,
                          textStyle: AppTypography.subtitle2.copyWith(
                              color: Theme.of(context).colorScheme.onTertiary),
                        )),
                  );
                },
              );
      },
    );
  }

  @override
  Widget? buildBottomNavigationBar(EnquiriesDetailsPageModel model) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? AppStreamBuilder<int>(
                stream: model.selectedValue,
                initialData: model.selectedValue.value,
                dataBuilder: (context, snapshot) {
                  return Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonElevatedButton(
                            onPressed: () {
                              if (model.selectedValue.value == 1) {
                                model.selectedValue
                                    .add(model.selectedValue.value - 1);
                                if (widget.enquiryDetailArgs.enquiryType ==
                                    "IVT") {
                                  model.getIvtDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      isEdit:
                                          model.editRegistrationDetails.value);
                                } else if (widget
                                        .enquiryDetailArgs.enquiryType ==
                                    EnquiryTypeEnum.psa.type) {
                                  model.getPsaDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      isEdit:
                                          model.editRegistrationDetails.value);
                                } else {
                                  model.getNewAdmissionDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      isEdit:
                                          model.editRegistrationDetails.value);
                                }
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            text: model.selectedValue.value == 0
                                ? 'Cancel'
                                : 'Go Back',
                            borderColor: Theme.of(context).primaryColor,
                            borderWidth: 1,
                            width: 171.w,
                            height: 40.h,
                            textColor: Theme.of(context).primaryColor,
                          ),
                          CommonElevatedButton(
                            onPressed: () {
                              if (model.selectedValue.value == 0) {
                                // model.getEnquiryDetail(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                                if (widget.enquiryDetailArgs.enquiryType ==
                                    "IVT") {
                                  IvtDetailResponseEntity ivtDetail =
                                      IvtDetailResponseEntity();
                                  model.ivtDetails?.value.schoolLocation =
                                      model.selectedSchoolLocationEntity;
                                  model.ivtDetails?.value.studentDetails
                                          ?.firstName =
                                      model.studentFirstNameController.text
                                          .trim();
                                  model.ivtDetails?.value.studentDetails
                                          ?.lastName =
                                      model.studentLastNameController.text
                                          .trim();
                                  model.ivtDetails?.value.studentDetails?.dob =
                                      DateFormat('dd-MM-yyyy').format(
                                          (model.studentDob ?? DateTime.now()));
                                  model.ivtDetails?.value.studentDetails
                                      ?.gender = model.selectedGenderEntity;
                                  model.ivtDetails?.value.studentDetails
                                      ?.grade = model.selectedGradeEntity;
                                  model.ivtDetails?.value.existingSchoolDetails
                                          ?.name =
                                      model.existingSchoolNameController.text
                                          .trim();
                                  model.ivtDetails?.value.existingSchoolDetails
                                          ?.grade =
                                      model.selectedExistingSchoolGradeEntity;
                                  model.ivtDetails?.value.existingSchoolDetails
                                          ?.board =
                                      model.selectedExistingSchoolBoardEntity;
                                  model.ivtDetails?.value.board =
                                      model.selectedBoardEntity;
                                  model.ivtDetails?.value.course =
                                      model.selectedCourseEntity;
                                  model.ivtDetails?.value.stream =
                                      model.selectedStreamEntity;
                                  model.ivtDetails?.value.shift =
                                      model.selectedShiftEntity;
                                  ivtDetail = ivtDetail
                                      .restore(model.ivtDetails!.value);
                                  model.updateIvtDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      ivtDetail: ivtDetail);
                                } else if (widget
                                        .enquiryDetailArgs.enquiryType ==
                                    EnquiryTypeEnum.psa.type) {
                                  PsaDetailResponseEntity psaDetail =
                                      PsaDetailResponseEntity();
                                  model.psaDetails?.value.schoolLocation =
                                      model.selectedSchoolLocationEntity;
                                  model.psaDetails?.value.studentDetails
                                          ?.firstName =
                                      model.studentFirstNameController.text
                                          .trim();
                                  model.psaDetails?.value.studentDetails
                                          ?.lastName =
                                      model.studentLastNameController.text
                                          .trim();
                                  model.psaDetails?.value.studentDetails?.dob =
                                      DateFormat('dd-MM-yyyy').format(
                                          (model.studentDob ?? DateTime.now()));
                                  model.psaDetails?.value.studentDetails
                                      ?.gender = model.selectedGenderEntity;
                                  model.psaDetails?.value.studentDetails
                                      ?.grade = model.selectedGradeEntity;
                                  model.psaDetails?.value.existingSchoolDetails
                                          ?.name =
                                      model.existingSchoolNameController.text
                                          .trim();
                                  model.psaDetails?.value.existingSchoolDetails
                                          ?.grade =
                                      model.selectedExistingSchoolGradeEntity;
                                  model.psaDetails?.value.existingSchoolDetails
                                          ?.board =
                                      model.selectedExistingSchoolBoardEntity;
                                  model.psaDetails?.value.psaBatch =
                                      model.selectedPsaBatchEntity;
                                  model.psaDetails?.value.psaCategory =
                                      model.selectedPsaCategoryEntity;
                                  model.psaDetails?.value.psaSubCategory =
                                      model.selectedPsaSubCategoryEntity;
                                  model.psaDetails?.value.psaSubType =
                                      model.selectedPsaSubTypeEntity;
                                  model.psaDetails?.value.psaPeriodOfService =
                                      model.selectedPeriodOfServiceEntity;
                                  psaDetail = psaDetail
                                      .restore(model.psaDetails!.value);
                                  model.updatePsaDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      psaDetail: psaDetail);
                                } else {
                                  NewAdmissionDetailEntity newAdmissionDetail =
                                      NewAdmissionDetailEntity();
                                  model.newAdmissionDetails?.value.brand =
                                      model.selectedBrandEntity;
                                  model.newAdmissionDetails?.value
                                          .schoolLocation =
                                      model.selectedSchoolLocationEntity!;
                                  model.newAdmissionDetails?.value
                                          .studentDetails?.firstName =
                                      model.studentFirstNameController.text
                                          .trim();
                                  model.newAdmissionDetails?.value
                                          .studentDetails?.lastName =
                                      model.studentLastNameController.text
                                          .trim();
                                  model.newAdmissionDetails?.value
                                          .studentDetails?.dob =
                                      DateFormat('yyyy-MM-dd').format(
                                          (model.studentDob ?? DateTime.now()));
                                  model
                                      .newAdmissionDetails
                                      ?.value
                                      .studentDetails
                                      ?.gender = model.selectedGenderEntity!;
                                  model
                                      .newAdmissionDetails
                                      ?.value
                                      .studentDetails
                                      ?.grade = model.selectedGradeEntity!;
                                  model.newAdmissionDetails?.value
                                          .existingSchoolDetails?.name =
                                      model.existingSchoolNameController.text
                                          .trim();
                                  model.newAdmissionDetails?.value
                                          .existingSchoolDetails?.grade =
                                      model.selectedExistingSchoolGradeEntity!;
                                  model.newAdmissionDetails?.value
                                          .existingSchoolDetails?.board =
                                      model.selectedExistingSchoolBoardEntity!;

                                  if (model.newAdmissionDetails?.value
                                          .enquirerParent ==
                                      "Father") {
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.fatherDetails
                                            ?.firstName =
                                        model.studentsFatherFirstNameController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.fatherDetails
                                            ?.lastName =
                                        model.studentsFatherLastNameController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.fatherDetails
                                            ?.mobile =
                                        model.studentsFatherContactController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.fatherDetails
                                            ?.email =
                                        model.studentsFatherEmailController.text
                                            .trim();
                                  } else {
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.motherDetails
                                            ?.firstName =
                                        model.studentsMotherFirstNameController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.motherDetails
                                            ?.lastName =
                                        model.studentsMotherLastNameController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.motherDetails
                                            ?.mobile =
                                        model.studentsMotherContactController
                                            .text
                                            .trim();
                                    model
                                            .newAdmissionDetails
                                            ?.value
                                            .parentDetails
                                            ?.motherDetails
                                            ?.email =
                                        model.studentsMotherEmailController.text
                                            .trim();
                                  }
                                  newAdmissionDetail =
                                      newAdmissionDetail.restore(
                                          model.newAdmissionDetails!.value);
                                  model.updateNewAdmissionDetails(
                                      enquiryID:
                                          widget.enquiryDetailArgs.enquiryId ??
                                              '',
                                      newAdmissionDetail: newAdmissionDetail);
                                }
                                // model.selectedValue.add(model.selectedValue.value+1);
                              } else if (model.selectedValue.value == 1) {
                                //model.showPopUP(context);
                                model.moveToNextStage(from: 'submit');
                              }
                            },
                            text: model.selectedValue.value == 0
                                ? 'Next'
                                : "Submit",
                            backgroundColor: AppColors.accent,
                            width: 171.w,
                            height: 40.h,
                            textColor: AppColors.accentOn,
                          ),
                        ],
                      ));
                })
            : const SizedBox.shrink();
      },
    );
  }
}
