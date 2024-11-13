import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentDetailsRowWidget extends StatelessWidget {
  final int? id;
  final String name;
  final String desc;
  final String status;
  final String lname;
  final String image;
  final Function? onPressed;

  const StudentDetailsRowWidget({
    super.key,
    required this.name,
    required this.desc,
    required this.status,
    required this.lname,
    required this.image,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        elevation: 1.0,
        color: AppColors.surface_1,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonImageWidget(
                    imageUrl: image,
                    imageHeight: 40.h,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "$name $lname",
                        style: AppTypography.subtitle2,
                      ),
                      CommonText(text: desc, style: AppTypography.body2)
                    ],
                  ),
                ],
              ),
              CommonElevatedButton(
                  width: 100,
                  onPressed: () => onPressed?.call(),
                  text: status,
                  backgroundColor: AppColors.success)
            ],
          ),
        ),
      ),
    );
  }
}
