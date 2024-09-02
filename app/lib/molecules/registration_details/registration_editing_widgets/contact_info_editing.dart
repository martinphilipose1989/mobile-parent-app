import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfoEditing extends StatelessWidget {
  const ContactInfoEditing({super.key, required this.model});

  final RegistrationsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.contactInfoFormKey,
        child:Column(children: [
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
              text: "Emergency Contact",
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
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: model.contactRelationshipOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Contact Number',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      onSingleSelect: (val){
                        val!=model.emergencyContact;
                      },
                      showBorderColor: true,
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
        child:  ExpansionTile(
            title: const CommonText(
              text: "Point Of Contact",
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
                    CustomDropdownButton(
                      items: model.contactRelationshipOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Parent Type',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      onSingleSelect: (val){
                        val!=model.contactParentType;
                      },
                      showBorderColor: true,
                    ),
                    CommonTextFormField(
                        showAstreik: true,
                        labelText: 'Parent Mobile Number',
                        controller:model.parentMobileNumberController
                    ),
                    CommonTextFormField(
                        showAstreik: true,
                        labelText: 'Parent Email Id',
                        controller:model.parentEmailIdController
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
              text: "Residential Details",
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
                      labelText: 'House No./ Building',
                      controller: model.houseOrBuildingController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Street Name',
                      controller:model.streetNameController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Landmark',
                      controller:model.landMarkController
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    StreamBuilder<List<String>>(
                      stream: model.country,
                      builder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.country.value,
                          width: MediaQuery.of(context).size.width,
                          isMutiSelect: false,
                          dropdownName: 'Country',
                          showAstreik: true,
                          onSingleSelect: (val){
                            val!=model.residentialCountry;
                          },
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                        
                        );
                      }
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    StreamBuilder<List<String>>(
                      stream: model.state,
                      builder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.state.value,
                          width: MediaQuery.of(context).size.width,
                          isMutiSelect: false,
                          dropdownName: 'State',
                          showAstreik: true,
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                          onSingleSelect: (val){
                            val!=model.residentialState;
                          },
                        );
                      }
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    StreamBuilder<List<String>>(
                      stream: model.city,
                      builder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.city.value,
                          width: MediaQuery.of(context).size.width,
                          isMutiSelect: false,
                          dropdownName: 'City',
                          showAstreik: true,
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                          onSingleSelect: (val){
                            val!=model.residentialCity;
                          },
                        );
                      }
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: model.pinCodeOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Pin Code',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                      onSingleSelect: (val){
                        val!=model.residentialPinCode;
                        },
                    ),
                    const CommonText(
                      text: "Is Permanent Address Same As Present?",
                      style: AppTypography.subtitle2,
                    ),
                    CommonRadioButtonWidget(
                      title: 'Yes',
                      commonRadioButton: model.radioButtonController3,
                      value: 'Yes',
                    ),
                    CommonRadioButtonWidget(
                      title: 'No',
                      commonRadioButton: model.radioButtonController3,
                      value: 'No',
                    ),
                  ],
                ),
              )
            ]),
      ),
    ]));
  }
}
