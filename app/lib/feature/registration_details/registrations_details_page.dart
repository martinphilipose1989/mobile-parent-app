import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registration_details_vaildator.dart';
import 'package:app/feature/registration_details/registrations_details_page_view.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:flutter/material.dart' as flutter;

class RegistrationsDetailsPage extends BasePage<RegistrationsDetailsViewModel> {
  final String routeFrom;
  EnquiryDetailArgs? enquiryDetailArgs;
  ParentInfoEntity? parentInfoEntity;
  EnquiryDetail? enquiryDetail;
  bool editRegistrationDetails;
  RegistrationsDetailsPage(
      {super.key,
      required this.routeFrom,
      this.enquiryDetailArgs,
      this.enquiryDetail,
      this.parentInfoEntity,
      this.editRegistrationDetails = false});

  @override
  flutter.State<RegistrationsDetailsPage> createState() =>
      _RegistrationsDetailsPageState();
}

class _RegistrationsDetailsPageState extends AppBasePageState<
    RegistrationsDetailsViewModel, RegistrationsDetailsPage> {
  @override
  void onModelReady(RegistrationsDetailsViewModel model) {
    model.context = context;
    model.motherPinCodeFocusNode.addListener(() {
      model.pinCodeFocusNode.addListener(() {
        if (!model.pinCodeFocusNode.hasFocus) {
          if (model.pinCodeController.text.isNotEmpty &&
              model.pinCodeController.text.trim().length == 6) {
            model.getCityAndStateByPincode(
                pincode: model.pinCodeController.text.trim(),
                infoType: "fatherInfo");
          }
        }
      });
      if (!model.motherPinCodeFocusNode.hasFocus) {
        if (model.motherPinCodeController.text.isNotEmpty &&
            model.pinCodeController.text.trim().length == 6) {
          model.getCityAndStateByPincode(
              pincode: model.motherPinCodeController.text.trim(),
              infoType: "motherInfo");
        }
      }
    });
    model.guardianPinCodeFocusNode.addListener(() {
      if (!model.guardianPinCodeFocusNode.hasFocus) {
        if (model.guardianPinCodeController.text.isNotEmpty &&
            model.pinCodeController.text.length == 6) {
          model.getCityAndStateByPincode(
              pincode: model.guardianPinCodeController.text.trim(),
              infoType: "guardianInfo");
        }
      }
    });
    model.residentialPinCodeFocusNode.addListener(() {
      if (!model.residentialPinCodeFocusNode.hasFocus) {
        if (model.residentialPinCodeController.text.isNotEmpty &&
            model.pinCodeController.text.trim().length == 6) {
          model.getCityAndStateByPincode(
              pincode: model.residentialPinCodeController.text.trim(),
              infoType: "currentAddress");
        }
      }
    });
    model.permanentPinCodeFocusNode.addListener(() {
      if (!model.permanentPinCodeFocusNode.hasFocus) {
        if (model.permanentResidentialPinCodeController.text.isNotEmpty &&
            model.pinCodeController.text.trim().length == 6) {
          model.getCityAndStateByPincode(
              pincode: model.permanentResidentialPinCodeController.text.trim(),
              infoType: "permanentAddress");
        }
      }
    });
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    if (widget.routeFrom == "enquiry") {
      model.editRegistrationDetails.add(true);
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
        model.getMdmAttribute(infoType: 'periodOfService'),
        model.getMdmAttribute(infoType: "country"),
        // model.getMdmAttribute(infoType: "state"),
        // model.getMdmAttribute(infoType: "city"),
        model.getMdmAttribute(infoType: "bloodGroup"),
        model.getMdmAttribute(infoType: "occupation"),
        model.getMdmAttribute(infoType: "qualification"),
        model.getMdmAttribute(infoType: "religion"),
        model.getMdmAttribute(infoType: "caste"),
        model.getMdmAttribute(infoType: "subcaste"),
        model.getMdmAttribute(infoType: "mother_tongue"),
        model.getMdmAttribute(infoType: "organization"),
        model.getMdmAttribute(infoType: "designation"),
        model.getMdmAttribute(infoType: "nationality"),
        model.getMdmAttribute(infoType: "designation"),
        model.getMdmAttribute(infoType: "personalise_learning_needs"),
        model.getMdmAttribute(infoType: "relationWithChild"),
      ];
      Future.wait(mdmAttributes).then((_) {
        if (widget.enquiryDetailArgs?.enquiryType == "IVT") {
          model.getIvtDetails(
              enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
              isEdit: widget.routeFrom == "enquiry"
                  ? true
                  : model.editRegistrationDetails.value);
        } else if (widget.enquiryDetailArgs?.enquiryType == "PSA") {
          model.getPsaDetails(
              enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
              isEdit: widget.routeFrom == "enquiry"
                  ? true
                  : model.editRegistrationDetails.value);
        } else {
          model.getNewAdmissionDetails(
              enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
              isEdit: widget.routeFrom == "enquiry"
                  ? true
                  : model.editRegistrationDetails.value);
        }
      });
    }
    if (widget.routeFrom != "enquiry") {
      if (widget.editRegistrationDetails) {
        model.editRegistrationDetails.value = widget.editRegistrationDetails;
        if (model.registrationDetails.any((element) =>
            (element["name"] != "Select Subject" ||
                element["name"] != "VAS"))) {
          model.registrationDetails.addAll({
            {'name': 'Select Subject', 'isSelected': false, 'infoType': ''},
            {'name': 'VAS', 'isSelected': false, 'infoType': ''},
          });
        }
        ProviderScope.containerOf(context)
            .read(commonChipListProvider)
            .highlightIndex
            .add(ProviderScope.containerOf(context)
                    .read(commonChipListProvider)
                    .highlightIndex
                    .value +
                6);

        model.showWidget.add(model.showWidget.value + 6);
        model.fetchSubjectList();
        Future.delayed(const Duration(milliseconds: 500)).then((val) {
          model.controller.jumpTo(500);
        });
      }
      model.enquiryDetails = widget.enquiryDetail;
      if (widget.enquiryDetailArgs?.enquiryType == "IVT") {
        model.getIvtDetails(
            enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
            isEdit: widget.routeFrom == "enquiry"
                ? true
                : model.editRegistrationDetails.value);
      } else if (widget.enquiryDetailArgs?.enquiryType == "PSA") {
        model.getPsaDetails(
            enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
            isEdit: widget.routeFrom == "enquiry"
                ? true
                : model.editRegistrationDetails.value);
      } else {
        model.getNewAdmissionDetails(
            enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '',
            isEdit: widget.routeFrom == "enquiry"
                ? true
                : model.editRegistrationDetails.value);
      }
    }
    model.getEnquiryDetail(
        enquiryID: widget.enquiryDetailArgs?.enquiryId ?? '');
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(RegistrationsDetailsViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Registration Details',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, RegistrationsDetailsViewModel model) {
    return SingleChildScrollView(
        child: RegistrationsDetailsPageView(
      provideBase(),
      enquiryDetailArgs: widget.enquiryDetailArgs,
      enquiryDetail: widget.enquiryDetail,
    ));
  }

  @override
  ProviderBase<RegistrationsDetailsViewModel> provideBase() {
    return registrationsDetailsProvider;
  }

  @override
  Widget? buildFloatingButton(RegistrationsDetailsViewModel model) {
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
                        height: 46.h,
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
  Widget? buildBottomNavigationBar(RegistrationsDetailsViewModel model) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppStreamBuilder(
                          stream: model.showWidget,
                          initialData: model.showWidget.value,
                          dataBuilder: (context, data) {
                            return CommonElevatedButton(
                              onPressed: () {
                                if (model.isLoading.value) {
                                  return;
                                }
                                Navigator.pop(context);
                              },
                              text: 'Cancel',
                              borderColor: Theme.of(context).primaryColor,
                              borderWidth: 1,
                              width: 171.w,
                              height: 40.h,
                              textColor: Theme.of(context).primaryColor,
                            );
                          }),
                      CommonElevatedButton(
                        onPressed: () {
                          if (model.isLoading.value) {
                            return;
                          }
                          ProviderScope.containerOf(context)
                              .read(enquiriesAdmissionsJourneyProvider(
                                  widget.enquiryDetailArgs ??
                                      EnquiryDetailArgs()))
                              .getAdmissionJourney(
                                  enquiryID:
                                      widget.enquiryDetailArgs?.enquiryId ?? '',
                                  type: widget.enquiryDetailArgs?.isFrom ??
                                      'enquiry');
                          RegistrationDetailsValidator validator =
                              RegistrationDetailsValidator(model);
                          if (model.showWidget.value == 0) {
                            validator.validateStudentFields(context);
                          } else if (model.showWidget.value == 1) {
                            validator.validateParentInfoFields(context);
                          } else if (model.showWidget.value == 2) {
                            validator.validateContactDetails(context);
                          } else if (model.showWidget.value == 3) {
                            validator.validateMedicalDetails(context);
                          } else if (model.showWidget.value == 4) {
                            validator.validateBankDetails(context);
                          } else if (model.showWidget.value == 5) {
                            if (widget.enquiryDetailArgs?.isFrom == "enquiry") {
                              model.showPopUP(context);
                            } else {
                              if (model.editRegistrationDetails.value) {
                                ProviderScope.containerOf(context)
                                    .read(commonChipListProvider)
                                    .highlightIndex
                                    .add(ProviderScope.containerOf(context)
                                            .read(commonChipListProvider)
                                            .highlightIndex
                                            .value +
                                        1);
                                model.showWidget
                                    .add(model.showWidget.value + 1);
                                model.controller.animateTo(
                                    (model.showWidget.value + 1) * 50,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              }
                            }
                          } else if (model.showWidget.value == 6) {
                            model.selectOptionalSubjects(
                                widget.enquiryDetailArgs?.enquiryId ?? '');
                            ProviderScope.containerOf(context)
                                .read(enquiriesAdmissionsJourneyProvider(
                                    widget.enquiryDetailArgs ??
                                        EnquiryDetailArgs()))
                                .getAdmissionJourney(
                                    enquiryID:
                                        widget.enquiryDetailArgs?.enquiryId ??
                                            '',
                                    type: widget.enquiryDetailArgs?.isFrom ??
                                        'enquiry');
                          } else if (model.showWidget.value == 7) {
                            //  model.addVasOption(widget.enquiryDetailArgs?.enquiryId??'');
                            model.makePaymentRequest(
                                widget.enquiryDetailArgs?.enquiryId ?? "");
                            ProviderScope.containerOf(context)
                                .read(enquiriesAdmissionsJourneyProvider(
                                    widget.enquiryDetailArgs ??
                                        EnquiryDetailArgs()))
                                .getAdmissionJourney(
                                    enquiryID:
                                        widget.enquiryDetailArgs?.enquiryId ??
                                            '',
                                    type: widget.enquiryDetailArgs?.isFrom ??
                                        'enquiry');
                          }
                        },
                        text: 'Next',
                        backgroundColor: AppColors.accent,
                        width: 171.w,
                        height: 40.h,
                        textColor: AppColors.accentOn,
                      ),
                    ],
                  ),
                ))
            : const SizedBox.shrink();
      },
    );
  }
}
