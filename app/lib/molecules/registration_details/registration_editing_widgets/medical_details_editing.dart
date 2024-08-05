import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';

class MedicalDetailsEditing extends StatelessWidget {
  const MedicalDetailsEditing({super.key, required this.model});
  final RegistrationsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonText(
          text: "Medical Information",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const CommonText(
          text: "Has the child ever been hospitalized?",
          style: AppTypography.subtitle1,
        ),
        CommonRadioButtonWidget(
          title: 'Yes',
          commonRadioButton: model.radioButtonController4,
          value: 'Yes',
        ),
        CommonRadioButtonWidget(
          title: 'No',
          commonRadioButton: model.radioButtonController4,
          value: 'No',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: false,
          labelText: 'Year Of Hospitalization',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: false,
          labelText: 'Reason Of Hospitalization',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonText(
          text: "Physical Disabilities",
          style: AppTypography.subtitle1,
        ),
        CommonRadioButtonWidget(
          title: 'Yes',
          commonRadioButton: model.radioButtonController5,
          value: 'Yes',
        ),
        CommonRadioButtonWidget(
          title: 'No',
          commonRadioButton: model.radioButtonController5,
          value: 'No',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: false,
          labelText: 'Specify Disability',
        ),
      ],
    );
  }
}
