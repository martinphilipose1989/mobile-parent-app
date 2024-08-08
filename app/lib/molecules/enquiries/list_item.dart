import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatelessWidget {
  final String image;
  final String name;
  final String year;
  final String id;
  final String title;
  final String subtitle;
  final String buttontext;
  const ListItem({super.key, required this.image, required this.name, required this.year, required this.id, required this.title, required this.subtitle, required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1,color: AppColors.textGray),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(image),
                  ),
                ),
                const SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: name,
                            style: AppTypography.caption.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textDark,
                            ),
                          ),
                          TextSpan(
                            text: year,
                            style: AppTypography.overline.copyWith(
                                color: AppColors.textGray
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonText(text: id,
                        style: AppTypography.overline.copyWith(
                            color: AppColors.textGray,
                            letterSpacing: 0.25
                        )
                    ),
                    CommonText(text: title,
                        style: AppTypography.overline.copyWith(
                            color: AppColors.textGray,
                            letterSpacing: 0.25
                        )
                    ),
                    CommonText(text: subtitle,
                        style: AppTypography.overline.copyWith(
                          color: AppColors.textGray,
                          letterSpacing: 0.25,
                        )
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryLighter,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CommonText(
                    text: buttontext,
                    style: AppTypography.overline.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                        letterSpacing: 0
                    )
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffE0E0E0),
        ),
      ],
    );
  }
}