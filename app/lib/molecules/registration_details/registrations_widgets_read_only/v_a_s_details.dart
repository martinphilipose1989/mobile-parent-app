import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VASDetails extends StatelessWidget {
  const VASDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        ProviderScope.containerOf(context).read(registrationsDetailsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Other Value Added Services",
          style: AppTypography.subtitle1.copyWith(color: AppColors.textDark),
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0),
          child: const Divider(color: AppColors.dividerColor),
        ),
        VasQuestions(
          question: "Would You Like To Opt For Transportation?",
          commonRadioButton: model.radioButtonTransport,
          vasOption: "Transport",
          model: model,
        ),
        VasQuestions(
          question: "Would You Like To Opt For Cafeteria?",
          commonRadioButton: model.radioButtonCafeteria,
          vasOption: "Cafeteria",
          model: model,
        ),
        if (model.enquiryDetailArgs?.enquiryType ==
            EnquiryTypeEnum.kidsClub.type) ...{
          VasQuestions(
            question: "Would You Like To Opt For PSA(Post School Activities)?",
            commonRadioButton: model.radioButtonPsa,
            vasOption: "Psa",
            model: model,
          ),
        },
        if (model.enquiryDetailArgs?.enquiryType ==
            EnquiryTypeEnum.psa.type) ...{
          VasQuestions(
            question: "Would You Like To Opt For Kids Club?",
            commonRadioButton: model.radioButtonKidsClub,
            vasOption: "KidsClub",
            model: model,
          )
        }
      ],
    );
  }
}

class VasQuestions extends StatelessWidget {
  const VasQuestions(
      {super.key,
      required this.question,
      required this.commonRadioButton,
      required this.vasOption,
      required this.model});

  final String question;
  final CommonRadioButton<String> commonRadioButton;
  final String vasOption;
  final RegistrationsDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
            text: question,
            style: AppTypography.subtitle2.copyWith(color: AppColors.textDark)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CommonRadioButtonWidget(
                commonRadioButton: commonRadioButton,
                isTogglableWithValue: true,
                value: "Yes",
                title: "Yes",
                onOptionSelected: (value) {
                  var data;
                  if (vasOption == "Cafeteria") {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.cafeteriaDetailPage,
                      arguments: VasDetailsArg(
                        enquiryDetailArgs: model.enquiryDetailArgs,
                      ),
                    ).then((value) {
                      data = value;
                      if (data == null) {
                        commonRadioButton.selectItem("");
                      }
                    });
                  } else if (vasOption == 'Psa') {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.psaDetailPage,
                      arguments: VasDetailsArg(
                        enquiryDetailArgs: model.enquiryDetailArgs,
                      ),
                    ).then((value) {
                      data = value;
                      if (data == null) {
                        commonRadioButton.selectItem("");
                      }
                    });
                  } else if (vasOption == 'KidsClub') {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.kidsClubPage,
                      arguments: VasDetailsArg(
                        enquiryDetailArgs: model.enquiryDetailArgs,
                      ),
                    ).then((value) {
                      data = value;
                      if (data == null) {
                        commonRadioButton.selectItem("");
                      }
                    });
                  } else if (vasOption == "Transport") {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.transportPage,
                      arguments: VasDetailsArg(
                        enquiryDetailArgs: model.enquiryDetailArgs,
                      ),
                    ).then((value) {
                      data = value;
                      if (data == null) {
                        commonRadioButton.selectItem("");
                      }
                    });
                  } else {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.summerCampPage,
                      arguments: VasDetailsArg(
                        enquiryDetailArgs: model.enquiryDetailArgs,
                      ),
                    ).then((value) {
                      data = value;
                      if (data == null) {
                        commonRadioButton.selectItem("");
                      }
                    });
                  }
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: CommonRadioButtonWidget(
                commonRadioButton: commonRadioButton,
                value: "No",
                title: "No",
                onOptionSelected: (selectedValue) {
                  if (vasOption == "Cafeteria") {
                    model.removeVasDetail(
                        model.enquiryDetailArgs?.enquiryId ?? '', vasOption);
                  } else if (vasOption == 'Psa') {
                    model.removeVasDetail(
                        model.enquiryDetailArgs?.enquiryId ?? '', vasOption);
                  } else if (vasOption == 'KidsClub') {
                    model.removeVasDetail(
                        model.enquiryDetailArgs?.enquiryId ?? '', vasOption);
                  } else if (vasOption == "Transport") {
                    model.removeVasDetail(
                        model.enquiryDetailArgs?.enquiryId ?? '', vasOption);
                  } else {
                    model.removeVasDetail(
                        model.enquiryDetailArgs?.enquiryId ?? '', vasOption);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h)
      ],
    );
  }
}

class VasDetailsArg {
  EnquiryDetailArgs? enquiryDetailArgs;

  VasDetailsArg({this.enquiryDetailArgs});
}
