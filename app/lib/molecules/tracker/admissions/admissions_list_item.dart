import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem extends StatelessWidget {
  final String image;
  final String name;
  final String year;
  final String id;
  final String title;
  final String subtitle;
  final String buttontext;
  final String compeletion;
  final String status;
  final bool isClosed;
  const ListItem(
      {super.key,
      required this.image,
      required this.name,
      required this.year,
      required this.id,
      required this.title,
      required this.subtitle,
      required this.buttontext,
      required this.compeletion,
      required this.status,
      this.isClosed = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32.h,
                    width: 32.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColors.textGray),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(image),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    width: 0.4.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text.rich(
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$name ',
                                style: AppTypography.caption.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textDark,
                                ),
                              ),
                              TextSpan(
                                text: year,
                                style: AppTypography.overline
                                    .copyWith(color: AppColors.textGray),
                              ),
                            ],
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 2, width: 5),
                        CommonText(
                            text: id,
                            softWrap: true,
                            style: AppTypography.smallCaption.copyWith(
                                color: AppColors.textGray,
                                letterSpacing: 0.25)),
                        CommonSizedBox.sizedBox(height: 2, width: 5),
                        CommonText(
                            text: title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: AppTypography.smallCaption.copyWith(
                                color: AppColors.textGray,
                                letterSpacing: 0.25)),
                        CommonSizedBox.sizedBox(height: 2, width: 5),
                        CommonText(
                            text: subtitle,
                            style: AppTypography.smallCaption.copyWith(
                              color: AppColors.textGray,
                              letterSpacing: 0.25,
                            )),
                        CommonText(
                            text: "Status: $status",
                            style: AppTypography.smallCaption.copyWith(
                              color: AppColors.textGray,
                              letterSpacing: 0.25,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isClosed
                          ? AppColors.success
                          : AppColors.primaryLighter,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: CommonText(
                      text: buttontext,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppTypography.body2.copyWith(
                        color: isClosed
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  CommonSizedBox.sizedBox(height: 8, width: 10),
                  CommonText(
                    text: compeletion,
                    style: AppTypography.smallCaption
                        .copyWith(color: AppColors.success),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffE0E0E0),
        ),
      ],
    );
  }
}
