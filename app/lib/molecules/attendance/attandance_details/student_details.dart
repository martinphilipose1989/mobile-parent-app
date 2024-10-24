import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes_setup.dart';
import '../../../utils/app_typography.dart';
import '../../../utils/common_widgets/common_sizedbox.dart';

class StudentDetails extends StatelessWidget {
  final String image;
  final String name;
  final String? title;
 final String? subtitle;
 final String? subtitle2;

 StudentDetails(
      {super.key,
      required this.image,
      required this.name,
 this.title,
 this.subtitle,
this.subtitle2});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.listItem,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  color: AppColors.disableNeutral80,
                  offset: Offset(0, 1))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: name,
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
                CommonText(
                    text: title??"",
                    style: AppTypography.smallCaption.copyWith(
                        color: AppColors.textGray, letterSpacing: 0.25,)),
                CommonSizedBox.sizedBox(height: 2, width: 5),
                CommonText(
                    text: subtitle??"",
                    style: AppTypography.smallCaption.copyWith(
                        color: AppColors.textGray, letterSpacing: 0.25,)),
                CommonSizedBox.sizedBox(height: 2, width: 5),
                CommonText(
                    text: subtitle??"",
                    style: AppTypography.smallCaption.copyWith(
                        color: AppColors.textGray, letterSpacing: 0.25,)),
                CommonSizedBox.sizedBox(height: 2, width: 5),
              ],
            ),
          ]),
        ));
  }
}
