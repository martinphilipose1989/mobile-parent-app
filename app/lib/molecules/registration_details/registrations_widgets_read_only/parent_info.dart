import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentDetail extends StatelessWidget {
  ParentInfo? parentInfo;
  ParentDetail({super.key, this.parentInfo});
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
                        title: "Father's First Name", subtitle: parentInfo?.fatherDetails?.firstName??''),
                    DetailsItem(title: "Father's Last Name", subtitle: parentInfo?.fatherDetails?.lastName??''),
                    DetailsItem(
                        title: "Father's Adhar Card No",
                        subtitle: parentInfo?.fatherDetails?.aadharNumber??''),
                    DetailsItem(
                        title: "Father's Pan Card No", subtitle: parentInfo?.fatherDetails?.panNumber??''),
                    DetailsItem(title: "Qualification", subtitle: parentInfo?.fatherDetails?.qualification??''),
                    DetailsItem(title: "occupation", subtitle: parentInfo?.fatherDetails?.occupation??''),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: parentInfo?.fatherDetails?.organisationName??''),
                    DetailsItem(title: "Designation", subtitle: parentInfo?.fatherDetails?.designationName??''),
                    DetailsItem(
                        title: "Office Address",
                        subtitle: parentInfo?.fatherDetails?.officeAddress??''),
                    DetailsItem(title: "Area", subtitle: parentInfo?.fatherDetails?.area??''),
                    DetailsItem(title: "Country", subtitle: parentInfo?.fatherDetails?.country??''),
                    // DetailsItem(title: "Pin Code", subtitle: parentInfo?.fatherDetails?.),
                    DetailsItem(title: "State", subtitle: parentInfo?.fatherDetails?.state??''),
                    DetailsItem(title: "City", subtitle: parentInfo?.fatherDetails?.city??''),
                    DetailsItem(
                        title: "Father's Email Id",
                        subtitle: parentInfo?.fatherDetails?.emailId??''),
                    DetailsItem(
                        title: "Father's Mobile No", subtitle: parentInfo?.fatherDetails?.mobileNumber??''),
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
                        title: "Mother's First Name", subtitle: parentInfo?.motherDetails?.firstName??''),
                    DetailsItem(title: "Mother's Last Name", subtitle: parentInfo?.motherDetails?.lastName??''),
                    DetailsItem(
                        title: "Mother's Adhar Card No",
                        subtitle: parentInfo?.motherDetails?.aadharNumber??''),
                    DetailsItem(
                        title: "Mother's Pan Card No", subtitle: parentInfo?.motherDetails?.panNumber??''),
                    DetailsItem(title: "Qualification", subtitle: parentInfo?.motherDetails?.qualification??''),
                    DetailsItem(title: "occupation", subtitle: parentInfo?.motherDetails?.occupation??''),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: parentInfo?.motherDetails?.organisationName??''),
                    DetailsItem(title: "Designation", subtitle: parentInfo?.motherDetails?.designationName??''),
                    DetailsItem(
                        title: "Office Address",
                        subtitle: parentInfo?.motherDetails?.officeAddress??''),
                    DetailsItem(title: "Area", subtitle: parentInfo?.motherDetails?.area??''),
                    DetailsItem(title: "Country", subtitle: parentInfo?.motherDetails?.country??''),
                    // DetailsItem(title: "Pin Code", subtitle: parentInfo?.motherDetails?.),
                    DetailsItem(title: "State", subtitle: parentInfo?.motherDetails?.state??''),
                    DetailsItem(title: "City", subtitle: parentInfo?.motherDetails?.city??''),
                    DetailsItem(
                        title: "Mother's Email Id",
                        subtitle: parentInfo?.motherDetails?.emailId??''),
                    DetailsItem(
                        title: "Mother's Mobile No", subtitle: parentInfo?.motherDetails?.mobileNumber??''),
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
                        title: "Gurdian's First Name", subtitle: parentInfo?.guardianDetails?.firstName??''),
                    DetailsItem(title: "Gurdian's Last Name", subtitle: parentInfo?.guardianDetails?.lastName??''),
                    DetailsItem(
                        title: "Gurdian's Adhar Card No",
                        subtitle: parentInfo?.guardianDetails?.aadharNumber??''),
                    DetailsItem(
                        title: "Gurdian's Pan Card No", subtitle: parentInfo?.guardianDetails?.panNumber??''),
                    DetailsItem(
                        title: "Relationship with child", subtitle: parentInfo?.guardianDetails?.relationWithChild??''),
                    DetailsItem(title: "House No./Building", subtitle: parentInfo?.guardianDetails?.houseNumber??''),
                    DetailsItem(title: "Street Name", subtitle: parentInfo?.guardianDetails?.street??''),
                    DetailsItem(
                        title: "Landmark", subtitle: parentInfo?.guardianDetails?.landmark??''),
                    DetailsItem(title: "Country", subtitle: parentInfo?.guardianDetails?.country??''),
                    DetailsItem(title: "Pin Code", subtitle: parentInfo?.guardianDetails?.pincode??''),
                    DetailsItem(title: "State", subtitle: parentInfo?.guardianDetails?.state??''),
                    DetailsItem(title: "City", subtitle: parentInfo?.guardianDetails?.city??''),
                    DetailsItem(
                        title: "Gurdian's Email Id",
                        subtitle: parentInfo?.guardianDetails?.emailId??''),
                    DetailsItem(
                        title: "Gurdian's Mobile No", subtitle: parentInfo?.guardianDetails?.mobileNumber??''),
                    DetailsItem(
                        title: "This Guardian is also a",
                        subtitle: parentInfo?.guardianDetails?.guardianType??''),
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
                        title: "Is Sibling", subtitle: ''),
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
