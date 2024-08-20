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
import 'package:network_retrofit/network_retrofit.dart';

class ParentInfoEditing extends StatelessWidget {
  const ParentInfoEditing({super.key, required this.model, });

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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's First Name",
                      controller: model.fatherFirstNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Last Name",
                      controller: model.fatherLastNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Adhar Card No",
                      controller: model.fatherAdharCardController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Pan Card No",
                      controller:model.fatherPanCardController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                      controller: model.qualificationController,
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
                      onSingleSelect: (val){

                      },
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Name",
                      controller: model.organizationNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                      controller: model.designationController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                      controller:model.officeAddressController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                      controller: model.pinCodeController,
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Email ID",
                      controller: model.fatherEmailController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Father's Mobile Number",
                      controller:model.fatherMobileController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's First Name",
                      controller: model.motherFirstNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Last Name",
                      controller: model.motherLastNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Adhar Card No",
                      controller: model.motherAdharCardController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Pan Card No",
                      controller:model.motherPanCardController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                      controller: model.motherQualificationController,
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Name",
                      controller:model.motherQualificationController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                      controller:model.motherDesignationController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                      controller:model.motherOfficeAddressController
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
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                       controller: model.motherPinCodeController,
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
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Email ID",
                       controller: model.motherEmailController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Mother's Mobile Number",
                      controller: model.motherMobileController,
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
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's First Name",
                       controller: model.guardianFirstNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Last Name",
                      controller: model.guardianLastNameController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Adhar Card No.",
                      controller:model.guardianAdharCardController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Pan Card No.",
                      controller:model.guardianPanCardController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Qualification",
                        controller:model.guardianQualificationController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Organization Namer",
                      controller:model.guardianOrganizationNameController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Designation",
                      controller:model.guardianDesignationController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Office Address",
                      controller:model.guardianOfficeAddressController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                      controller: model.guardianPinCodeController,
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
                     CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                       controller: model.guardianPinCodeController,
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Email ID",
                      controller: model.guardianEmailController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Guardian's Mobile Number",
                      controller:model.guardianMobileController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling's Enrollment Number",
                      controller: model.siblingsEnrollmentController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling First Name",
                      controller:model.siblingFirstNameController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Sibling Last Name",
                      controller:model.siblingLastNameController
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
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "School",
                      controller: model.siblingsSchoolController,
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
