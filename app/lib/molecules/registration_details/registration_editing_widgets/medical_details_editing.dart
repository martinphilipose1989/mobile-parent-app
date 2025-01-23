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
import 'package:localisation/strings.dart';

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
         CommonText(
            text: Strings.of(context).medical_history,//Strings.of(context)
            style: AppTypography.subtitle1,
          ),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.textPaleGray,
          ),
          CommonSizedBox.sizedBox(height: 10, width: 10),
      CommonText(
            text: Strings.of(context).has_hospitalised,
            style: AppTypography.subtitle1,
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).yes,
            commonRadioButton: model.radioButtonController4,
            value: 'Yes',
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).no,
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
                      labelText: Strings.of(context).year_Of_Hospitalization,
                      maxLength: 4,
                      readOnly: true,
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(Strings.of(context).select_Year),
                              content: SizedBox(
                                // Need to use container to add size constraint.
                                width: 300,
                                height: 300,
                                child: YearPicker(
                                  firstDate: DateTime(DateTime.now().year - 20, 1),
                                  lastDate: DateTime(DateTime.now().year),
                                  selectedDate: model.yearOfHospitalizationController.text.trim().isNotEmpty ? 
                                    DateTime(int.parse(model
                                          .yearOfHospitalizationController
                                          .text)) : DateTime.now(),
                                  onChanged: (DateTime dateTime) {
                                    if(dateTime != null){
                                      model.yearOfHospitalizationController.text = dateTime.year.toString();
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      controller: model.yearOfHospitalizationController,
                      validator: (value)=> AppValidators.validateNotEmpty(value, 'Year Of Hospitalization'),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                     CommonTextFormField(
                      showAstreik: false,
                      labelText: Strings.of(context).reason_Of_Hospitalization,
                      controller:model.reasonOfHospitalizationController,
                      validator: (value)=> AppValidators.validateNotEmpty(value, 'Reason Of Hospitalization'),
                    ),
                  ],
                ],
              );
            },
          ),
          CommonSizedBox.sizedBox(height: 15, width: 10),
     CommonText(
            text: Strings.of(context).physical_disabilities,
            style: AppTypography.subtitle1,
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).yes,
            commonRadioButton: model.radioButtonController5,
            value: 'Yes',
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).no,
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
                      labelText: Strings.of(context).specify__disability,
                       controller: model.specificDisabilityController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Specify Disability'),
                    ),
                  ]
                ],
              );
            },
          ),
          
          CommonSizedBox.sizedBox(height: 15, width: 10),
   CommonText(
            text: Strings.of(context).medical_history,
            style: AppTypography.subtitle1,
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).yes,
            commonRadioButton: model.radioButtonController7,
            value: 'Yes',
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).no,
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
                      labelText: Strings.of(context).specify_Medical_History,
                       controller: model.specifyMedicalHistoryController,
                       validator: (value)=> AppValidators.validateNotEmpty(value, 'Specify Medical History'),
                    ),
                  ]
                ],
              );
            },
          ),
          CommonSizedBox.sizedBox(height: 15, width: 10),
CommonText(
            text: Strings.of(context).allergies,
            style: AppTypography.subtitle1,
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).yes,
            commonRadioButton: model.radioButtonController8,
            value: 'Yes',
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).no,
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
                      labelText: Strings.of(context).specify_allergies,
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
                  singleSelectItemSubject: model.selectedBloodGroup,
                  onSingleSelect: (val){
                    var bloodGroup = model.bloodGroupAttribute?.firstWhere((element)=> (element.attributes?.group??'').contains(val));
                    model.selectedBloodGroup.value = val;
                    CommonDataClass group = CommonDataClass();
                    group.id = bloodGroup?.id;
                    group.value = bloodGroup?.attributes?.group;
                    model.selectedBloodGroupEntity = group;
                  },
                  validator: (value)=> AppValidators.validateDropdown(value, 'Blood group'),
              );
            }
          ),
          CommonSizedBox.sizedBox(height: 15, width: 10),
      CommonText(
            text: Strings.of(context).personalised_Learning_Needs,
            style: AppTypography.subtitle1,
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).yes,
            commonRadioButton: model.radioButtonController9,
            value: 'Yes',
          ),
          CommonRadioButtonWidget(
            title: Strings.of(context).no,
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
                    StreamBuilder<List<String>>(
                      stream: model.personalisedLearningNeeds,
                      builder: (context, snapshot) {
                        return CustomDropdownButton(
                            items: model.personalisedLearningNeeds.value,
                            width: MediaQuery.of(context).size.width,
                            isMutiSelect: false,
                            dropdownName: 'Personalised Learning',
                            showAstreik: true,
                            onMultiSelect: (selectedValues) {},
                            showBorderColor: true,
                            singleSelectItemSubject: model.selectedPersonalisedLearningNeedSubject,
                            onSingleSelect: (val){
                              var bloodGroup = model.personalisedLearningNeedsAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                              model.selectedPersonalisedLearningNeedSubject.value = val;
                              CommonDataClass group = CommonDataClass();
                              group.id = bloodGroup?.id;
                              group.value = bloodGroup?.attributes?.name;
                              model.selectedPersonalisedLearningNeed = group;
                            },
                        );
                      }
                    ),
                  ],
                  const SizedBox(height: 50,)
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
