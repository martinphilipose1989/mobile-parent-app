import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentDetailsRowWidget extends StatelessWidget {
  final int? id;
  final String? name;
  final String? desc;
  final String? status;
  final String? lname;
  final String? image;
  final Function? onPressed;

  const StudentDetailsRowWidget({
    super.key,
    required this.name,
    required this.desc,
    required this.status,
  this.lname,
    required this.image,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isPresent = status == "Present" || status == "present";
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.roseWhite,
          boxShadow: const [
            BoxShadow(
              color: Color(0x4C4E6438),
              offset: Offset(0, 2), // Horizontal: 0px, Vertical: 2px
              blurRadius: 10, // Blur radius: 10px
              spreadRadius: 0, // Spread radius: 0px
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageWidget(
                  imageUrl: image ?? "",
                  fallbackAssetImagePath: AppImages.defaultStudentAvatar,
                  imageHeight: 40.h,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${name ?? ''} ",
                      style: AppTypography.subtitle2,
                    ),
                    CommonText(text: desc ?? "", style: AppTypography.body2)
                  ],
                ),
              ],
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: CommonElevatedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  text: "${status?[0].toUpperCase()}${status?.substring(1)}" ?? "Absent",
                  textColor: AppColors.primaryOn,
                  backgroundColor:
                      isPresent ? AppColors.success : AppColors.failure),
            )
          ],
        ),
      ),
    );
  }
}
