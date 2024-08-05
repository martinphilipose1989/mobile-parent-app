import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryAndStudentDetails extends StatelessWidget {
  const EnquiryAndStudentDetails({super.key});

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
        child: const ExpansionTile(
            title: CommonText(
              text: 'Enquiry Details',
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    DetailsItem(
                        title: 'Enquiry Number', subtitle: 'ENAMDMS#4402'),
                    DetailsItem(title: 'Enquiry Date', subtitle: '01/04/2024'),
                    DetailsItem(
                        title: 'Enquiry Type', subtitle: 'New Admission'),
                    DetailsItem(
                        title: 'School location',
                        subtitle: 'Vibgyor kids & high - goregaon west'),
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
        child: const ExpansionTile(
            title: CommonText(
              text: 'Student Details',
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    DetailsItem(
                        title: 'Student First Name', subtitle: 'Khevna'),
                    DetailsItem(title: 'Student Last Name', subtitle: 'Shah'),
                    DetailsItem(title: 'Grade', subtitle: 'Playschool'),
                    DetailsItem(title: 'Gender', subtitle: 'Female'),
                    DetailsItem(title: 'DOB', subtitle: '04/04/2020'),
                    DetailsItem(
                        title: 'Eligible Grade', subtitle: 'Pre-Primay'),
                    DetailsItem(
                        title: 'Student Aadhar no.', subtitle: '987654321879'),
                    DetailsItem(title: 'Parent Type', subtitle: 'Father'),
                    DetailsItem(
                        title: 'Parent Global ID', subtitle: 'GID12345'),
                    DetailsItem(title: 'Parent First Name', subtitle: 'Ashok'),
                    DetailsItem(title: 'Parent Last Name', subtitle: 'Shah'),
                    DetailsItem(
                        title: 'Parent Email Id',
                        subtitle: 'Ashok12@Gmail.com'),
                    DetailsItem(
                        title: 'Parent Mobile No', subtitle: '9876543212'),
                    DetailsItem(title: 'Exisiting School Name', subtitle: 'NA'),
                    DetailsItem(
                        title: 'Exisiting School Board', subtitle: 'NA'),
                    DetailsItem(
                        title: 'Exisiting School Grade', subtitle: 'NA'),
                    DetailsItem(title: 'Place Of Birth', subtitle: 'NA'),
                    DetailsItem(title: 'Religion', subtitle: 'NA'),
                    DetailsItem(title: 'Caste', subtitle: 'NA'),
                    DetailsItem(title: 'Sub Caste', subtitle: 'NA'),
                    DetailsItem(title: 'Nationality', subtitle: 'NA'),
                    DetailsItem(title: 'Mother Tounge', subtitle: 'NA'),
                  ],
                ),
              )
            ]),
      ),
    ]);
  }
}
