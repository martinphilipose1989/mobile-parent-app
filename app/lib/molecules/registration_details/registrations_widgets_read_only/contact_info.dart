import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContactDetail extends StatelessWidget {
  ContactDetails? contactDetail;
  ContactDetail({super.key , this.contactDetail});
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
              text: "Emergency Contact",
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
                    DetailsItem(title: "Contact No. Of", subtitle: contactDetail?.pointOfContact?.firstPreference?.emailOfParent??'N/A'),
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
              text: "Point Of Contact",
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
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    Column(
                      children: [
                        Column(
                          children: [
                            const CommonText(
                              text: 'Preference 1',
                              style: AppTypography.body2,
                            ),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                            DetailsItem(
                                title: "Parent Type",
                                subtitle: contactDetail?.pointOfContact?.firstPreference?.mobileOfParent??'N/A'
                            ),
                            DetailsItem(
                                title: "Parent Mobile Number",
                                subtitle: contactDetail?.pointOfContact?.firstPreference?.mobile ??'N/A'
                            ),
                            DetailsItem(
                              title: "Parent Type",
                              subtitle: contactDetail?.pointOfContact?.firstPreference?.emailOfParent ??'N/A'
                            ),
                            DetailsItem(
                                title: "Parent Email ID",
                                subtitle: contactDetail?.pointOfContact?.firstPreference?.email ??'N/A'
                            ),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                          ],
                        ),
                        Column(
                          children: [
                            const CommonText(
                              text: 'Preference 2',
                              style: AppTypography.body2,
                            ),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                            DetailsItem(
                                title: "Parent Type",
                                subtitle: contactDetail?.pointOfContact
                                        ?.secondPreference?.mobileOfParent ??
                                    'N/A'),
                            DetailsItem(
                                title: "Parent Mobile Number",
                                subtitle: contactDetail?.pointOfContact
                                        ?.secondPreference?.mobile ??
                                    'N/A'),
                            DetailsItem(
                                title: "Parent Type",
                                subtitle: contactDetail?.pointOfContact
                                        ?.secondPreference?.emailOfParent ??
                                    'N/A'),
                            DetailsItem(
                                title: "Parent Email ID",
                                subtitle: contactDetail?.pointOfContact
                                        ?.secondPreference?.email ??
                                    'N/A'),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                          ],
                        )
                      ]
                  ),
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
              text: "Residential Details",
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
                    DetailsItem(title: "House No./Building", subtitle: contactDetail?.residentialAddress?.currentAddress?.house??'N/A'),
                    DetailsItem(
                        title: "Street Name", subtitle: contactDetail?.residentialAddress?.currentAddress?.street??'N/A'),
                    DetailsItem(
                        title: "Landmark", subtitle: contactDetail?.residentialAddress?.currentAddress?.landmark??'N/A'),
                    DetailsItem(title: "Country", subtitle: (contactDetail?.residentialAddress?.currentAddress?.country is String) ? contactDetail?.residentialAddress?.currentAddress?.country : contactDetail?.residentialAddress?.currentAddress?.country?.value??'N/A'),
                    DetailsItem(title: "State", subtitle:(contactDetail?.residentialAddress?.currentAddress?.state is String) ? contactDetail?.residentialAddress?.currentAddress?.state : contactDetail?.residentialAddress?.currentAddress?.state?.value??'N/A'),
                    DetailsItem(title: "City", subtitle: (contactDetail?.residentialAddress?.currentAddress?.city is String) ? contactDetail?.residentialAddress?.currentAddress?.city : contactDetail?.residentialAddress?.currentAddress?.city?.value??'N/A'),
                    DetailsItem(title: "Pin Code", subtitle: contactDetail?.residentialAddress?.currentAddress?.pinCode??'N/A'),
                    // DetailsItem(
                    //     title: "Is Permanent Address Same As Present?",
                    //     subtitle: (contactDetail?.residentialAddress?.isPermanentAddress??''.toLowerCase()) == 'yes' ? "Yes":"No"),
                  ],
                ),
              )
            ]),
      ),
    ]);
  }
}
