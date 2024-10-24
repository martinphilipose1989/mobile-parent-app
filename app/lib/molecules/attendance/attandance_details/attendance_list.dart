import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../feature/attendance/attendance_list1/attendance_details_view_model.dart';
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
      
     BaseWidget(builder:  (BuildContext context, AttendanceDetailsViewModel? model,
    Widget? child){

   return AppStreamBuilder<Resource<AttendanceDetailsResponseModel>>(
    dataBuilder: (context, snapshot){

    return Expanded(
    child: Padding(
    padding: const EdgeInsets.all(16),
    child: ListView.separated(

    shrinkWrap: true,

    itemBuilder: (context,int index ){

    return Container(padding: EdgeInsets.only(right: 70,left: 10,),child:Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    CommonText(text: "period"),
    CommonText(text: snapshot!.data!.data.data[index].attendanceDetails[index].attendanceRemark,
        style: AppTypography.caption.copyWith(color: AppColors.success))
    ],
    ));
    }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 20,); }, itemCount: snapshot!.data!.data.data
        .map((attendanceData) => attendanceData.attendanceDetails)
        .expand((details) => details)
        .length,),
    ),
    );
    }, stream: model!.getAttendanceDetail, initialData: Resource.none(),

    );

    }


    , providerBase: attendanceDetailsProvider),

    ],);
  }
}
