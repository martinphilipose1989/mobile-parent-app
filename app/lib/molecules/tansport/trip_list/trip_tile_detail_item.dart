import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class TripTileDetailItem extends StatelessWidget {
  const TripTileDetailItem(
      {super.key,
      required this.title,
      required this.subtitle,
      this.subtitleTextStyle,
      this.titleTextStyle});

  final String title;
  final String subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
            text: title,
            style: titleTextStyle ?? AppTypography.caption,
            color: titleTextStyle?.color ?? AppColors.textGray,
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        subtitle.isEmpty
            ? const SizedBox.shrink()
            : CommonText(
                text: subtitle,
                color: AppColors.textDark,
                style: subtitleTextStyle ?? AppTypography.subtitle2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
