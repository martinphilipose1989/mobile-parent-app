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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      DetailsItem(title: "IFSC Code", subtitle:bankDetails?.ifscCode??"N/A"),
                      DetailsItem(
                          title: "Bank Name", subtitle: bankDetails?.bankName??''),
                      DetailsItem(title: "Branch Name", subtitle: bankDetails?.branchName??'N/A'),
                      DetailsItem(
                          title: "Account Holder name", subtitle: bankDetails?.accountHolderName??'N/A'),
                      DetailsItem(title: "Account Type", subtitle: bankDetails?.accountType??'N/A'),
                      DetailsItem(
                          title: "Account Number", subtitle: bankDetails?.accountNumber??'N/A'),
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
 CommonText(
          text: "UPI Info",
          style: AppTypography.subtitle1,
        ),
        DetailsItem(title: 'UPI Id', subtitle: bankDetails?.upiInfo??'N/A')
      ],
    );
  }
}
