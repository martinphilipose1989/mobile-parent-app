import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchoolTourScheduledDetailsWidget extends StatelessWidget {
  final SchoolVisitDetail schoolVisitDetail;
  const SchoolTourScheduledDetailsWidget({super.key,required this.schoolVisitDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: "School tour Scheduled details",style: AppTypography.body1.copyWith(color: AppColors.textDark),),
        const SizedBox(height: 10,),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffE0E0E0),
        ),
        const SizedBox(height: 10,),
        _detailItem(title: "Date",subtitle: DateFormat('dd/MM/yyyy').format(DateTime.parse((schoolVisitDetail.schoolVisitDate??DateTime.now()).toString())),),
        const SizedBox(height: 10,),
        _detailItem(title: "Selected Time",subtitle: schoolVisitDetail.slot??''),
        const SizedBox(height: 10,),
        _detailItem(title: "Comments",subtitle: schoolVisitDetail.comment??''),
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
