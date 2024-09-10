import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSubjectDetail extends StatelessWidget {
  const SelectSubjectDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Select Subject",
          style: AppTypography.subtitle1.copyWith(color: AppColors.textDark),
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0),
          child: const Divider(color: AppColors.dividerColor),
        ),
        Row(
          children: [
            Expanded(
              child: CommonText(
                text: "Grade",
                style: AppTypography.body2.copyWith(color: AppColors.textGray),
              ),
            ),
            Expanded(
                child: CommonText(
              text: "6",
              textAlign: TextAlign.end,
              style:
                  AppTypography.subtitle2.copyWith(color: AppColors.textDark),
            )),
          ],
        ),
        const SizedBox(height: 16),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: CommonText(
              text: "Compulsory Subject",
              style: AppTypography.body2.copyWith(color: AppColors.textGray),
            ),
          ),
          Expanded(
            child: CommonText(
              text:
                  "Computer, English Language, English Literature, Marathi 3rd Language, Social Studies, Mathematics, Science, Art",
              style:
                  AppTypography.subtitle2.copyWith(color: AppColors.textDark),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: CommonText(
              text: "SPA",
              style: AppTypography.body2.copyWith(color: AppColors.textGray),
            ),
          ),
          Expanded(
            child: CommonText(
              text: "Selection of SPA will be don...",
              style:
                  AppTypography.subtitle2.copyWith(color: AppColors.textDark),
            ),
          ),
        ]),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0),
          child: const Divider(color: AppColors.dividerColor),
        ),
        CommonText(
          text: "Optional Subject",
          style: AppTypography.subtitle2.copyWith(color: AppColors.textDark),
        ),
      ],
    );
  }
}
