import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes_setup.dart';
import '../../utils/app_typography.dart';
import '../../utils/common_image_widget.dart';
import '../../utils/common_widgets/app_images.dart';
import '../../utils/common_widgets/common_text_widget.dart';

class StudentImageInfo extends StatelessWidget {
  const StudentImageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,

          margin: EdgeInsets.only(
            top: 67.h,
          ),
          child:
          SvgPicture.asset(fit: BoxFit.fitWidth, AppImages.bannerProfile),

          decoration: BoxDecoration(
            // color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.r),
                boxShadow: [AppColors.boxShadow]),
            child: CircleAvatar(
              radius: 52.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 45.r,
                child: ClipOval(
                    child: CommonImageWidget(
                      imageUrl: "avatarImagePath",
                      fallbackAssetImagePath: AppImages.defaultStudentAvatar,
                      imageHeight: 120.r,
                      imageWidth: 120.r,
                    )),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Khevna Shah",
                        style: AppTypography.h5,
                      ),
                      CommonText(
                        text: "En-202023456",
                        style: AppTypography.caption,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    //  width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryOn,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.primary)),
                    padding: EdgeInsets.all(6),
                    child: CommonText(
                      text: "Active",
                      style: AppTypography.caption,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}