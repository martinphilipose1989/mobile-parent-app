import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class MedicalDetails extends StatelessWidget {
  const MedicalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonText(
          text: "Medical Information",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(
            title: 'Has the child ever been hospitalized?', subtitle: 'Yes'),
        DetailsItem(title: 'Year of last hospitalisation', subtitle: '2023'),
        DetailsItem(
            title: 'The reason for hospitalisation', subtitle: 'Viral Fever'),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Physical Disabilities', subtitle: 'Yes'),
        DetailsItem(title: 'Special Disability', subtitle: 'NA'),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Medical History', subtitle: 'Yes'),
        DetailsItem(title: 'Special Medical History', subtitle: 'NA'),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Allergies', subtitle: 'Yes'),
        DetailsItem(title: 'Special Allergies', subtitle: 'NA'),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Blood Group', subtitle: 'O-'),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Personalized Learning Needs', subtitle: 'Yes'),
        DetailsItem(title: 'Personalized Learning Needs', subtitle: 'Autism'),
      ],
    );
  }
}
