import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class UploadDocs extends StatelessWidget {
  EnquiryDetail? enquiryDetail;
  UploadDocs({super.key, this.enquiryDetail});

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
        Column(
          children: List.generate((enquiryDetail?.enquiryDocuments??[]).length, (intdex)=> documentsNameAndIcons(enquiryDetail?.enquiryDocuments?[intdex].documentName??'')),
        ),
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
            Expanded(
              flex: 2,
              child: CommonText(
                text: title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.subtitle2,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Icon(Icons.cloud_upload_outlined),
                  CommonSizedBox.sizedBox(height: 5, width: 8),
                  const Icon(Icons.cloud_download_outlined),
                  CommonSizedBox.sizedBox(height: 5, width: 8),
                  const Icon(Icons.delete_outlined),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
