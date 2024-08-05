import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class AdmissionsList extends StatelessWidget {
  const AdmissionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 16, right: 16),
            child: Container(
              height: 128,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.listItem,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        color: AppColors.disableNeutral80,
                        offset: Offset(0, 1))
                  ]),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.admissionsDetails);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListItem(
                        image: AppImages.personIcon,
                        name: "Khevna Shah ",
                        year: "(AY 2024-2025)",
                        id: "ENADMS#4402",
                        title: "Vibgyor Kids & High - Malad West",
                        subtitle: "Grade V | CBSE",
                        buttontext: "School Visit",
                        compeletion: '25% Completed',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonText(
                        text: "School Visit scheduled on 18th July 10:30 AM",
                        style: AppTypography.caption.copyWith(
                            color: AppColors.primary, letterSpacing: 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
