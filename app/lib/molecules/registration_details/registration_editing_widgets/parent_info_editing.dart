import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentInfoEditing extends StatelessWidget {
  const ParentInfoEditing({super.key, required this.model});

  final RegistrationsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: "Father's Details",
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's First Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Last Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Adhar Card No",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Pan Card No",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Occupation',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Area',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Country',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'State',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'City',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Email ID",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Mobile Number",
                    ),
                  ],
                ),
              )
            ]),
      ),
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: "Mother's Details",
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's First Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Last Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Adhar Card No",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Pan Card No",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Occupation',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Area',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Country',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'State',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'City',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Email ID",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Mobile Number",
                    ),
                  ],
                ),
              )
            ]),
      ),
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: "Gurdian's Details",
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Gurdian's First Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Gurdian's Last Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Gurdian's Adhar Card No.",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Gurdian's Pan Card No.",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Occupation',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Namer",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Area',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Country',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'State',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'City',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Area',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Country',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'State',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'City',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Email ID",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Mobile Number",
                    ),
                    CommonRadioButtonWidget(
                      title: 'Custodian Guardian',
                      commonRadioButton: model.radioButtonController,
                      value: 'Custodian Guardian',
                    ),
                    CommonRadioButtonWidget(
                      title: 'Legal Guardian',
                      commonRadioButton: model.radioButtonController,
                      value: 'Legal Guardian',
                    ),
                    CommonRadioButtonWidget(
                      title: 'Not Applicable',
                      commonRadioButton: model.radioButtonController,
                      value: 'Not Applicable',
                    ),
                  ],
                ),
              )
            ]),
      ),
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: "Sibling's Details",
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    const CommonText(
                      text: 'For Sibling 1',
                      style: AppTypography.subtitle2,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    const CommonText(
                      text: 'Is Sibling',
                      style: AppTypography.subtitle2,
                    ),
                    CommonRadioButtonWidget(
                      title: 'Vibgyor Student',
                      commonRadioButton: model.radioButtonController1,
                      value: 'Vibgyor Student',
                    ),
                    CommonRadioButtonWidget(
                      title: 'Non-Vibgyor Student',
                      commonRadioButton: model.radioButtonController1,
                      value: 'Non-Vibgyor Studente',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling's Enrollment Number",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling First Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling Last Name",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonDatePickerWidget(),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Gender',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: "School",
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Grade',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                  ],
                ),
              )
            ]),
      ),
      const CommonText(
        text: 'For Sibling 1',
        style: AppTypography.subtitle2,
      ),
      CommonRadioButtonWidget(
        title: 'Yes',
        commonRadioButton: model.radioButtonController2,
        value: 'Yes',
      ),
      CommonRadioButtonWidget(
        title: 'No',
        commonRadioButton: model.radioButtonController2,
        value: 'No',
      ),
    ]);
  }
}
