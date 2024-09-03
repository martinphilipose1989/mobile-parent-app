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
                    DetailsItem(title: "Contact No. Of", subtitle: (contactDetail?.emergencyContact is EmergencyContact)? contactDetail?.emergencyContact.emergencyContact: contactDetail?.emergencyContact),
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
                      children: List.generate((contactDetail?.pointOfContact??[]).length,
                       (index) => Column(
                        children: [
                          CommonText(
                            text: 'Preference ${index+1}',
                            style: AppTypography.body2,
                          ),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                          DetailsItem(title: "Parent Type", subtitle: contactDetail?.pointOfContact?[index].parentType??''),
                          DetailsItem(
                            title: "Parent Mobile Number", subtitle: contactDetail?.pointOfContact?[index].parentContactNumber??''),
                          DetailsItem(
                            title: "Parent Email ID", subtitle: contactDetail?.pointOfContact?[index].parentEmailId??''),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                        ],
                      )
                    ),
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
                    DetailsItem(title: "House No./Building", subtitle: contactDetail?.residentialAddress?.house??''),
                    DetailsItem(
                        title: "Street Name", subtitle: contactDetail?.residentialAddress?.street??''),
                    DetailsItem(
                        title: "Landmark", subtitle: contactDetail?.residentialAddress?.landmark??''),
                    DetailsItem(title: "Country", subtitle: (contactDetail?.residentialAddress?.country is String) ? contactDetail?.residentialAddress?.country : contactDetail?.residentialAddress?.country?.value??''),
                    DetailsItem(title: "State", subtitle:(contactDetail?.residentialAddress?.state is String) ? contactDetail?.residentialAddress?.state : contactDetail?.residentialAddress?.state?.value??''),
                    DetailsItem(title: "City", subtitle: (contactDetail?.residentialAddress?.city is String) ? contactDetail?.residentialAddress?.city : contactDetail?.residentialAddress?.city?.value??''),
                    DetailsItem(title: "Pin Code", subtitle: contactDetail?.residentialAddress?.pinCode??''),
                    DetailsItem(
                        title: "Is Permanent Address Same As Present?",
                        subtitle: contactDetail?.residentialAddress?.isPermanentAddress??false ? "Yes":"No"),
                  ],
                ),
              )
            ]),
      ),
    ]);
  }
}
