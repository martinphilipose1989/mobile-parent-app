import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_typography.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(alignment: Alignment.center,
        width: double.infinity,height: 60 ,padding :const EdgeInsets.only(right: 70,left:20,top: 10),decoration:  BoxDecoration(
        color: AppColors.textPaleGray,
        
      ),
      child:  const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

        Row(
          children: [
            CommonText(text: "Periods"),
            Icon(CupertinoIcons.arrow_up,color: AppColors.titleNeutral5,)
          ],
        ),
        CommonText(text: "Attendance"),
        
      ],),),
      
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,int index ){

            return Container(padding: EdgeInsets.only(right: 70,left: 10,),child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(text: "Period1"),
                CommonText(text: "Present",style: AppTypography.caption.copyWith(color: AppColors.success))
              ],
            ));
          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20,); }, itemCount: 12,),
        ),
      )

    ],);
  }
}
