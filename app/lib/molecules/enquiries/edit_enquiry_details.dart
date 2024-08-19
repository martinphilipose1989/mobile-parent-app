import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'School Location',
            showAstreik: true,
            showBorderColor: true,
            singleSelectItemSubject: model.selectedSchoolLocationSubject,
            items: model.schoolLocationTypes,
            onSingleSelect: (selectedValue) {
              if (model.schoolLocationTypes.contains(selectedValue)) {
                model.selectedSchoolLocationType.add(true);
              }
            },
            isMutiSelect: false,
          ),
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
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Grade',
            showAstreik: true,
            showBorderColor: true,
            items: model.gradeTypes,
            onSingleSelect: (selectedValue) {
              if (model.gradeTypes.contains(selectedValue)) {
                model.selectedGradeType.add(true);
              }
            },
            singleSelectItemSubject: model.selectedGradeSubject,
            isMutiSelect: false,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "DOB",
          controller: model.dobController,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Gender',
            showAstreik: true,
            showBorderColor: true,
            items: model.gender,
            singleSelectItemSubject: model.selectedGenderSubject,
            onSingleSelect: (selectedValue) {
              if (model.gender.contains(selectedValue)) {
                model.selectedGenerType.add(true);
              }
            },
            isMutiSelect: false,
          ),
        ),
        const SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Existing School Name',
          controller: model.existingSchoolNameController,
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Existing School Board',
            showAstreik: true,
            showBorderColor: true,
            items: model.existingSchoolBoard,
            singleSelectItemSubject: model.selectedExistingSchoolBoardSubject,
            onSingleSelect: (selectedValue) {
              if (model.existingSchoolBoard.contains(selectedValue)) {
                model.selectedExistingSchoolBoard.add(true);
              }
            },
            isMutiSelect: false,
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 48,
          child: CustomDropdownButton(
            width: MediaQuery.of(context).size.width,
            onMultiSelect: (selectedValues) {},
            dropdownName: 'Existing School Grade',
            showAstreik: true,
            showBorderColor: true,
            items: model.existingSchoolGrade,
            singleSelectItemSubject: model.selectedExistingSchoolGradeSubject,
            onSingleSelect: (selectedValue) {
              if (model.existingSchoolGrade.contains(selectedValue)) {
                model.selectedExistingSchoolGrade.add(true);
              }
            },
            isMutiSelect: false,
          ),
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
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Sub Type',
          controller: model.psaSubTypeController,
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Category',
          controller: model.psaCategoryController,
        ),
         SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Sub Category',
          controller: model.psaSubCategoryController,
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Period of service',
          controller: model.periodOfServiceController,
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA batch',
          controller: model.psaBatchController,
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
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Course',
          controller: model.ivtCourseController,
        ),
         SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Stream',
          controller: model.ivtStreamController,
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Shift',
          controller: model.ivtShiftController,
        ),
      ],
    );
  }
}
