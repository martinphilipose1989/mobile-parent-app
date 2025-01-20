import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentDetail extends StatelessWidget {
  final ParentInfo? parentInfo;
  const ParentDetail({super.key, this.parentInfo});
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
            title: CommonText(
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
                        title: "Father's First Name",
                        subtitle:
                            parentInfo?.fatherDetails?.firstName ?? 'N/A'),
                    DetailsItem(
                        title: "Father's Last Name",
                        subtitle: parentInfo?.fatherDetails?.lastName ?? 'N/A'),
                    DetailsItem(
                        title: "Father's Aadhar Card No",
                        subtitle:
                            parentInfo?.fatherDetails?.aadharNumber ?? ''),
                    DetailsItem(
                        title: "Father's Pan Card No",
                        subtitle:
                            parentInfo?.fatherDetails?.panNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Qualification",
                        subtitle: (parentInfo?.fatherDetails?.qualification
                                is CommonDataClass)
                            ? parentInfo?.fatherDetails?.qualification?.value ??
                                'N/A'
                            : parentInfo?.fatherDetails?.qualification ??
                                'N/A'),
                    DetailsItem(
                        title: "occupation",
                        subtitle: (parentInfo?.fatherDetails?.occupation
                                is CommonDataClass)
                            ? parentInfo?.fatherDetails?.occupation?.value ??
                                'N/A'
                            : parentInfo?.fatherDetails?.occupation ?? 'N/A'),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: (parentInfo?.fatherDetails?.organisationName
                                is CommonDataClass)
                            ? parentInfo
                                    ?.fatherDetails?.organisationName?.value ??
                                'N/A'
                            : parentInfo?.fatherDetails?.organisationName ??
                                'N/A'),
                    DetailsItem(
                        title: "Designation",
                        subtitle: (parentInfo?.fatherDetails?.designationName
                                is CommonDataClass)
                            ? parentInfo
                                    ?.fatherDetails?.designationName?.value ??
                                'N/A'
                            : parentInfo?.fatherDetails?.designationName ??
                                'N/A'),
                    DetailsItem(
                        title: "Office Address",
                        subtitle:
                            parentInfo?.fatherDetails?.officeAddress ?? 'N/A'),
                    DetailsItem(
                        title: "Area",
                        subtitle: parentInfo?.fatherDetails?.area ?? 'N/A'),
                    DetailsItem(
                        title: "Country",
                        subtitle: (parentInfo?.fatherDetails?.country is String)
                            ? parentInfo?.fatherDetails?.country
                            : parentInfo?.fatherDetails?.country?.value ??
                                'N/A'),
                    DetailsItem(
                        title: "Pin Code",
                        subtitle: parentInfo?.fatherDetails?.pinCode ?? 'N/A'),
                    DetailsItem(
                        title: "State",
                        subtitle: (parentInfo?.fatherDetails?.state is String)
                            ? parentInfo?.fatherDetails?.state
                            : parentInfo?.fatherDetails?.state?.value ?? 'N/A'),
                    DetailsItem(
                        title: "City",
                        subtitle: (parentInfo?.fatherDetails?.city is String)
                            ? parentInfo?.fatherDetails?.city
                            : parentInfo?.fatherDetails?.city?.value ?? 'N/A'),
                    DetailsItem(
                        title: "Father's Email Id",
                        subtitle: parentInfo?.fatherDetails?.emailId ?? 'N/A'),
                    DetailsItem(
                        title: "Father's Mobile No",
                        subtitle:
                            parentInfo?.fatherDetails?.mobileNumber ?? 'N/A'),
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
            title: CommonText(
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
                        title: "Mother's First Name",
                        subtitle:
                            parentInfo?.motherDetails?.firstName ?? 'N/A'),
                    DetailsItem(
                        title: "Mother's Last Name",
                        subtitle: parentInfo?.motherDetails?.lastName ?? 'N/A'),
                    DetailsItem(
                        title: "Mother's Aadhar Card No",
                        subtitle:
                            parentInfo?.motherDetails?.aadharNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Mother's Pan Card No",
                        subtitle:
                            parentInfo?.motherDetails?.panNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Qualification",
                        subtitle: (parentInfo?.motherDetails?.qualification
                                is CommonDataClass)
                            ? parentInfo?.motherDetails?.qualification?.value ??
                                'N/A'
                            : parentInfo?.motherDetails?.qualification ??
                                'N/A'),
                    DetailsItem(
                        title: "Occupation",
                        subtitle: (parentInfo?.motherDetails?.occupation
                                is CommonDataClass)
                            ? parentInfo?.motherDetails?.occupation?.value ??
                                'N/A'
                            : parentInfo?.motherDetails?.occupation ?? 'N/A'),
                    DetailsItem(
                        title: "Organisation Name",
                        subtitle: (parentInfo?.motherDetails?.organisationName
                                is CommonDataClass)
                            ? parentInfo
                                    ?.motherDetails?.organisationName?.value ??
                                'N/A'
                            : parentInfo?.motherDetails?.organisationName ??
                                'N/A'),
                    DetailsItem(
                        title: "Designation",
                        subtitle: (parentInfo?.motherDetails?.designationName
                                is CommonDataClass)
                            ? parentInfo
                                    ?.motherDetails?.designationName?.value ??
                                'N/A'
                            : parentInfo?.motherDetails?.designationName ??
                                'N/A'),
                    DetailsItem(
                        title: "Office Address",
                        subtitle:
                            parentInfo?.motherDetails?.officeAddress ?? 'N/A'),
                    DetailsItem(
                        title: "Area",
                        subtitle: parentInfo?.motherDetails?.area ?? 'N/A'),
                    DetailsItem(
                        title: "Country",
                        subtitle: (parentInfo?.motherDetails?.country is String)
                            ? parentInfo?.motherDetails?.country
                            : parentInfo?.motherDetails?.country?.value ??
                                'N/A'),
                    DetailsItem(
                        title: "Pin Code",
                        subtitle: parentInfo?.motherDetails?.pinCode ?? 'N/A'),
                    DetailsItem(
                        title: "State",
                        subtitle: (parentInfo?.motherDetails?.state is String)
                            ? parentInfo?.motherDetails?.state
                            : parentInfo?.motherDetails?.state?.value ?? 'N/A'),
                    DetailsItem(
                        title: "City",
                        subtitle: (parentInfo?.fatherDetails?.city is String)
                            ? parentInfo?.motherDetails?.city
                            : parentInfo?.motherDetails?.city?.value ?? 'N/A'),
                    DetailsItem(
                        title: "Mother's Email Id",
                        subtitle: parentInfo?.motherDetails?.emailId ?? 'N/A'),
                    DetailsItem(
                        title: "Mother's Mobile No",
                        subtitle:
                            parentInfo?.motherDetails?.mobileNumber ?? 'N/A'),
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
            title: CommonText(
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
                        title: "Gurdian's First Name",
                        subtitle:
                            parentInfo?.guardianDetails?.firstName ?? 'N/A'),
                    DetailsItem(
                        title: "Gurdian's Last Name",
                        subtitle:
                            parentInfo?.guardianDetails?.lastName ?? 'N/A'),
                    DetailsItem(
                        title: "Gurdian's Aadhar Card No",
                        subtitle:
                            parentInfo?.guardianDetails?.aadharNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Gurdian's Pan Card No",
                        subtitle:
                            parentInfo?.guardianDetails?.panNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Relationship with child",
                        subtitle: (parentInfo
                                ?.guardianDetails?.relationWithChild is String)
                            ? parentInfo?.guardianDetails?.relationWithChild ??
                                'N/A'
                            : parentInfo?.guardianDetails?.relationWithChild
                                    ?.value ??
                                'N/A'),
                    DetailsItem(
                        title: "House No./Building",
                        subtitle:
                            parentInfo?.guardianDetails?.houseNumber ?? 'N/A'),
                    DetailsItem(
                        title: "Street Name",
                        subtitle: parentInfo?.guardianDetails?.street ?? 'N/A'),
                    DetailsItem(
                        title: "Landmark",
                        subtitle:
                            parentInfo?.guardianDetails?.landmark ?? 'N/A'),
                    DetailsItem(
                        title: "Country",
                        subtitle:
                            (parentInfo?.guardianDetails?.country is String)
                                ? parentInfo?.guardianDetails?.country
                                : parentInfo?.guardianDetails?.country?.value ??
                                    ''),
                    DetailsItem(
                        title: "Pin Code",
                        subtitle:
                            parentInfo?.guardianDetails?.pincode ?? 'N/A'),
                    DetailsItem(
                        title: "State",
                        subtitle: (parentInfo?.guardianDetails?.state is String)
                            ? parentInfo?.guardianDetails?.state
                            : parentInfo?.guardianDetails?.state?.value ??
                                'N/A'),
                    DetailsItem(
                        title: "City",
                        subtitle: (parentInfo?.guardianDetails?.city is String)
                            ? parentInfo?.guardianDetails?.city
                            : parentInfo?.guardianDetails?.city?.value ??
                                'N/A'),
                    DetailsItem(
                        title: "Gurdian's Email Id",
                        subtitle:
                            parentInfo?.guardianDetails?.emailId ?? 'N/A'),
                    DetailsItem(
                        title: "Gurdian's Mobile No",
                        subtitle:
                            parentInfo?.guardianDetails?.mobileNumber ?? 'N/A'),
                    DetailsItem(
                        title: "This Guardian is also a",
                        subtitle:
                            parentInfo?.guardianDetails?.guardianType ?? 'N/A'),
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
            title: CommonText(
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
                    CommonText(
                      text: 'For Sibling 1',
                      style: AppTypography.subtitle2,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    DetailsItem(
                        title: "Is Sibling",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].type ?? 'N/A'),
                    DetailsItem(
                        title: "Enrolment Number",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].enrollmentNumber ??
                                'N/A'),
                    DetailsItem(
                        title: "Sibling First Name",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].firstName ??
                                'N/A'),
                    DetailsItem(
                        title: "Sibling Last Name",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].lastName ?? 'N/A'),
                    DetailsItem(
                        title: "DOB",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : (parentInfo!.siblingDetails![0].isOnlyDOB())
                                ? ""
                                : (parentInfo?.siblingDetails?[0].dob ??
                                    'N/A')),
                    DetailsItem(
                        title: "Gender",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].gender ?? 'N/A'),
                    DetailsItem(
                        title: "School",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].school ?? 'N/A'),
                    DetailsItem(
                        title: "Grade",
                        subtitle: ((parentInfo?.siblingDetails ?? []).isEmpty)
                            ? "N/A"
                            : parentInfo?.siblingDetails?[0].grade ?? 'N/A'),
                  ],
                ),
              )
            ]),
      ),
      DetailsItem(
          title: "Are Parent's Seprated",
          subtitle:
              parentInfo?.childCustodyDetail?.areParentsSeparated ?? 'No'),
      if ((parentInfo?.childCustodyDetail?.areParentsSeparated ?? 'No')
              .toLowerCase() ==
          "yes") ...[
        DetailsItem(
            title: "Who Has The Custody of the Child?",
            subtitle: parentInfo?.childCustodyDetail?.childCustody ?? 'N/A')
      ],
      const SizedBox(
        height: 100,
      )
    ]);
  }
}
