import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../navigation/route_paths.dart';

class StudentDetailsRowWidget extends StatelessWidget {
  final int? id;
  final String name;
  final String desc;
  final String status;
  final String lname;
  final String image;
  const StudentDetailsRowWidget({super.key, required this.name, required this.desc, required this.status, required this.lname, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(padding:const EdgeInsets.all(16.0),decoration: BoxDecoration(color: AppColors.surface_1),
    child: Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
 Row(children: [
  CommonImageWidget(imageUrl: image,imageHeight: 40.h,),
    SizedBox(width: 10.w,),
    Column(children: [
      CommonText(text: name+""+lname,style: AppTypography.subtitle2,),
      CommonText(text: desc,style: AppTypography.body2,)
    ],),

    CommonElevatedButton(onPressed: (){Navigator.pushNamed(context, RoutePaths.studentProfilePage,arguments:id );

    }, text: status,backgroundColor: AppColors.success,)
  ],),
    ],),);
  }
}
