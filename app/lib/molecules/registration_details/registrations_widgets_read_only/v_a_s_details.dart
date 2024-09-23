import 'package:app/di/states/viewmodels.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
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
        ),
        VasQuestions(
            question: "Would You Like To Opt For Cafeteria?",
            commonRadioButton: model.radioButtonCafeteria,
            vasOption: "Cafeteria",
        ),
        VasQuestions(
            question: "Would You Like To Opt For PSA(Post School Activities)?",
            commonRadioButton: model.radioButtonPsa,
            vasOption: "PSA",
        ),
        VasQuestions(
            question: "Would You Like To Opt For Summer Camp?",
            commonRadioButton: model.radioButtonHostel,
            vasOption: "Summer Camp",
        ),
        VasQuestions(
            question: "Would You Like To Opt For Kids Club?",
            commonRadioButton: model.radioButtonKidsClub,
            vasOption: "Kids Club",
        )
      ],
    );
  }
}

class VasQuestions extends StatelessWidget {
  const VasQuestions(
      {super.key, required this.question, required this.commonRadioButton,required this.vasOption});

  final String question;
  final CommonRadioButton<String> commonRadioButton;
  final String vasOption;

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
                  value: "Yes",
                  title: "Yes",
                  onOptionSelected: (value){
                    if(vasOption == "Cafeteria"){
                      Navigator.pushNamed(context, RoutePaths.cafeteriaDetailPage);
                    }
                    if(vasOption == 'PSA'){
                      Navigator.pushNamed(context, RoutePaths.psaDetailPage);
                    }
                    if(vasOption == 'Kids Club'){
                      Navigator.pushNamed(context, RoutePaths.kidsClubPage);
                    }
                    if(vasOption == "Transport"){
                      Navigator.pushNamed(context, RoutePaths.transportPage);
                    }
                    else{
                      Navigator.pushNamed(context, RoutePaths.summerCampPage);
                    }
                  },
              ),
            ),
            Flexible(
              flex: 2,
              child: CommonRadioButtonWidget(
                  commonRadioButton: commonRadioButton,
                  value: "No",
                  title: "No"),
            ),
          ],
        ),
        SizedBox(height: 16.h)
      ],
    );
  }
}
