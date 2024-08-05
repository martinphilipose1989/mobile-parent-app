import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const DetailsItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
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
