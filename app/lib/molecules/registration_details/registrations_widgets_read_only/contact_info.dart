import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});
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
                    DetailsItem(title: "Contact No. Of", subtitle: 'Mother'),
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
                    const CommonText(
                      text: 'Preference 1',
                      style: AppTypography.body2,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    DetailsItem(title: "Parent Type", subtitle: 'Mother'),
                    DetailsItem(
                        title: "Parent Mobile Number", subtitle: '9876543212'),
                    DetailsItem(title: "Parent Type", subtitle: 'Mother'),
                    DetailsItem(
                        title: "Parent Email ID", subtitle: 'milu@gmail.com'),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    const CommonText(
                      text: 'Preference 2',
                      style: AppTypography.body2,
                    ),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    DetailsItem(title: "Parent Type", subtitle: 'Mother'),
                    DetailsItem(
                        title: "Parent Mobile Number", subtitle: '9876543212'),
                    DetailsItem(title: "Parent Type", subtitle: 'Father'),
                    DetailsItem(
                        title: "Parent Email ID",
                        subtitle: 'Shahashok@gmail.com'),
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
                    DetailsItem(title: "House No./Building", subtitle: '35'),
                    DetailsItem(
                        title: "Street Name", subtitle: 'JhunJhun Gali'),
                    DetailsItem(
                        title: "Landmark", subtitle: 'Near Post Office'),
                    DetailsItem(title: "Country", subtitle: 'India'),
                    DetailsItem(title: "State", subtitle: 'Maharashtra'),
                    DetailsItem(title: "City", subtitle: 'Mumbai'),
                    DetailsItem(title: "Pin Code", subtitle: '12321'),
                    DetailsItem(
                        title: "Is Permanent Address Same As Present?",
                        subtitle: 'Yes'),
                  ],
                ),
              )
            ]),
      ),
    ]);
  }
}
