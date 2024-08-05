import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class UploadDocs extends StatelessWidget {
  const UploadDocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Documents",
                style: AppTypography.subtitle2,
              ),
              CommonText(
                text: 'Action',
                style: AppTypography.subtitle2,
              ),
            ],
          ),
        ),
        documentsNameAndIcons('*Aadhaar Card of Student'),
        documentsNameAndIcons('*Birth Certificate of Student'),
        documentsNameAndIcons('Report Card (Previous Year)'),
        documentsNameAndIcons('Report Card [Previous Year (-) 1]'),
      ],
    );
  }

  Widget documentsNameAndIcons(String title) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 10, width: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: title,
              style: AppTypography.subtitle2,
            ),
            Row(
              children: [
                const Icon(Icons.cloud_upload_outlined),
                CommonSizedBox.sizedBox(height: 5, width: 8),
                const Icon(Icons.cloud_download_outlined),
                CommonSizedBox.sizedBox(height: 5, width: 8),
                const Icon(Icons.delete_outlined),
              ],
            )
          ],
        ),
      ],
    );
  }
}
