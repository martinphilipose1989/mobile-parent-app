import 'package:app/molecules/attendance/attandance_details/student_details.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/common_widgets/app_images.dart';
import '../../utils/common_widgets/common_elevated_button.dart';

class DisciplinaryDetails extends StatelessWidget {

  const DisciplinaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const StudentDetails(
          image: AppImages.personIcon, name: "Khevna Shah", title: "vibgyor Schools|cbse", subtitle: "regular| shift| Grade V", subtitle2: "Stream|NA"),
        SizedBox(height: 20.h,),
      Padding(
        padding: const EdgeInsets.all(10),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CommonText(text: "Disciplinary Slip"),
            InkWell(

onTap: (){
 // showDialog(context: context, builder: (BuildContext context){
CommonPopups().showInfo(context, barrierDismissible: true,child:

Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    infoRow(context, AppColors.failure, " Red Slip"),
    const SizedBox(width: 10,),
    infoRow(context, AppColors.yellow, "Yellow Slip"),
    const SizedBox(width: 10,),
    infoRow(context, AppColors.orange, "Orange Slip"),
    const SizedBox(width: 10,),
    infoRow(context, Theme.of(context).colorScheme.secondary,
        "Warning Slip"),
    SizedBox(height: 20.h,),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CommonElevatedButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.pop(context);
          },
          text: "close",textColor: Theme.of(context).colorScheme.primaryContainer ,
        width: MediaQuery.of(context).size.width*0.3,
        )
      ],
    )
  ],
), title: Text("Slip Information",style: AppTypography.h6,),);
},
                child: Icon(CupertinoIcons.info,size: 20,)),


          ],),
      ),
      SizedBox(height: 30.h,),

    ],);
  }
}
Widget infoRow(BuildContext context,Color color,String text){

  return Row(children: [
    SvgPicture.asset(AppImages.date,color: color,height: 16,width: 16,),
    const SizedBox(width: 10,),
    CommonText(text: text,style: AppTypography.subtitle1.copyWith(


    ),),


  ],);
}
