import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class EditEnquiriesDetailsWidget extends StatelessWidget {
  EnquiriesDetailsPageModel model;
  PSADetail? psaDetail;
  IVTDetail? ivtDetail;
  NewAdmissionDetail? newAdmissionDetail;
  EnquiryDetailArgs? enquiryDetailArgs;
  EditEnquiriesDetailsWidget({
    super.key,
    required this.model,
    required this.enquiryDetailArgs,
    this.psaDetail,
    this.ivtDetail,
    this.newAdmissionDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          CommonTextFormField(
            showAstreik: false,
            labelText: "Enquiry Number",
            readOnly: true,
            controller: model.enquiryNumberController,
          ),
          const SizedBox(
            height: 20,
          ),
          CommonTextFormField(
            showAstreik: false,
            labelText: "Enquiry Type",
            readOnly: true,
            controller: model.enquiryTypeController,
          ),
          const SizedBox(
            height: 20,
          ),
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
                  validator: (value) => AppValidators.validateDropdown(value, "School location"),
                  );
              }
            }
          ),
          const SizedBox(
            height: 20,
          ),
      
          CommonTextFormField(
            showAstreik: true,
            labelText: "Student First Name",
            controller: model.studentFirstNameController,
            validator: (value) => AppValidators.validateNotEmpty(value, "Student first name"),
          ),
          const SizedBox(
            height: 20,
          ),
          CommonTextFormField(
            showAstreik: true,
            labelText: "Student Last Name",
            controller: model.studentLastNameController,
            validator: (value) => AppValidators.validateNotEmpty(value, "Student last name"),
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
                  validator: (value) => AppValidators.validateDropdown(value, "grade"),
                );
              }
            }
          ),
          const SizedBox(
            height: 20,
          ),
          // CommonTextFormField(
          //   showAstreik: true,
          //   labelText: "DOB",
          //   controller: model.dobController,
          //   readOnly: true,
          //   onTap: ()async{
          //     DateTime? dob = await showDatePicker(
          //       context: context,
          //       firstDate: DateTime(DateTime.now().year-20,DateTime.now().month,DateTime.now().day),
          //       lastDate: DateTime.now(),
          //       barrierDismissible: true
          //     );
          //     if(dob!=null){
          //       model.dobController.text = DateFormat('dd/MM/yyyy').format(dob);
          //     }
          //   },
          //   validator: (value) => AppValidators.validateNotEmpty(value, "DOB", checkSpecialCharacters: false),
          // ),
          CommonDatePickerWidget(
            initialDate: model.studentDob,
            labelName: "DOB",
            showAstreik: true,
            onDateSelected: (newDate) {
              model.studentDob = newDate;
            },
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
                  validator: (value) => AppValidators.validateDropdown(value, "gender"),
                );
              }
            }
          ),
          const SizedBox(height: 20,),
          CommonTextFormField(
            showAstreik: true,
            labelText: 'Existing School Name',
            controller: model.existingSchoolNameController,
            validator: (value) => AppValidators.validateNotEmpty(value, "Existing school name"),
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
                  showAstreik: true,
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
                  validator: (value) => AppValidators.validateDropdown(value, "existing school board"),
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
                  showAstreik: true,
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
                  validator: (value) => AppValidators.validateDropdown(value, "existing school grade"),
                );
              }
            }
          ),
          if((enquiryDetailArgs?.enquiryType??"") == "PSA")...[
            const SizedBox(height: 20,),
            psaDetails()
          ],
          if((enquiryDetailArgs?.enquiryType??"") == "IVT")...[
            const SizedBox(height: 20,),
            ivtDetails()
          ],
          const SizedBox(height: 20,),
          CommonTextFormField(
            showAstreik: false,
            labelText: "Parent Type",
            readOnly: true,
            controller: model.parentTypeController,
          ),
          const SizedBox(height: 20,),
          CommonTextFormField(
            showAstreik: false,
            labelText: 'Gloabal ID',
            readOnly: true,
            controller: model.globalIdController,
          ),
          const SizedBox(height: 50,),   
        ],
      ),
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
                validator: (value) => AppValidators.validateDropdown(value, "PSA sub type"),
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
                validator: (value) => AppValidators.validateDropdown(value, "PSA category"),
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
                validator: (value) => AppValidators.validateDropdown(value, "PSA sub category"),
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
                validator: (value) => AppValidators.validateDropdown(value, "period of service"),
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
                validator: (value) => AppValidators.validateDropdown(value, "PSA batch"),
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
                validator: (value) => AppValidators.validateDropdown(value, "board"),
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
                validator: (value) => AppValidators.validateDropdown(value, "course"),
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
                validator: (value) => AppValidators.validateDropdown(value, "stream"),
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
                validator: (value) => AppValidators.validateDropdown(value, "shift"),
              );
            }
          }
        ),
      ],
    );
  }
}
