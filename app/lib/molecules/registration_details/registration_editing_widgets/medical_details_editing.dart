import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MedicalDetailsEditing extends StatelessWidget {
  const MedicalDetailsEditing({super.key, required this.model});
  final RegistrationsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.medicalDetailsFormKey,
      child: Column(
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
          AppStreamBuilder<String?>(
            stream: model.radioButtonController4.selectedItemStream,
            initialData: model.radioButtonController4.selectedItem,
            dataBuilder: (context, data) {
              return Column(
                children: [
                  if((data??'') == "Yes")...[
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Year Of Hospitalization',
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: model.yearOfHospitalizationController,
                      validator: (value)=> AppValidators.validateNotEmpty(value, 'Year Of Hospitalization'),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                     CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Reason Of Hospitalization',
                      controller:model.reasonOfHospitalizationController,
                      validator: (value)=> AppValidators.validateNotEmpty(value, 'Reason Of Hospitalization'),
                    ),
                  ],
                ],
              );
            },
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
          AppStreamBuilder<String?>(
            stream: model.radioButtonController5.selectedItemStream,
            initialData: model.radioButtonController5.selectedItem,
            dataBuilder: (context, data) {
              return Column(
                children: [
                  if((data??'')== "Yes")...[
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Specify Disability',
                       controller: model.specificDisabilityController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Specify Disability'),
                    ),
                  ]
                ],
              );
            },
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
          AppStreamBuilder<String?>(
            stream: model.radioButtonController7.selectedItemStream,
            initialData: model.radioButtonController7.selectedItem,
            dataBuilder: (context, data) {
              return Column(
                children: [
                  if((data??'') == "Yes")...[
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Specify Medical History',
                       controller: model.specifyMedicalHistoryController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Specify Medical History'),
                    ),
                  ]
                ],
              );
            },
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
          AppStreamBuilder<String?>(
            stream: model.radioButtonController8.selectedItemStream,
            initialData: model.radioButtonController8.selectedItem,
            dataBuilder: (context, data) {
              return Column(
                children: [
                  if((data??'')=="Yes")...[
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Specify Allergies',
                       controller: model.specifyAllergiesController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Specify Allergies'),
                    ),
                  ]
                ],
              );
            },
          ),
          CommonSizedBox.sizedBox(height: 15, width: 10),
          StreamBuilder<List<String>>(
            stream: model.bloodGroup,
            builder: (context, snapshot) {
              return CustomDropdownButton(
                  items: model.bloodGroup.value,
                  width: MediaQuery.of(context).size.width,
                  isMutiSelect: false,
                  dropdownName: 'Blood Group',
                  showAstreik: true,
                  onMultiSelect: (selectedValues) {},
                  showBorderColor: true,
                  onSingleSelect: (val){
                    var bloodGroup = model.bloodGroupAttribute?.firstWhere((element)=> (element.attributes?.group??'').contains(val));
                    model.selectedBloodGroup = val;
                    CommonDataClass group = CommonDataClass();
                    group.id = bloodGroup?.id;
                    group.value = bloodGroup?.attributes?.group;
                    model.selectedBloodGroupEntity = group;
                    model.selectedBloodGroup;
                  },
                  validator: (value)=> AppValidators.validateDropdown(value, 'Blood group'),
              );
            }
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
          AppStreamBuilder<String?>(
            stream: model.radioButtonController9.selectedItemStream,
            initialData: model.radioButtonController9.selectedItem,
            dataBuilder: (context, data) {
              return Column(
                children: [
                  if((data??'')== "Yes")...[
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Personalised Learning Needs',
                       controller: model.personalisedLearningNeedsController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Personalised Learning Needs'),
                    ),
                  ]
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
