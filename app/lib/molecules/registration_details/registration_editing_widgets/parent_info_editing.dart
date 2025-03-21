import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/app_inputformatters.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';

import '../../../utils/app_validators.dart';
import '../../../utils/stream_builder/app_stream_builder.dart';

class ParentInfoEditing extends StatelessWidget {
  const ParentInfoEditing({
    super.key,
    required this.model,
  });

  final RegistrationsDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: model.parentInfoFormKey,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Container(
            width: 358.w,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 1,
                )),
            child: ExpansionTile(
                title:  CommonText(
                  text: Strings.of(context).father_detail,
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
                          labelText: Strings.of(context).father_first_name,
                          controller: model.fatherFirstNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'First Name',
                              checkSpecialCharacters: false,
                              validateLength: true,
                              minLength: 2),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).father_last_name,
                          controller: model.fatherLastNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Last Name',
                              checkSpecialCharacters: false,
                              validateLength: true,
                              minLength: 2),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).father_adhar_no,
                          controller: model.fatherAdharCardController,
                          keyboardType: TextInputType.number,
                          maxLength: 12,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Adhar Card No',
                              checkSpecialCharacters: false,
                              validateLength: true,
                              minLength: 12),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).father_Pan_Card_No,
                          controller: model.fatherPanCardController,
                          inputFormatters: [
                            AppInputformatters.upperCaseFormatter()
                          ],
                          maxLength: 10,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Pan Card No',
                              checkSpecialCharacters: false,
                              validateLength: true,
                              minLength: 10),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: true,
                        //   labelText: "Qualification",
                        //   controller: model.qualificationController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //     value,
                        //     'Qualification',
                        //     checkSpecialCharacters: false,
                        //   ),
                        // ),
                        StreamBuilder<List<String>>(
                            stream: model.qualifications,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.qualifications.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Qualification',
                                showAstreik: true,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'Qualification',
                                  checkSpecialCharacters: false,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedFatherQualificationSubject,
                                onSingleSelect: (val) {
                                  if (model.qualifications.value
                                      .contains(val)) {
                                    var qualification = model
                                        .qualificationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.education ??
                                                    '')
                                                .contains(val));
                                    model.selectedFatherQualification =
                                        CommonDataClass(
                                            id: qualification?.id,
                                            value: qualification
                                                ?.attributes?.education);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        StreamBuilder<List<String>>(
                            stream: model.occupation,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.occupation.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Occupation',
                                showAstreik: false,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'Occupation',
                                  checkSpecialCharacters: false,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedFatherOccupationSubject,
                                onSingleSelect: (val) {
                                  if (model.occupation.value.contains(val)) {
                                    var occupation = model.occupationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.occupation ??
                                                    '')
                                                .contains(val));
                                    model.selectedFatherOccupation =
                                        CommonDataClass(
                                            id: occupation?.id,
                                            value: occupation
                                                ?.attributes?.occupation);
                                    model.selectedFatherOccupationSubject
                                            .value =
                                        occupation?.attributes?.occupation ??
                                            '';
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: false,
                        //   labelText: "Organization Name",
                        //   controller: model.organizationNameController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //       value, 'Organization Name',
                        //       checkSpecialCharacters: false),
                        // ),
                        StreamBuilder<List<String>>(
                            stream: model.organizations,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.organizations.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Organization Name',
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedFatherOrganizationSubject,
                                onSingleSelect: (val) {
                                  if (model.organizations.value.contains(val)) {
                                    var organization = model
                                        .organizationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    model.selectedFatherOrganization =
                                        CommonDataClass(
                                            id: organization?.id,
                                            value:
                                                organization?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: false,
                        //   labelText: "Designation",
                        //   controller: model.designationController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //       value, 'Designation',
                        //       checkSpecialCharacters: false),
                        // ),
                        // StreamBuilder<List<String>>(
                        //     stream: model.designations,
                        //     builder: (context, snapshot) {
                        //       return CustomDropdownButton(
                        //         items: model.designations.value,
                        //         width: MediaQuery.of(context).size.width,
                        //         isMutiSelect: false,
                        //         dropdownName: 'Designation',
                        //         showAstreik: false,
                        //         onMultiSelect: (selectedValues) {},
                        //         showBorderColor: true,
                        //         singleSelectItemSubject:
                        //             model.selectedFatherDesignationSubject,
                        //         onSingleSelect: (val) {
                        //           if (model.designations.value.contains(val)) {
                        //             var designation = model.designationAttribute
                        //                 ?.firstWhere((element) =>
                        //                     (element.attributes?.designation ??
                        //                             '')
                        //                         .contains(val));
                        //             model.selectedFatherDesignation =
                        //                 CommonDataClass(
                        //                     id: designation?.id,
                        //                     value: designation
                        //                         ?.attributes?.designation);
                        //           }
                        //         },
                        //       );
                        //     }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).office_Address,
                          controller: model.officeAddressController,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Office Address',
                              checkSpecialCharacters: false),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CustomDropdownButton(
                        //   items: model.area,
                        //   width: MediaQuery.of(context).size.width,
                        //   isMutiSelect: false,
                        //   dropdownName: 'Area',
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //       value, 'Father Area',
                        //       checkSpecialCharacters: false),
                        //   showAstreik: false,
                        //   onMultiSelect: (val) {},
                        //   onSingleSelect: (val) {
                        //     model.fatherArea = val;
                        //   },
                        //   showBorderColor: true,
                        // ),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).area,
                          controller: model.fatherOfficeAreaController,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Office Address',
                              checkSpecialCharacters: false),
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
                                showAstreik: false,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'Country',
                                  checkSpecialCharacters: false,
                                ),
                                onMultiSelect: (selectedValues) {},
                                singleSelectItemSubject:
                                    model.selectedFatherCountrySubject,
                                onSingleSelect: (val) {
                                  if (model.country.value.contains(val)) {
                                    var country = model.countryAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherCountryType.add(true);
                                    model.selectedFatherCountrySubject.value =
                                        val;
                                    model.selectedFatherCountryEntity =
                                        CommonDataClass(
                                            id: country?.id,
                                            value: country?.attributes?.name);
                                  }
                                },
                                showBorderColor: true,
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).pin_code,
                          controller: model.pinCodeController,
                          focusNode: model.pinCodeFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 6,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Pin code',
                              checkSpecialCharacters: false),
                          onFieldSubmitted: (value) {
                            if (value.length == 6) {
                              model.getCityAndStateByPincode(
                                  pincode: model.pinCodeController.text.trim(),
                                  infoType: "fatherInfo");
                            }
                          },
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
                                showAstreik: false,
                                isDisable: true,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'State',
                                  checkSpecialCharacters: false,
                                ),
                                singleSelectItemSubject:
                                    model.selectedFatherStateSubject,
                                onMultiSelect: (selectedValues) {},
                                onSingleSelect: (val) {
                                  if (model.state.value.contains(val)) {
                                    var state = model.stateAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherStateType.add(true);
                                    model.selectedFatherStateEntity =
                                        CommonDataClass(
                                            id: state?.id,
                                            value: state?.attributes?.name);
                                  }
                                },
                                showBorderColor: true,
                              );
                            }),
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
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'City',
                                  checkSpecialCharacters: false,
                                ),
                                showAstreik: false,
                                isDisable: true,
                                onMultiSelect: (selectedValues) {},
                                singleSelectItemSubject:
                                    model.selectedFatherCitySubject,
                                onSingleSelect: (val) {
                                  if (model.city.value.contains(val)) {
                                    var city = model.cityAttribute?.firstWhere(
                                        (element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherCityType.add(true);
                                    model.selectedFatherCityEntity =
                                        CommonDataClass(
                                            id: city?.id,
                                            value: city?.attributes?.name);
                                  }
                                },
                                showBorderColor: true,
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).father_Email_ID,
                          controller: model.fatherEmailController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            'Email ID',
                            checkSpecialCharacters: false,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).father_Mobile_Number,
                          controller: model.fatherMobileController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            'Mobile Number',
                            checkSpecialCharacters: false,
                          ),
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
                title:  CommonText(
                  text: Strings.of(context).mother_Details,
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
                          labelText: Strings.of(context).mother_first_name,
                          controller: model.motherFirstNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's First Name",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).Mother_last_name,
                          controller: model.motherLastNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Last Name",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).mother_Aadhar_Card_no,
                          controller: model.motherAdharCardController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 12,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Aadhar Card No",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).mother_Pan_Card_No,
                          controller: model.motherPanCardController,
                          maxLength: 10,
                          inputFormatters: [
                            AppInputformatters.upperCaseFormatter()
                          ],
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Pan Card No",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: true,
                        //   labelText: "Qualification",
                        //   controller: model.motherQualificationController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //     value,
                        //     "Mother's Qualification",
                        //     checkSpecialCharacters: true,
                        //   ),
                        // ),
                        StreamBuilder<List<String>>(
                            stream: model.qualifications,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.qualifications.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Qualification',
                                showAstreik: true,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  'Qualification',
                                  checkSpecialCharacters: false,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedMotherQualificationSubject,
                                onSingleSelect: (val) {
                                  if (model.qualifications.value
                                      .contains(val)) {
                                    var qualification = model
                                        .qualificationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.education ??
                                                    '')
                                                .contains(val));
                                    model.selectedMotherQualification =
                                        CommonDataClass(
                                            id: qualification?.id,
                                            value: qualification
                                                ?.attributes?.education);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        StreamBuilder<List<String>>(
                            stream: model.occupation,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.occupation.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Occupation',
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedMotherOccupationSubject,
                                onSingleSelect: (val) {
                                  if (model.occupation.value.contains(val)) {
                                    var occupation = model.occupationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.occupation ??
                                                    '')
                                                .contains(val));
                                    model.selectedMotherOccupation =
                                        CommonDataClass(
                                            id: occupation?.id,
                                            value: occupation
                                                ?.attributes?.occupation);
                                    model.selectedMotherOccupationSubject
                                            .value =
                                        occupation?.attributes?.occupation ??
                                            '';
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: false,
                        //   labelText: "Organization Name",
                        //   controller: model.motherOrganizationNameController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //     value,
                        //     "Mother's Organization Name",
                        //     checkSpecialCharacters: true,
                        //   ),
                        // ),
                        StreamBuilder<List<String>>(
                            stream: model.organizations,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.organizations.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Organization Name',
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedMotherOrganizationSubject,
                                onSingleSelect: (val) {
                                  if (model.organizations.value.contains(val)) {
                                    var organization = model
                                        .organizationAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    model.selectedMotherOrganization =
                                        CommonDataClass(
                                            id: organization?.id,
                                            value:
                                                organization?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: false,
                        //   labelText: "Designation",
                        //   controller: model.motherDesignationController,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //     value,
                        //     "Mother's Designation",
                        //     checkSpecialCharacters: true,
                        //   ),
                        // ),
                        // StreamBuilder<List<String>>(
                        //     stream: model.designations,
                        //     builder: (context, snapshot) {
                        //       return CustomDropdownButton(
                        //         items: model.designations.value,
                        //         width: MediaQuery.of(context).size.width,
                        //         isMutiSelect: false,
                        //         dropdownName: 'Designation',
                        //         showAstreik: false,
                        //         onMultiSelect: (selectedValues) {},
                        //         showBorderColor: true,
                        //         singleSelectItemSubject:
                        //             model.selectedMotherDesignationSubject,
                        //         onSingleSelect: (val) {
                        //           if (model.designations.value.contains(val)) {
                        //             var designation = model.designationAttribute
                        //                 ?.firstWhere((element) =>
                        //                     (element.attributes?.designation ??
                        //                             '')
                        //                         .contains(val));
                        //             model.selectedMotherDesignation =
                        //                 CommonDataClass(
                        //                     id: designation?.id,
                        //                     value: designation
                        //                         ?.attributes?.designation);
                        //           }
                        //         },
                        //       );
                        //     }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).office_Address,
                          controller: model.motherOfficeAddressController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Office Address",
                            checkSpecialCharacters: false,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CustomDropdownButton(
                        //   items: model.area,
                        //   width: MediaQuery.of(context).size.width,
                        //   isMutiSelect: false,
                        //   dropdownName: 'Area',
                        //   showAstreik: false,
                        //   onMultiSelect: (selectedValues) {},
                        //   showBorderColor: true,
                        //   validator: (value) => AppValidators.validateNotEmpty(
                        //     value,
                        //     "Mother's Area",
                        //     checkSpecialCharacters: true,
                        //   ),
                        //   onSingleSelect: (val) {
                        //     model.motherArea = val;
                        //   },
                        // ),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).area,
                          controller: model.motherOfficeAreaController,
                          validator: (value) => AppValidators.validateNotEmpty(
                              value, 'Area',
                              checkSpecialCharacters: false),
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
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedMotherCountrySubject,
                                onSingleSelect: (val) {
                                  if (model.country.value.contains(val)) {
                                    var country = model.countryAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    model.selectedMotherCountrySubject.value =
                                        val;
                                    model.selectedMotherCountryEntity =
                                        CommonDataClass(
                                            id: country?.id,
                                            value: country?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).pin_code,
                          controller: model.motherPinCodeController,
                          focusNode: model.motherPinCodeFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 6,
                          onFieldSubmitted: (value) {
                            if (value.length == 6) {
                              model.getCityAndStateByPincode(
                                  pincode:
                                      model.motherPinCodeController.text.trim(),
                                  infoType: "motherInfo");
                            }
                          },
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Pin code",
                            checkSpecialCharacters: true,
                          ),
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
                                isDisable: true,
                                singleSelectItemSubject:
                                    model.selectedMotherStateSubject,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Mother's State",
                                  checkSpecialCharacters: true,
                                ),
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                onSingleSelect: (val) {
                                  if (model.state.value.contains(val)) {
                                    var state = model.stateAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherStateType.add(true);
                                    model.selectedMotherStateEntity =
                                        CommonDataClass(
                                            id: state?.id,
                                            value: state?.attributes?.name);
                                  }
                                },
                              );
                            }),
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
                                showAstreik: false,
                                isDisable: true,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Mother's City",
                                  checkSpecialCharacters: true,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedMotherCitySubject,
                                onSingleSelect: (val) {
                                  if (model.city.value.contains(val)) {
                                    var city = model.cityAttribute?.firstWhere(
                                        (element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedMotherCityType.add(true);
                                    model.selectedMotherCityEntity =
                                        CommonDataClass(
                                            id: city?.id,
                                            value: city?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).mother_Email_ID,
                          controller: model.motherEmailController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's Email ID",
                            checkSpecialCharacters: false,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: true,
                          labelText: Strings.of(context).mother_Mobile_Number,
                          controller: model.motherMobileController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Mother's First Name",
                            checkSpecialCharacters: true,
                          ),
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
                title:  CommonText(
                  text: Strings.of(context).guardian_detail,
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
                          showAstreik: false,
                          labelText: Strings.of(context).gardian_first_name,
                          controller: model.guardianFirstNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's First Name",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).gardian_last_name,
                          controller: model.guardianLastNameController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Last Name",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).gardian_adhar_no,
                          controller: model.guardianAdharCardController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 12,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Aadhar Card No",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).gardian_Pan_Card_No,
                          controller: model.guardianPanCardController,
                          maxLength: 10,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Pan Card No",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        // CommonTextFormField(
                        //   showAstreik: false,
                        //   labelText: "Relationship with child",
                        // ),
                        StreamBuilder<List<String>>(
                            stream: model.relationWithChild,
                            builder: (context, snapshot) {
                              return CustomDropdownButton(
                                items: model.relationWithChild.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'Relationship with child',
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedRelationWithChildSubject,
                                onSingleSelect: (val) {
                                  if (model.relationWithChild.value
                                      .contains(val)) {
                                    var relationWithChild = model
                                        .relationWithChildAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedGuardianCountryType.add(true);
                                    model.selectedRelationWithChildSubject
                                        .value = val;
                                    model.selectedRelationWithChildEntity =
                                        CommonDataClass(
                                            id: relationWithChild?.id,
                                            value: relationWithChild
                                                ?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).house_no,
                          controller: model.guardianHouseNumberController,
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).street_name,
                          controller: model.guardianStreetController,
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).landmark,
                          controller: model.guardianLandmarkController,
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
                                showAstreik: false,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Guardian's Country",
                                  checkSpecialCharacters: true,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedGuardianCountrySubject,
                                onSingleSelect: (val) {
                                  if (model.country.value.contains(val)) {
                                    var country = model.countryAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedGuardianCountryType.add(true);
                                    model.selectedGuardianCountrySubject.value =
                                        val;
                                    model.selectedGuardianCountryEntity =
                                        CommonDataClass(
                                            id: country?.id,
                                            value: country?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).pin_code,
                          controller: model.guardianPinCodeController,
                          focusNode: model.guardianPinCodeFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 6,
                          onFieldSubmitted: (value) {
                            if (value.length == 6) {
                              model.getCityAndStateByPincode(
                                  pincode: model.guardianPinCodeController.text
                                      .trim(),
                                  infoType: "guardianInfo");
                            }
                          },
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Pin Code",
                            checkSpecialCharacters: true,
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && value.length == 6) {
                              model.getCityAndStateByPincode(
                                  pincode: value, infoType: "guardianInfo");
                            }
                          },
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<List<String>>(
                            stream: model.state,
                            initialData: model.state.value,
                            dataBuilder: (context, snapshot) {
                              return CustomDropdownButton(
                                isDisable: true,
                                items: model.state.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'State',
                                showAstreik: false,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Guardian's State",
                                  checkSpecialCharacters: true,
                                ),
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedGuardianStateSubject,
                                onSingleSelect: (val) {
                                  if (model.state.value.contains(val)) {
                                    var state = model.stateAttribute
                                        ?.firstWhere((element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherStateType.add(true);
                                    model.selectedGuardianStateEntity =
                                        CommonDataClass(
                                            id: state?.id,
                                            value: state?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<List<String>>(
                            stream: model.city,
                            initialData: model.city.value,
                            dataBuilder: (context, snapshot) {
                              return CustomDropdownButton(
                                // isDisable: true,
                                items: model.city.value,
                                width: MediaQuery.of(context).size.width,
                                isMutiSelect: false,
                                dropdownName: 'City',
                                isDisable: true,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Guardian's City",
                                  checkSpecialCharacters: true,
                                ),
                                showAstreik: false,
                                onMultiSelect: (selectedValues) {},
                                showBorderColor: true,
                                singleSelectItemSubject:
                                    model.selectedGuardianCitySubject,
                                onSingleSelect: (val) {
                                  if (model.city.value.contains(val)) {
                                    var city = model.cityAttribute?.firstWhere(
                                        (element) =>
                                            (element.attributes?.name ?? '')
                                                .contains(val));
                                    // model.selectedFatherCityType.add(true);
                                    model.selectedGuardianCityEntity =
                                        CommonDataClass(
                                            id: city?.id,
                                            value: city?.attributes?.name);
                                  }
                                },
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).gardian_Email_ID,
                          controller: model.guardianEmailController,
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Email Id",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        CommonTextFormField(
                          showAstreik: false,
                          labelText: Strings.of(context).guardian_Mobile_Number,
                          controller: model.guardianMobileController,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) => AppValidators.validateNotEmpty(
                            value,
                            "Guardian's Mobile Number",
                            checkSpecialCharacters: true,
                          ),
                        ),
                        CommonRadioButtonWidget(
                          title: Strings.of(context).custodian_guardian,
                          commonRadioButton: model.radioButtonController,
                          value: 'Custodian Guardian',
                        ),
                        CommonRadioButtonWidget(
                          title: Strings.of(context).legal_guardian,
                          commonRadioButton: model.radioButtonController,
                          value: 'Legal Guardian',
                        ),
                        CommonRadioButtonWidget(
                          title: Strings.of(context).not_applicable,
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
                title:  CommonText(
                  text: Strings.of(context).sibling_detail,
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
                       CommonText(
                          text: Strings.of(context).for_sibling_1,
                          style: AppTypography.subtitle2,
                        ),
                        CommonSizedBox.sizedBox(height: 10, width: 10),
       CommonText(
                          text: Strings.of(context).is_sibling,
                          style: AppTypography.subtitle2,
                        ),
                        CommonRadioButtonWidget(
                          title: Strings.of(context).vibgyor_student,
                          commonRadioButton: model.radioButtonController1,
                          value: 'Vibgyor Student',
                          onOptionSelected: (value) {
                            model.siblingFirstNameController.text = '';
                            model.siblingLastNameController.text = '';
                            model.siblingsSchoolController.text = '';
                            model.siblingGender.value = '';
                            model.selectedSiblingGender = null;
                            model.siblingGrade.value = '';
                            model.selectedSiblingGrade = null;
                            model.siblingDOB = null;
                          },
                        ),
                        CommonRadioButtonWidget(
                          title: Strings.of(context).non_vibgyor_Student,
                          commonRadioButton: model.radioButtonController1,
                          value: 'Non-Vibgyor Studente',
                          onOptionSelected: (value) {
                            model.siblingsEnrollmentController.text = '';
                            model.siblingFirstNameController.text = '';
                            model.siblingLastNameController.text = '';
                            model.siblingsSchoolController.text = '';
                            model.siblingGender.value = '';
                            model.selectedSiblingGender = null;
                            model.siblingGrade.value = '';
                            model.selectedSiblingGrade = null;
                            model.siblingDOB = null;
                            if (model.siblingDetail.value.data?.data
                                    ?.siblingProfile?.dob !=
                                null) {
                              model.siblingDetail.value.data?.data
                                  ?.siblingProfile?.dob = null;
                            }
                          },
                        ),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, data) {
                              return Visibility(
                                visible:
                                    model.radioButtonController1.selectedItem ==
                                        "Vibgyor Student",
                                child: CommonTextFormField(
                                  showAstreik: false,
                                  labelText: "Sibling's Enrollment Number",
                                  controller:
                                      model.siblingsEnrollmentController,
                                  validator: (value) =>
                                      AppValidators.validateNotEmpty(
                                    value,
                                    "Sibling's Enrollment Number",
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                            r'^[a-zA-Z0-9\-]+$') // Only allows alphanumeric and hyphen
                                        )
                                  ],
                                  textInputAction: TextInputAction.done,
                                  focusNode: model.enrollmentNode,
                                  onFieldSubmitted: (value) =>
                                      model.onFormFieldSubmitted(value),
                                ),
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return CommonTextFormField(
                                showAstreik: false,
                                readOnly:
                                    selectStudentType == "Vibgyor Student",
                                labelText: Strings.of(context).sibling_first_name,
                                controller: model.siblingFirstNameController,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Sibling's First Name",
                                  checkSpecialCharacters: true,
                                ),
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return CommonTextFormField(
                                showAstreik: false,
                                labelText: Strings.of(context).sibling_last_name,
                                readOnly:
                                    selectStudentType == "Vibgyor Student",
                                controller: model.siblingLastNameController,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Sibling's Last Name",
                                  checkSpecialCharacters: true,
                                ),
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return AppStreamBuilder<
                                      Resource<SiblingProfileResponse>>(
                                  stream: model.siblingDetail.stream,
                                  initialData: Resource.none(),
                                  dataBuilder: (context, data) {
                                    return CommonDatePickerWidget(
                                      controller: model.siblingDOBController,
                                      isDisabled: selectStudentType ==
                                          "Vibgyor Student",
                                      labelName: Strings.of(context).date_of_birth,
                                      initialDate: data?.data?.data
                                              ?.siblingProfile?.dob ??
                                          model.siblingDOB,
                                      lastDate:
                                          DateTime(DateTime.now().year - 1),
                                      isDOB: true,
                                      onDateSelected: (newDate) {
                                        if (data != null) {
                                          data.data?.data?.siblingProfile?.dob =
                                              newDate;
                                          model.siblingDOB = newDate;
                                        } else {
                                          model.siblingDOB = newDate;
                                        }
                                      },
                                    );
                                  });
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return AppStreamBuilder<String>(
                                  stream: model.siblingInitialGender.stream,
                                  initialData: model.siblingInitialGender.value,
                                  dataBuilder: (context, data) {
                                    return CustomDropdownButton(
                                      items: model.gender.value,
                                      isDisable: selectStudentType ==
                                          "Vibgyor Student",
                                      intialValue: data,
                                      width: MediaQuery.of(context).size.width,
                                      isMutiSelect: false,
                                      dropdownName: 'Gender',
                                      showAstreik: false,
                                      validator: (value) =>
                                          AppValidators.validateNotEmpty(
                                        value,
                                        "Sibling's Gender",
                                        checkSpecialCharacters: true,
                                      ),
                                      onMultiSelect: (selectedValues) {},
                                      showBorderColor: true,
                                      singleSelectItemSubject:
                                          model.siblingGender,
                                      onSingleSelect: (val) {
                                        var gender = model.genderAttribute
                                            ?.firstWhere((element) =>
                                                (element.attributes?.name ?? '')
                                                    .contains(val));
                                        model.selectedSiblingGender =
                                            CommonDataClass(
                                                id: gender?.id,
                                                value:
                                                    gender?.attributes?.name);
                                        model.siblingGender.value = val;
                                      },
                                    );
                                  });
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return CommonTextFormField(
                                readOnly:
                                    selectStudentType == "Vibgyor Student",
                                showAstreik: false,
                                labelText: Strings.of(context).school,
                                validator: (value) =>
                                    AppValidators.validateNotEmpty(
                                  value,
                                  "Sibling's School",
                                  checkSpecialCharacters: true,
                                ),
                                controller: model.siblingsSchoolController,
                              );
                            }),
                        CommonSizedBox.sizedBox(height: 15, width: 10),
                        AppStreamBuilder<String?>(
                            stream:
                                model.radioButtonController1.selectedItemStream,
                            initialData:
                                model.radioButtonController1.selectedItem,
                            dataBuilder: (context, selectStudentType) {
                              return AppStreamBuilder<String>(
                                  stream: model.siblingGrades,
                                  initialData: model.siblingGrades.value,
                                  dataBuilder: (context, data) {
                                    return CustomDropdownButton(
                                      items: model.gradeTypes.value,
                                      isDisable: selectStudentType ==
                                          "Vibgyor Student",
                                      intialValue: data,
                                      width: MediaQuery.of(context).size.width,
                                      isMutiSelect: false,
                                      dropdownName: 'Grade',
                                      showAstreik: false,
                                      validator: (value) =>
                                          AppValidators.validateNotEmpty(
                                        value,
                                        "Sibling's Grade",
                                        checkSpecialCharacters: true,
                                      ),
                                      onMultiSelect: (selectedValues) {},
                                      showBorderColor: true,
                                      singleSelectItemSubject:
                                          model.siblingGrade,
                                      onSingleSelect: (val) {
                                        var grade = model.gradeTypesAttribute
                                            ?.firstWhere((element) =>
                                                (element.attributes?.name ?? '')
                                                    .contains(val));
                                        model.selectedSiblingGrade =
                                            CommonDataClass(
                                                id: grade?.id,
                                                value: grade?.attributes?.name);
                                        model.siblingGrade.value = val;
                                      },
                                    );
                                  });
                            }),
                      ],
                    ),
                  )
                ]),
          ),
  Align(
            alignment: Alignment.topLeft,
            child: CommonText(
              text: Strings.of(context).are_parent_saper,
              style: AppTypography.subtitle2,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  child: CommonRadioButtonWidget(
                    title: Strings.of(context).yes,
                    commonRadioButton: model.radioButtonController2,
                    value: 'Yes',
                  ),
                ),
                Expanded(
                  child: CommonRadioButtonWidget(
                    title: Strings.of(context).no,
                    commonRadioButton: model.radioButtonController2,
                    value: 'No',
                  ),
                )
              ]),
            ),
          ),
          AppStreamBuilder<String?>(
              stream: model.radioButtonController2.selectedItemStream,
              initialData: model.radioButtonController2.selectedItem,
              dataBuilder: (context, data) {
                return Visibility(
                  visible: data == 'Yes',
                  child:  Align(
                    alignment: Alignment.topLeft,
                    child: CommonText(
                      text: Strings.of(context).who_Has_The_Custody_Of_the_Child,
                      style: AppTypography.subtitle2,
                    ),
                  ),
                );
              }),
          AppStreamBuilder<String?>(
              stream: model.radioButtonController2.selectedItemStream,
              initialData: model.radioButtonController2.selectedItem,
              dataBuilder: (context, data) {
                return Visibility(
                  visible: data == 'Yes',
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 300,
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Expanded(
                          child: CommonRadioButtonWidget(
                            title: Strings.of(context).mother,
                            commonRadioButton: model.radioButtonController10,
                            value: 'Mother',
                          ),
                        ),
                        Expanded(
                          child: CommonRadioButtonWidget(
                            title: Strings.of(context).father,
                            commonRadioButton: model.radioButtonController10,
                            value: 'Father',
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 100,
          )
        ]));
  }
}
