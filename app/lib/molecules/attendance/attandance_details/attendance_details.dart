import 'package:app/molecules/attendance/attandance_details/student_details.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceDetails extends StatelessWidget {
  final String date;
  final String name;
  final String? schoolName;
  final String? boardName;
  final String? grade;
  final String? shift;
  final String? division;
  final String? stream;
  final String? course;
  final String? house;
  final String? image;
  const AttendanceDetails(
      {super.key,
      required this.date,
      required this.name,
      this.stream,
      this.division,
      this.shift,
      this.boardName,
      this.image,
      this.schoolName,
      this.course,
      this.grade,
      this.house});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentDetails(
            image: image,
            name: name,
            title: "$schoolName|$boardName",
            subtitle: "$course| $shift| $division| $house | $grade",
            subtitle2: "stream:$stream "),
        const SizedBox(height: 20, width: double.infinity),
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
