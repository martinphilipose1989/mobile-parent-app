import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Column(
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
          showAstreik: true,
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
              return SizedBox(
              height: 48,
              child: CustomDropdownButton(
                width: MediaQuery.of(context).size.width,
                onMultiSelect: (selectedValues) {},
                dropdownName: 'School Location',
                showAstreik: true,
                showBorderColor: true,
                singleSelectItemSubject: model.selectedSchoolLocationSubject,
                items: snapshot.data??[],
                onSingleSelect: (selectedValue) {
                  if (model.schoolLocationTypes.value.contains(selectedValue)) {
                    model.selectedSchoolLocationType.add(true);
                  }
                },
                isMutiSelect: false,
                ),
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
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Student Last Name",
          controller: model.studentLastNameController,
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Grade',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  onSingleSelect: (selectedValue) {
                    if (model.gradeTypes.value.contains(selectedValue)) {
                      model.selectedGradeType.add(true);
                    }
                  },
                  singleSelectItemSubject: model.selectedGradeSubject,
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "DOB",
          controller: model.dobController,
          readOnly: true,
          onTap: ()async{
            DateTime? dob = await showDatePicker(
              context: context,
              firstDate: DateTime(DateTime.now().year-20,DateTime.now().month,DateTime.now().day),
              lastDate: DateTime.now(),
              barrierDismissible: true
            );
            if(dob!=null){
              model.dobController.text = DateFormat('dd/MM/yyyy').format(dob);
            }
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Gender',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.selectedGenderSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.gender.value.contains(selectedValue)) {
                      model.selectedGenerType.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Existing School Name',
          controller: model.existingSchoolNameController,
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.existingSchoolBoard,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Existing School Board',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.selectedExistingSchoolBoardSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.existingSchoolBoard.value.contains(selectedValue)) {
                      model.selectedExistingSchoolBoard.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Existing School Grade',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.selectedExistingSchoolGradeSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.existingSchoolGrade.value.contains(selectedValue)) {
                      model.selectedExistingSchoolGrade.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Parent Type',
            showAstreik: true,
            showBorderColor: true,
            items: model.parentType,
            singleSelectItemSubject: model.selectedParentTypeSubject,
            onSingleSelect: (selectedValue) {
              if (model.parentType.contains(selectedValue)) {
                model.selectedParentType.add(true);
              }
            },
            isMutiSelect: false,
          ),
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: false,
          labelText: 'Gloabal ID',
          readOnly: true,
          controller: model.globalIdController,
        ),
        const SizedBox(height: 100,),        
      ],
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Sub Type',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaSubTypeSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaSubType.value.contains(selectedValue)) {
                      model.selectedPsaSubType.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Category',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaCategorySubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaCategory.value.contains(selectedValue)) {
                      model.selectedPsaCategory.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Sub Category',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaSubCategorySubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaSubCategory.value.contains(selectedValue)) {
                      model.selectedPsaSubCategory.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Period of service',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.periodOfServiceSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.periodOfService.value.contains(selectedValue)) {
                      model.selectedPeriodOfService.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA batch',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaBatchSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaBatch.value.contains(selectedValue)) {
                      model.selectedPsaBatch.add(true);
                    }
                  },
                  isMutiSelect: false,
                ),
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
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Board',
          controller: model.ivtBoardController,
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Course',
          controller: model.ivtCourseController,
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Stream',
          controller: model.ivtStreamController,
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Shift',
          controller: model.ivtShiftController,
        ),
      ],
    );
  }
}
