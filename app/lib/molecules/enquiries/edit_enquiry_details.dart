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
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Enquiry Type",
          readOnly: true,
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
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Student Last Name",
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
            isMutiSelect: false,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "DOB",
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
            onSingleSelect: (selectedValue) {
              if (model.existingSchoolGrade.contains(selectedValue)) {
                model.selectedExistingSchoolGrade.add(true);
              }
            },
            isMutiSelect: false,
          ),
        ),
        if(psaDetail!=null)...[
          const SizedBox(height: 20,),
          psaDetails()
        ],
        if(ivtDetail!= null)...[
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
        ),
        const SizedBox(height: 20,),
        
      ],
    );
  }

  Widget psaDetails(){
    return const Column(
      children: [
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Sub Type',
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Category',
        ),
         SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA Sub Category',
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Period of service',
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'PSA batch',
        ),
      ],
    );
  }

  Widget ivtDetails(){
    return const Column(
      children: [
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Board',
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Course',
        ),
         SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Stream',
        ),
        SizedBox(height: 20,),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Shift',
        ),
      ],
    );
  }
}
