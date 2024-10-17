import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryAndStudentEditing extends StatelessWidget {
  final RegistrationsDetailsViewModel model;
  final EnquiryDetailArgs enquiryDetailArgs;
  const EnquiryAndStudentEditing({super.key,required this.model,required this.enquiryDetailArgs});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.studenFormKey,
      child: Column(children: [
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
                text: 'Enquiry Details',
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
                        labelText: "Enquiry Number",
                        readOnly: true,
                        controller: model.enquiryNumberController,
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Enquiry Date',
                        readOnly: true,
                        controller: model.enquiryDateController,
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: "Enquiry Type",
                        readOnly: true,
                        controller: model.enquiryTypeController,
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      StreamBuilder<List<String>>(
                        stream: model.schoolLocationTypes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          }else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'School Location',
                              showAstreik: true,
                              showBorderColor: true,
                              singleSelectItemSubject: model.selectedSchoolLocationSubject,
                              items: snapshot.data??[],
                              onSingleSelect: (selectedValue) {
                                if (model.schoolLocationTypes.value.contains(selectedValue)) {
                                  var schoolLocation = model.schoolLocationTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedSchoolLocationType.add(true);
                                  model.selectedSchoolLocationEntity?.id = schoolLocation?.id;
                                  model.selectedSchoolLocationEntity?.value = schoolLocation?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'school location'),
                              );
                          }
                        }
                      ),
                    ],
                  ),
                )
              ]),
        ),
        //
        Container(
          width: 358.w,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1,
              )),
          child: ExpansionTile(
              title: const CommonText(
                text: 'Student Details',
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
                        labelText: "Student First Name",
                        controller: model.studentFirstNameController,
                        validator: (value)=> AppValidators.validateNotEmpty(value, 'Student first name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextFormField(
                        showAstreik: true,
                        labelText: "Student Last Name",
                        controller: model.studentLastNameController,
                        validator: (value)=> AppValidators.validateNotEmpty(value, 'Student last name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<List<String>>(
                        stream: model.gradeTypes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          }else{
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Grade',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              onSingleSelect: (selectedValue) {
                                if (model.gradeTypes.value.contains(selectedValue)) {
                                  var grade = model.gradeTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedGradeType.add(true);
                                  model.selectedGenderEntity?.id = grade?.id;
                                  model.selectedGradeEntity?.value = grade?.attributes?.name;
                                }
                              },
                              singleSelectItemSubject: model.selectedGradeSubject,
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'grade'),
                            );
                          }
                        }
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonDatePickerWidget(
                        labelName: "DOB",
                        showAstreik: true,
                        initialDate: model.studentDob,
                        controller: model.dobController,
                        onDateSelected: (newDate) {
                          model.studentDob = newDate;
                          print("###Changed Date: ${model.studentDob}");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextFormField(
                        showAstreik: false,
                        readOnly: true,
                        labelText: "Eligible Grade",
                        controller: model.studentEligibleGradeController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextFormField(
                        showAstreik: true,
                        labelText: "Student Aadhar No",
                        controller: model.studentAadharController,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<List<String>>(
                        stream: model.gender,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Gender',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedGenderSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.gender.value.contains(selectedValue)) {
                                  var gender = model.genderAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedGenerType.add(true);
                                  model.selectedGenderEntity?.id = gender?.id;
                                  model.selectedGenderEntity?.value = gender?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'gender'),
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Existing School Name',
                        controller: model.existingSchoolNameController,
                        validator: (value)=> AppValidators.validateNotEmpty(value, 'Existing school name'),
                      ),
                      const SizedBox(height: 20,),
                      StreamBuilder<List<String>>(
                        stream: model.existingSchoolBoard,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Existing School Board',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedExistingSchoolBoardSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.existingSchoolBoard.value.contains(selectedValue)) {
                                  var board = model.existingSchoolBoardAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedExistingSchoolBoard.add(true);
                                  model.selectedExistingSchoolBoardEntity?.id = board?.id;
                                  model.selectedExistingSchoolBoardEntity?.value = board?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      StreamBuilder<List<String>>(
                        stream: model.gradeTypes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Existing School Grade',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedExistingSchoolGradeSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.existingSchoolGrade.value.contains(selectedValue)) {
                                  var grade = model.gradeTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedExistingSchoolGrade.add(true);
                                  model.selectedExistingSchoolGradeEntity?.id = grade?.id;
                                  model.selectedExistingSchoolGradeEntity?.value = grade?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      StreamBuilder<List<String>>(
                        stream: model.gradeTypes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Existing School Grade',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedExistingSchoolGradeSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.existingSchoolGrade.value.contains(selectedValue)) {
                                  var grade = model.gradeTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedExistingSchoolGrade.add(true);
                                  model.selectedExistingSchoolGradeEntity?.id = grade?.id;
                                  model.selectedExistingSchoolGradeEntity?.value = grade?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'existing school grade'),
                            );
                          }
                        }
                      ),
                      if((enquiryDetailArgs.enquiryType??"") == "PSA")...[
                        const SizedBox(height: 20,),
                        psaDetails()
                      ],
                      if((enquiryDetailArgs.enquiryType??"") == "IVT")...[
                        const SizedBox(height: 20,),
                        ivtDetails()
                      ],
                      const SizedBox(height: 20,),
                      CustomDropdownButton(
                        width: MediaQuery.of(context).size.width,
                        onMultiSelect: (selectedValues) {},
                        dropdownName: 'Select Parent Type',
                        showAstreik: true,
                        showBorderColor: true,
                        items: model.parentType,
                        singleSelectItemSubject: model.selectedParentTypeSubject,
                        onSingleSelect: (selectedValue) {
                          model.selectedParentTypeSubject.value = selectedValue;
                        },
                        isMutiSelect: false,
                        validator: (value)=> AppValidators.validateDropdown(value, 'parent type'),
                      ),
                      const SizedBox(height: 20,),
                      AppStreamBuilder<String>(
                        stream: model.selectedParentTypeSubject,
                        initialData: model.selectedParentTypeSubject.value, 
                        dataBuilder: (context, data) {
                          return Column(
                            children: [
                              if((data??'') == "Father")...[
                                CommonTextFormField(
                                  showAstreik: false,
                                  labelText: 'Global ID',
                                  readOnly: true,
                                  controller: model.fatherGlobalIdController,
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent First Name',
                                  controller: model.studentsFatherFirstNameController,
                                  validator: (value)=> AppValidators.validateNotEmpty(value, 'Parent first name'),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Last Name',
                                  controller: model.studentsFatherLastNameController,
                                  validator: (value)=> AppValidators.validateNotEmpty(value, 'Parent last name'),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Email ID',
                                  controller: model.studentsFatherEmailController,
                                  validator: (value)=> AppValidators.validateEmail(value),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Mobile Number',
                                  controller: model.studentsFatherContactController,
                                  validator: (value)=> AppValidators.validateMobile(value),
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ]
                              else...[
                                CommonTextFormField(
                                  showAstreik: false,
                                  labelText: 'Gloabal ID',
                                  readOnly: true,
                                  controller: model.motherGlobalIdController,
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent First Name',
                                  controller: model.studentsMotherFirstNameController,
                                  validator: (value)=> AppValidators.validateNotEmpty(value, 'Parent first name'),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Last Name',
                                  controller: model.studentsMotherLastNameController,
                                  validator: (value)=> AppValidators.validateNotEmpty(value, 'Parent last name'),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Email ID',
                                  controller: model.studentsMotherEmailController,
                                  validator: (value)=> AppValidators.validateEmail(value),
                                ),
                                CommonSizedBox.sizedBox(height: 15, width: 10),
                                CommonTextFormField(
                                  showAstreik: true,
                                  labelText: 'Parent Mobile Number',
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.phone,
                                  controller: model.studentsMotherContactController,
                                  validator: (value)=> AppValidators.validateMobile(value),
                                ),
                              ]
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20,),
                      // CommonTextFormField(
                      //   labelText: 'Religion',
                      //   showAstreik: false,
                      //   controller: model.religionController,
                      //   validator: (value)=> AppValidators.validateNotEmpty(value, 'religion'),
                      // ),
                      StreamBuilder<List<String>>(
                        stream: model.religions,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Religion',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedReligionSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.religions.value.contains(selectedValue)) {
                                  var religion = model.religionAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedSubCaste?.id = religion?.id;
                                  model.selectedSubCaste?.value = religion?.attributes?.name;
                                  model.selectedReligionSubject.add(selectedValue);
                                }
                              },
                              isMutiSelect: false,
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      CommonTextFormField(
                        labelText: 'Place Of Birth',
                        showAstreik: true,
                        controller: model.placeOfBirthController,
                        validator: (value)=> AppValidators.validateNotEmpty(value, 'place of birth'),
                      ),
                      const SizedBox(height: 20),
                      // CommonTextFormField(
                      //   showAstreik: false,
                      //   labelText: 'Caste',
                      //   controller: model.casteController,
                      //   validator: (value)=> AppValidators.validateNotEmpty(value, 'caste'),
                      // ),
                      StreamBuilder<List<String>>(
                        stream: model.castes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Caste',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedCasteSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.castes.value.contains(selectedValue)) {
                                  var caste = model.casteAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedCaste?.id = caste?.id;
                                  model.selectedCaste?.value = caste?.attributes?.name;
                                  model.selectedCasteSubject.add(selectedValue);
                                }
                              },
                              isMutiSelect: false,
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      // CommonTextFormField(
                      //   labelText: 'Sub Caste',
                      //   showAstreik: false,
                      //   controller: model.subCasteController,
                      //   validator: (value)=> AppValidators.validateNotEmpty(value, 'sub caste'),
                      // ),
                      StreamBuilder<List<String>>(
                        stream: model.subCastes,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Sub Caste',
                              showAstreik: false,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedSubCasteSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.subCastes.value.contains(selectedValue)) {
                                  var subCaste = model.subCasteAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedSubCaste?.id = subCaste?.id;
                                  model.selectedSubCaste?.value = subCaste?.attributes?.name;
                                  model.selectedSubCasteSubject.add(selectedValue);
                                }
                              },
                              isMutiSelect: false,
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      // CommonTextFormField(
                      //   labelText: 'Nationality',
                      //   showAstreik: false,
                      //   controller: model.nationalityController,
                      //   validator: (value)=> AppValidators.validateNotEmpty(value, 'nationality'),
                      // ),
                      StreamBuilder<List<String>>(
                        stream: model.nationalities,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Nationality',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedNationalitySubject,
                              onSingleSelect: (selectedValue) {
                                if (model.nationalities.value.contains(selectedValue)) {
                                  var nationality = model.nationality?.firstWhere((element)=> (element.attributes?.nationality??'').contains(selectedValue));
                                  model.selectedNationality?.id = nationality?.id;
                                  model.selectedNationality?.value = nationality?.attributes?.name;
                                  model.selectedNationalitySubject.add(selectedValue);
                                }
                              },
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'existing school board'),
                            );
                          }
                        }
                      ),
                      const SizedBox(height: 20,),
                      // CommonTextFormField(
                      //   labelText: 'Mother Tongue',
                      //   showAstreik: true,
                      //   controller: model.motherTongueController,
                      //   validator: (value)=> AppValidators.validateNotEmpty(value, 'mother tounge'),
                      // ),
                      StreamBuilder<List<String>>(
                        stream: model.motherTongues,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          } else {
                            return CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Mother Tongue',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedMotherTongueSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.motherTongues.value.contains(selectedValue)) {
                                  var board = model.motherTongueAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedMotherTongue?.id = board?.id;
                                  model.selectedMotherTongue?.value = board?.attributes?.name;
                                  model.selectedMotherTongueSubject.add(selectedValue);
                                }
                              },
                              isMutiSelect: false,
                              validator: (value)=> AppValidators.validateDropdown(value, 'existing school board'),
                            );
                          }
                        }
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ]),
    );
  }

  Widget psaDetails(){
    return Column(
      children: [
        StreamBuilder<List<String>>(
          stream: model.psaSubType,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'PSA Sub Type',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.psaSubTypeSubject,
                onSingleSelect: (selectedValue) {
                  if (model.psaSubType.value.contains(selectedValue)) {
                    var psaSubType = model.psaSubTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedPsaSubType.add(true);
                    model.selectedPsaSubTypeEntity?.id = psaSubType?.id;
                    model.selectedPsaSubTypeEntity?.value = psaSubType?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'PSA sub type'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaCategory,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'PSA Category',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.psaCategorySubject,
                onSingleSelect: (selectedValue) {
                  if (model.psaCategory.value.contains(selectedValue)) {
                    var psaCategory = model.psaCategoryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedPsaCategory.add(true);
                    model.selectedPsaCategoryEntity?.id = psaCategory?.id;
                    model.selectedPsaCategoryEntity?.value = psaCategory?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'PSA category'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaSubCategory,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'PSA Sub Category',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.psaSubCategorySubject,
                onSingleSelect: (selectedValue) {
                  if (model.psaSubCategory.value.contains(selectedValue)) {
                    var psaSubCategory = model.psaSubCategoryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedPsaSubCategory.add(true);
                    model.selectedPsaSubCategoryEntity?.id = psaSubCategory?.id;
                    model.selectedPsaSubCategoryEntity?.value = psaSubCategory?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'PSA sub category'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.periodOfService,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Period of service',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.periodOfServiceSubject,
                onSingleSelect: (selectedValue) {
                  if (model.periodOfService.value.contains(selectedValue)) {
                  var periodOfService = model.periodOfServiceAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedPeriodOfService.add(true);
                    model.selectedPeriodOfServiceEntity?.id = periodOfService?.id;
                    model.selectedPeriodOfServiceEntity?.value = periodOfService?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'period of service'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaBatch,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'PSA batch',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.psaBatchSubject,
                onSingleSelect: (selectedValue) {
                  if (model.psaBatch.value.contains(selectedValue)) {
                    var psaBatch = model.psaBatchAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedPsaBatch.add(true);
                    model.selectedPsaBatchEntity?.id = psaBatch?.id;
                    model.selectedPsaBatchEntity?.value = psaBatch?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'PSA batch'),
              );
            }
          }
        ),
      ],
    );
  }

  Widget ivtDetails(){
    return Column(
      children: [
        StreamBuilder<List<String>>(
          stream: model.existingSchoolBoard,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Board',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.ivtBoardSubject,
                onSingleSelect: (selectedValue) {
                  if (model.existingSchoolBoard.value.contains(selectedValue)) {
                    var board = model.existingSchoolBoardAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selecteBoard.add(true);
                    model.selectedBoardEntity?.id = board?.id;
                    model.selectedBoardEntity?.value = board?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'board'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.course,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Course',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.ivtCourseSubject,
                onSingleSelect: (selectedValue) {
                  if (model.course.value.contains(selectedValue)) {
                    var course = model.courseTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedCourse.add(true);
                    model.selectedCourseEntity?.id = course?.id;
                    model.selectedCourseEntity?.value = course?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'course'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Stream',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.ivtStreamSubject,
                onSingleSelect: (selectedValue) {
                  if (model.stream.value.contains(selectedValue)) {
                    var stream = model.streamTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedStream.add(true);
                    model.selectedStreamEntity?.id = stream?.id;
                    model.selectedStreamEntity?.value = stream?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'stream'),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.shift,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'Shift',
                showAstreik: true,
                showBorderColor: true,
                items: snapshot.data??[],
                singleSelectItemSubject: model.ivtShiftSubject,
                onSingleSelect: (selectedValue) {
                  if (model.shift.value.contains(selectedValue)) {
                    var board = model.shiftTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                    model.selectedShift.add(true);
                    model.selectedShiftEntity?.id = board?.id;
                    model.selectedShiftEntity?.value = board?.attributes?.name;
                  }
                },
                isMutiSelect: false,
                validator: (value)=> AppValidators.validateDropdown(value, 'shift'),
              );
            }
          }
        ),
      ],
    );
  }
}
