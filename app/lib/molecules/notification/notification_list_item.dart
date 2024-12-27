import 'package:app/feature/notification/notification_viewmodel.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';

class NotificationListItem extends StatelessWidget {
  final String subject;
  final String content;
NotificationListItem({super.key, required this.subject, required this.content});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        providerBase: notificationProvider,
        builder: (context, model, _)
        {
          return InkWell(onTap: (){model?.expand.value=!model.expand.value;},
            child: Container(
                padding: EdgeInsets.all(16),
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.info_circle,),
                        SizedBox(width: 10.h,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subject),
                            Text(content,
overflow:TextOverflow.ellipsis ,
                              maxLines: model?.expand.value==true?4:1,),
                            Text("4h ago")
                          ],),
                      ],
                    ),
                    Icon(Icons.expand_more,size: 30.h,),

                  ],
                )
            ),
          );}

    );
  }
}
