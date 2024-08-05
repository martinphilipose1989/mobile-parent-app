import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentInfo extends StatelessWidget {
  const ParentInfo({super.key});
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
              text: "Father's Details",
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
                    DetailsItem(
                        title: "Father's First Name", subtitle: 'Ashok'),
                    DetailsItem(title: "Father's Last Name", subtitle: 'Shah'),
                    DetailsItem(
                        title: "Father's Adhar Card No",
                        subtitle: '897867564534'),
                    DetailsItem(
                        title: "Father's Pan Card No", subtitle: 'PPOUS9887N'),
                    DetailsItem(title: "Qualification", subtitle: 'Bsc'),
                    DetailsItem(title: "occupation", subtitle: 'Business'),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: 'ABCD Technologies'),
                    DetailsItem(title: "Designation", subtitle: 'CEO'),
                    DetailsItem(
                        title: "Office Address",
                        subtitle: '12th, savarkar street'),
                    DetailsItem(title: "Area", subtitle: 'Bandra'),
                    DetailsItem(title: "Country", subtitle: 'India'),
                    DetailsItem(title: "Pin Code", subtitle: '12321'),
                    DetailsItem(title: "State", subtitle: 'Maharashtra'),
                    DetailsItem(title: "City", subtitle: 'Mumbai'),
                    DetailsItem(
                        title: "Father's Email Id",
                        subtitle: 'Ashok12@Gmail.Com'),
                    DetailsItem(
                        title: "Father's Mobile No", subtitle: '7865432178'),
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
              text: "Mother's Details",
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
                    DetailsItem(
                        title: "Mother's First Name", subtitle: 'Jyotika'),
                    DetailsItem(title: "Mother's Last Name", subtitle: 'Shah'),
                    DetailsItem(
                        title: "Mother's Adhar Card No",
                        subtitle: '897867564534'),
                    DetailsItem(
                        title: "Mother's Pan Card No", subtitle: 'PPOUS9887N'),
                    DetailsItem(title: "Qualification", subtitle: 'Bsc'),
                    DetailsItem(title: "occupation", subtitle: 'Engineer'),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: 'ABCD Technologies'),
                    DetailsItem(title: "Designation", subtitle: 'CEO'),
                    DetailsItem(
                        title: "Office Address",
                        subtitle: '12th, savarkar street'),
                    DetailsItem(title: "Area", subtitle: 'Bandra'),
                    DetailsItem(title: "Country", subtitle: 'India'),
                    DetailsItem(title: "Pin Code", subtitle: '12321'),
                    DetailsItem(title: "State", subtitle: 'Maharashtra'),
                    DetailsItem(title: "City", subtitle: 'Mumbai'),
                    DetailsItem(
                        title: "Mother's Email Id",
                        subtitle: 'Ashok12@Gmail  .Com'),
                    DetailsItem(
                        title: "Mother's Mobile No", subtitle: '7865432178'),
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
              text: "Gurdian's Details",
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
                    DetailsItem(
                        title: "Gurdian's First Name", subtitle: 'Maulika'),
                    DetailsItem(title: "Gurdian's Last Name", subtitle: 'Shah'),
                    DetailsItem(
                        title: "Gurdian's Adhar Card No",
                        subtitle: '897867564534'),
                    DetailsItem(
                        title: "Gurdian's Pan Card No", subtitle: 'PPOUS9887N'),
                    DetailsItem(
                        title: "Relationship with child", subtitle: 'Aunty'),
                    DetailsItem(title: "House No./Building", subtitle: '334'),
                    DetailsItem(title: "Street Name", subtitle: 'HSBC Road'),
                    DetailsItem(
                        title: "Landmark", subtitle: 'opposite Antelia'),
                    DetailsItem(title: "Country", subtitle: 'India'),
                    DetailsItem(title: "Pin Code", subtitle: '12321'),
                    DetailsItem(title: "State", subtitle: 'Maharashtra'),
                    DetailsItem(title: "City", subtitle: 'Mumbai'),
                    DetailsItem(
                        title: "Gurdian's Email Id",
                        subtitle: 'Milu12@Gmail  .Com'),
                    DetailsItem(
                        title: "Gurdian's Mobile No", subtitle: '7865432178'),
                    DetailsItem(
                        title: "This Guardian is also a",
                        subtitle: 'Custodian Guardian'),
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
              text: "Sibling's Details",
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
                    const CommonText(
                      text: 'For Sibling 1',
                      style: AppTypography.subtitle2,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    const DetailsItem(
                        title: "Is Sibling", subtitle: 'Vibgyor Student'),
                    DetailsItem(
                        title: "Enrolment Number", subtitle: 'EMBA1234'),
                    DetailsItem(
                        title: "Sibling First Name", subtitle: 'Anjali'),
                    DetailsItem(title: "Sibling Last Name", subtitle: 'Shah'),
                    DetailsItem(title: "DOB", subtitle: '09/09/2000'),
                    DetailsItem(title: "Gender", subtitle: 'Female'),
                    DetailsItem(title: "School", subtitle: 'St. Dominic'),
                    DetailsItem(title: "Grade", subtitle: 'X'),
                  ],
                ),
              )
            ]),
      ),
      DetailsItem(title: "Are Parent's Seprated", subtitle: "Yes"),
      DetailsItem(
          title: "Who Haas The Custody of the Child?", subtitle: "Mother")
    ]);
  }
}
