import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_validators.dart';

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
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Contact Person",),
                      isMutiSelect: false,
                      dropdownName: 'Contact Person',
                      showAstreik: false,
                      onMultiSelect: (selectedValues) {},
                      singleSelectItemSubject: model.emergencyContact,
                      onSingleSelect: (val){
                        model.emergencyContact.value = val;
                        model.contactParentTypeEmail1.value = val;
                        model.contactParentTypePhone1.value = val;
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
                    const CommonText(text:'Preference 1'),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: model.contactRelationshipOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Parent Type',
                      isDisable: true,
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent Type",),
                      showAstreik: false,
                      onMultiSelect: (selectedValues) {},
                      singleSelectItemSubject: model.contactParentTypePhone1,
                      onSingleSelect: (val){
                        model.contactParentTypePhone1.value = val;
                      },
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Mobile Number',
                        controller:model.parentMobileNumberController1,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent Mobile Number",checkSpecialCharacters: true,minLength: 10),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                      CustomDropdownButton(
                        items: model.contactRelationshipOptions,
                        width: MediaQuery.of(context).size.width,
                        isMutiSelect: false,
                        dropdownName: 'Parent Type',
                        isDisable: true,
                        validator: (value) => AppValidators.validateNotEmpty(
                          value,
                          "Parent Type",
                        ),
                        showAstreik: false,
                        onMultiSelect: (selectedValues) {},
                        singleSelectItemSubject: model.contactParentTypeEmail1,
                        onSingleSelect: (val) {
                          model.contactParentTypeEmail1.value = val;
                        },
                        showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Email Id',
                        controller:model.parentEmailIdController1,

                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent Email Id",checkSpecialCharacters: false,),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonText(text:'Preference 2'),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: model.contactRelationshipOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Parent Type',
                      validator: (value)=> AppValidators.validateNotEmpty(value, "ParentType",),
                      showAstreik: false,
                      onMultiSelect: (selectedValues) {},
                      singleSelectItemSubject: model.contactParentTypePhone2,
                      onSingleSelect: (val){
                        model.contactParentTypePhone2.value = val;
                      },
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Mobile Number',
                        controller:model.parentMobileNumberController2,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent Mobile Number",checkSpecialCharacters: true,minLength: 10),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                      CustomDropdownButton(
                        items: model.contactRelationshipOptions,
                        width: MediaQuery.of(context).size.width,
                        isMutiSelect: false,
                        dropdownName: 'Parent Type',
                        validator: (value) => AppValidators.validateNotEmpty(
                          value,
                          "Parent Type",
                        ),
                        showAstreik: false,
                        onMultiSelect: (selectedValues) {},
                        singleSelectItemSubject: model.contactParentTypeEmail2,
                        onSingleSelect: (val) {
                          model.contactParentTypeEmail2.value = val;
                        },
                        showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Email Id',
                        controller:model.parentEmailIdController2,
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent EmailId",checkSpecialCharacters: false,),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonText(text:'Preference 3'),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: model.contactRelationshipOptions,
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Parent Type',
                      validator: (value)=> AppValidators.validateNotEmpty(value, "ParentType",),
                      showAstreik: false,
                      onMultiSelect: (selectedValues) {},
                      singleSelectItemSubject: model.contactParentTypePhone3,
                      onSingleSelect: (val){
                        model.contactParentTypePhone2.value = val;
                      },
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Mobile Number',
                        controller:model.parentMobileNumberController3,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent Mobile Number",checkSpecialCharacters: true,minLength: 10),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                      CustomDropdownButton(
                        items: model.contactRelationshipOptions,
                        width: MediaQuery.of(context).size.width,
                        isMutiSelect: false,
                        dropdownName: 'Parent Type',
                        validator: (value) => AppValidators.validateNotEmpty(
                          value,
                          "Parent Type",
                        ),
                        showAstreik: false,
                        onMultiSelect: (selectedValues) {},
                        singleSelectItemSubject: model.contactParentTypeEmail3,
                        onSingleSelect: (val) {
                          model.contactParentTypeEmail2.value = val;
                        },
                        showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Parent Email Id',
                        controller:model.parentEmailIdController3,
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Parent EmailId",checkSpecialCharacters: false,),
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
                      validator: (value)=> AppValidators.validateNotEmpty(value, "House No/ Building",checkSpecialCharacters: true,),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Street Name',
                      controller:model.streetNameController,
                      validator: (value)=> AppValidators.validateNotEmpty(value, "Street Name",checkSpecialCharacters: true,),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Landmark',
                      controller:model.landMarkController,
                        validator: (value)=> AppValidators.validateNotEmpty(value, "Landmark",checkSpecialCharacters: true,),
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    StreamBuilder<List<String>>(
                      stream: model.country,
                      builder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.country.value,
                          width: MediaQuery.of(context).size.width,
                          validator: (value)=> AppValidators.validateNotEmpty(value, "Country",),
                          isMutiSelect: false,
                          dropdownName: 'Country',
                          showAstreik: true,
                          singleSelectItemSubject: model.selectedResidentialCountry,
                          onSingleSelect: (val){
                            var country = model.countryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                            model.residentialCountry = CommonDataClass(
                              id: country?.id,
                              value: country?.attributes?.name
                            );
                          },
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                        
                        );
                      }
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Pin Code",
                      controller: model.residentialPinCodeController,
                      focusNode: model.residentialPinCodeFocusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onFieldSubmitted: (value) {
                        if(value.length == 6){
                          model.getCityAndStateByPincode(pincode: model.residentialPinCodeController.text.trim(), infoType: "currentAddress");
                        }
                      },
                      maxLength: 6,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    AppStreamBuilder<List<String>>(
                      stream: model.state,
                      initialData: model.state.value,
                      dataBuilder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.state.value,
                          width: MediaQuery.of(context).size.width,
                          isMutiSelect: false,
                          dropdownName: 'State',
                          validator: (value)=> AppValidators.validateNotEmpty(value, "State",),
                          isDisable: true,
                          showAstreik: true,
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                          singleSelectItemSubject: model.selectedResidentialState,
                          onSingleSelect: (val){
                            var state = model.stateAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                            model.residentialState = CommonDataClass(
                              id : state?.id,
                              value : state?.attributes?.name
                            );
                          },
                        );
                      }
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    AppStreamBuilder<List<String>>(
                      stream: model.city,
                      initialData: model.city.value,
                      dataBuilder: (context, snapshot) {
                        return CustomDropdownButton(
                          items: model.city.value,
                          width: MediaQuery.of(context).size.width,
                          isMutiSelect: false,
                          dropdownName: 'City',
                          validator: (value)=> AppValidators.validateNotEmpty(value, "City",),
                          isDisable: true,
                          showAstreik: true,
                          onMultiSelect: (selectedValues) {},
                          showBorderColor: true,
                          singleSelectItemSubject: model.selectedResidentialCity,
                          onSingleSelect: (val){
                            var city = model.cityAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                            model.residentialCity = CommonDataClass(
                              id: city?.id,
                              value: city?.attributes?.name
                            );
                          },
                        );
                      }
                    ),
                    const CommonText(
                      text: "Is Permanent Address Same As Present?",
                      style: AppTypography.subtitle2,
                    ),
                    CommonRadioButtonWidget(
                      title: 'Yes',
                      commonRadioButton: model.radioButtonController3,
                      value: 'Yes',
                      onOptionSelected: (newValue){
                        // model.permanentHouseOrBuildingController.text = model.houseOrBuildingController.text;
                        // model.permanentStreetNameController.text = model.streetNameController.text;
                        // model.permanentLandMarkController.text = model.landMarkController.text;
                        // model.permanentResidentialPinCodeController.text = model.residentialPinCodeController.text;
                        // model.selectedPermanentResidentialCountry.value = model.selectedResidentialCountry.value;
                        // model.selectedPermanentResidentialState.value = model.selectedResidentialState.value;
                        // model.selectedPermanentResidentialCity.value = model.selectedResidentialCity.value;
                        // model.permanentResidentialCountry = model.residentialCountry;
                        // model.permanentResidentialState = model.residentialState;
                        // model.permanentResidentialCity = model.residentialCity;
                      },
                    ),
                    CommonRadioButtonWidget(
                      title: 'No',
                      commonRadioButton: model.radioButtonController3,
                      value: 'No',
                      onOptionSelected: (newValue){
                        model.permanentHouseOrBuildingController.clear();
                        model.permanentStreetNameController.clear();
                        model.permanentLandMarkController.clear();
                        model.permanentResidentialPinCodeController.clear();
                        model.selectedPermanentResidentialCountry.value = '';
                        model.selectedPermanentResidentialState.value = '';
                        model.selectedPermanentResidentialCity.value = '';
                        model.permanentResidentialCountry = null;
                        model.permanentResidentialState = null;
                        model.permanentResidentialCity = null;
                      },
                    ),
                    AppStreamBuilder<String?>(
                      stream: model.radioButtonController3.selectedItemStream,
                      initialData: model.radioButtonController3.selectedItem,
                      dataBuilder: (context, data) {
                        return Visibility(
                          visible: (model.radioButtonController3.selectedItem??'') == "No",
                          child: Column(
                            children: [
                              CommonSizedBox.sizedBox(height: 20, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                readOnly: model.radioButtonController3.selectedItem == "Yes",
                                labelText: 'House No./ Building',
                                controller: model.permanentHouseOrBuildingController,
                                validator: (value)=> AppValidators.validateNotEmpty(value, "House No/ Building",checkSpecialCharacters: true,),
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                readOnly: model.radioButtonController3.selectedItem == "Yes",
                                labelText: 'Street Name',
                                controller:model.permanentStreetNameController,
                                validator: (value)=> AppValidators.validateNotEmpty(value, "Street Name",checkSpecialCharacters: true,),
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Landmark',
                                readOnly: model.radioButtonController3.selectedItem == "Yes",
                                controller:model.permanentLandMarkController,
                                  validator: (value)=> AppValidators.validateNotEmpty(value, "Landmark",checkSpecialCharacters: true,),
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              StreamBuilder<List<String>>(
                                stream: model.country,
                                builder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.country.value,
                                    isDisable: model.radioButtonController3.selectedItem == "Yes",
                                    width: MediaQuery.of(context).size.width,
                                    validator: (value)=> AppValidators.validateNotEmpty(value, "Country",),
                                    isMutiSelect: false,
                                    dropdownName: 'Country',
                                    showAstreik: true,
                                    singleSelectItemSubject: model.selectedPermanentResidentialCountry,
                                    onSingleSelect: (val){
                                      var country = model.countryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                                      model.permanentResidentialCountry = CommonDataClass(
                                        id: country?.id,
                                        value: country?.attributes?.name
                                      );
                                    },
                                    onMultiSelect: (selectedValues) {},
                                    showBorderColor: true,
                                  
                                  );
                                }
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                readOnly: model.radioButtonController3.selectedItem == "Yes",
                                labelText: "Pin Code",
                                controller: model.permanentResidentialPinCodeController,
                                focusNode: model.permanentPinCodeFocusNode,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onFieldSubmitted: (value) {
                                  if(value.length == 6){
                                    model.getCityAndStateByPincode(pincode: model.permanentResidentialPinCodeController.text.trim(), infoType: "permanentAddress");
                                  }
                                },
                                maxLength: 6,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              AppStreamBuilder<List<String>>(
                                stream: model.state,
                                initialData: model.state.value,
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.state.value,
                                    width: MediaQuery.of(context).size.width,
                                    isMutiSelect: false,
                                    isDisable: true,
                                    dropdownName: 'State',
                                    validator: (value)=> AppValidators.validateNotEmpty(value, "State",),
                                    showAstreik: true,
                                    onMultiSelect: (selectedValues) {},
                                    showBorderColor: true,
                                    singleSelectItemSubject: model.selectedPermanentResidentialState,
                                    onSingleSelect: (val){
                                      var state = model.stateAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                                      model.permanentResidentialState = CommonDataClass(
                                        id : state?.id,
                                        value : state?.attributes?.name
                                      );
                                    },
                                  );
                                }
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              AppStreamBuilder<List<String>>(
                                stream: model.city,
                                initialData: model.city.value,
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.city.value,
                                    width: MediaQuery.of(context).size.width,
                                    isMutiSelect: false,
                                    isDisable: true,
                                    dropdownName: 'City',
                                    validator: (value)=> AppValidators.validateNotEmpty(value, "City",),
                                    showAstreik: true,
                                    onMultiSelect: (selectedValues) {},
                                    showBorderColor: true,
                                    singleSelectItemSubject: model.selectedPermanentResidentialCity,
                                    onSingleSelect: (val){
                                      var city = model.cityAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(val));
                                      model.permanentResidentialCity = CommonDataClass(
                                        id: city?.id,
                                        value: city?.attributes?.name
                                      );
                                    },
                                  );
                                }
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ]),
      ),
    ]));
  }
}
