import 'package:app/molecules/attendance/attandance_details/student_details.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes_setup.dart';
import '../../../utils/app_typography.dart';
import '../../../utils/common_widgets/app_images.dart';

class AttendanceDetails extends StatelessWidget {
  final String date;
  const AttendanceDetails({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StudentDetails(
            image: AppImages.personIcon,
            name: "Khevna Shah",
            title: "vibgyor Schools|cbse",
            subtitle: "regular| shift| Grade V",
            subtitle2: "Stream|NA"),
        SizedBox(height: 20, width: double.infinity),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Date : ",
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textDark,
                      ),
                    ),
                    TextSpan(
                      text: date,
                      style: AppTypography.overline.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              CommonText(
                text: "View Notes",
                style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontSize: 14),
              )
            ],
          ),
        )
      ],
    );
  }
}
