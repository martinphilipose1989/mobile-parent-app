import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryAndStudentEditing extends StatelessWidget {
  const EnquiryAndStudentEditing({super.key});

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
                    const CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Enquiry Number',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Enquiry Date',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Enquiry Type',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'School Location',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    )
                  ],
                ),
              )
            ]),
      ),
      //
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
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Student First Name',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Student Last Name',
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
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'DOB',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Eligible Grade',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Student Adhar Number',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Select Parent Type',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Global ID',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Parent First Name',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Parent Last Name',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Parent Email ID',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Parent Mobile Number',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    const CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Exisiting School Name',
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Exisiting School Board',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Exisiting School Grade',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Place Of Birth',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Religion',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Caste',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Sub Caste',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Nationality',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CustomDropdownButton(
                      items: [],
                      width: MediaQuery.of(context).size.width,
                      isMutiSelect: false,
                      dropdownName: 'Mother Tounge',
                      showAstreik: true,
                      onMultiSelect: (selectedValues) {},
                      showBorderColor: true,
                    ),
                  ],
                ),
              )
            ]),
      ),
    ]);
  }
}
