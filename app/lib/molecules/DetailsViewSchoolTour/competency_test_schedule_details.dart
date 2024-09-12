import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CompetencyTestScheduledDetailsWidget extends StatelessWidget {
  final CompetencyTestDetails competencyTestDetails;
  const CompetencyTestScheduledDetailsWidget({super.key,required this.competencyTestDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: "Test details",style: AppTypography.body1.copyWith(color: AppColors.textDark),),
        const SizedBox(height: 10,),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffE0E0E0),
        ),
        const SizedBox(height: 10,),
        _detailItem(title: "Test Time",subtitle: competencyTestDetails.slot??''),
        const SizedBox(height: 10,),
        _detailItem(title: "Mode",subtitle: competencyTestDetails.mode??''),
        const SizedBox(height: 10,),
        _detailItem(title: "School",subtitle: competencyTestDetails.status??''),
        const SizedBox(height: 10,),
        _detailItem(title: "Mode",subtitle: competencyTestDetails.mode??''),
        const SizedBox(height: 10,),
      ],
    );
  }

  _detailItem({title,subtitle}){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(text: title,
              style: AppTypography.body2.copyWith(
                color: AppColors.textGray
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.centerRight,
              child: CommonText(text: subtitle,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.button.copyWith(
                  color: AppColors.textDark
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}