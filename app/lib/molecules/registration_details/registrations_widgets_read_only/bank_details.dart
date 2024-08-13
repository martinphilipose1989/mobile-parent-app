import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetail extends StatelessWidget {
final BankDetails? bankDetails;
  BankDetail({super.key,required this.bankDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                text: "Bank Details",
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
                      DetailsItem(title: "IFSC COde", subtitle:bankDetails?.ifscCode??""),
                      DetailsItem(
                          title: "Bank Name", subtitle: 'United Bank of india'),
                      DetailsItem(title: "Branch Name", subtitle: 'Parel'),
                      DetailsItem(
                          title: "Account Holder name", subtitle: 'Ashok Shah'),
                      DetailsItem(title: "Account Type", subtitle: 'Saving'),
                      DetailsItem(
                          title: "Account Number", subtitle: '09876543211232'),
                    ],
                  ),
                )
              ]),
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const CommonText(
          text: "UPI Info",
          style: AppTypography.subtitle1,
        ),
        const DetailsItem(title: 'UPI Id', subtitle: 'shahashok@paytm')
      ],
    );
  }
}
