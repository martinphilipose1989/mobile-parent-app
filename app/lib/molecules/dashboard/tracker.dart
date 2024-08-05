import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryLighter),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CommonText(
              text: "Tracker",
              style: AppTypography.subtitle1,
            ),
            const SizedBox(
              width: 10,
            ),
            commonBox(
                title: "Enquiry",
                icon: AppImages.enquiryIcon,
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePaths.enquiriesPage);
                }),
            const SizedBox(
              width: 10,
            ),
            commonBox(
                title: "Admission",
                icon: AppImages.admissionIcon,
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.trackerAdmissions);
                }),
          ],
        ),
      ),
    );
  }

  Widget commonBox(
      {required String title,
      required String icon,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: const Color(0xff666666)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 5,
              ),
              CommonText(
                text: title,
                style: AppTypography.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
