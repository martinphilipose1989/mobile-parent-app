import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
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
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Year Of Hospitalization',
           controller: model.yearOfHospitalizationController,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Reason Of Hospitalization',
           controller:model.reasonOfHospitalizationController,
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
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Specify Disability',
           controller: model.specificDisabilityController,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonText(
          text: "Medical History",
          style: AppTypography.subtitle1,
        ),
        CommonRadioButtonWidget(
          title: 'Yes',
          commonRadioButton: model.radioButtonController7,
          value: 'Yes',
        ),
        CommonRadioButtonWidget(
          title: 'No',
          commonRadioButton: model.radioButtonController7,
          value: 'No',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Specify Medical History',
           controller: model.specifyMedicalHistoryController,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonText(
          text: "Allergies",
          style: AppTypography.subtitle1,
        ),
        CommonRadioButtonWidget(
          title: 'Yes',
          commonRadioButton: model.radioButtonController8,
          value: 'Yes',
        ),
        CommonRadioButtonWidget(
          title: 'No',
          commonRadioButton: model.radioButtonController8,
          value: 'No',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Specify Allergies',
           controller: model.specifyAllergiesController,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
            items: model.grade,
            width: MediaQuery.of(context).size.width,
            isMutiSelect: false,
            dropdownName: 'Blood Group',
            showAstreik: true,
            onMultiSelect: (selectedValues) {},
            showBorderColor: true,
            onSingleSelect: (val){
            val=model.bloodGroup!;
          },
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonText(
          text: "Personalised Learning Needs",
          style: AppTypography.subtitle1,
        ),
        CommonRadioButtonWidget(
          title: 'Yes',
          commonRadioButton: model.radioButtonController9,
          value: 'Yes',
        ),
        CommonRadioButtonWidget(
          title: 'No',
          commonRadioButton: model.radioButtonController9,
          value: 'No',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
         CommonTextFormField(
          showAstreik: false,
          labelText: 'Personalised Learning Needs',
           controller: model.personalisedLearningNeedsController,
        ),
      ],
    );
  }
}
