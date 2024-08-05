import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class EnquiriesDetailsViewWidget extends StatelessWidget {
  const EnquiriesDetailsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        _detailItem(title: "Enquiry Number", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Enquiry Type", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "School Location", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Student First Name", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Student Last name", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Grade", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "DOB", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Gender", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Existing School Name", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Existing school board", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Existing school Grade", subtitle: "ENAMDMS#4402"),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: AppColors.textPaleGray,
        ),
        _detailItem(title: "Parent Type", subtitle: "ENAMDMS#4402"),
        _detailItem(title: "Global Id", subtitle: "ENAMDMS#4402"),
      ],
    );
  }

  _detailItem({title, subtitle}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: title,
              style: AppTypography.body2,
            ),
            CommonText(
              text: subtitle,
              style: AppTypography.button,
            ),
          ],
        ),
      ],
    );
  }
}
