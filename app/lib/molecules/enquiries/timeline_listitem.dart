import 'package:app/molecules/enquiries/dashline.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TimelineListitem extends StatelessWidget {

  final int index;
  final int length;
  final EnquiryTimelineDetail timeline;
  const TimelineListitem({super.key,required this.index,required this.length,required this.timeline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.listItem,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(width: 5,color: Theme.of(context).primaryColor),
                    ),
                    child: Center(
                      child: CommonText(text: '${index+1}',style: AppTypography.body1.copyWith(
                            color: AppColors.primary,
                            fontSize: 12
                          ),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: timeline.event??'',
                        style: AppTypography.body2.copyWith(
                          color: AppColors.textDark
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined,color: AppColors.textGray,size: 18,),
                          const SizedBox(width: 5,),
                          CommonText(text: timeline.eventType??'',
                            style: AppTypography.body2.copyWith(
                              color: AppColors.textGray,
                              fontSize: 12,
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 15,),
                      CommonText(text: DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.parse(timeline.createdAt??'').toLocal()),
                        style: AppTypography.body2.copyWith(
                          fontSize: 10,
                          color: AppColors.textDark
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        index== length-1?
            const SizedBox()
        :Positioned(
          left: 29,
          top: 50,
          child: CustomPaint(
              size: const Size(2, 120),
              painter: DashedLineVerticalPainter()
          ),
        ),
      ],
    );
  }
}
