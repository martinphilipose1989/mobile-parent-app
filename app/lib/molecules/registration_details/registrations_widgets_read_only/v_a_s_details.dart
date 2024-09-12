import 'package:app/di/states/viewmodels.dart';
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
            commonRadioButton: model.vasOne),
        VasQuestions(
            question: "Would You Like To Opt For Cafeteria?",
            commonRadioButton: model.vasTwo),
        VasQuestions(
            question: "Would You Like To Opt For PSA(Post School Activities)?",
            commonRadioButton: model.vasThree),
        VasQuestions(
            question: "Would You Like To Opt For Hostel?",
            commonRadioButton: model.vasFour),
        VasQuestions(
            question: "Would You Like To Opt For Kids Club?",
            commonRadioButton: model.vasFive)
      ],
    );
  }
}

class VasQuestions<T> extends StatelessWidget {
  const VasQuestions(
      {super.key, required this.question, required this.commonRadioButton});

  final String question;
  final CommonRadioButton<T> commonRadioButton;

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
                  title: "Yes"),
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
