import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditEnquiriesDetailsWidget extends StatelessWidget {
  EnquiriesDetailsPageModel model;
  EditEnquiriesDetailsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        CommonTextFormField(
          showAstreik: false,
          labelText: "Enquiry Number",
        ),
        SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Enquiry Type",
        ),
        SizedBox(
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
        SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Student First Name",
        ),
        SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "Student Last Name",
        ),
        SizedBox(
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
        SizedBox(
          height: 20,
        ),
        CommonTextFormField(
          showAstreik: true,
          labelText: "DOB",
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
