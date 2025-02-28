
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/student_detail/student_detail_page_viewmodel.dart';
import '../../utils/common_image_widget.dart';

class BearerList extends StatelessWidget {
  const BearerList(
      {super.key,
        required this.bearerList,
        required this.studentId,
        required this.model});

  final List<BearerResponse> bearerList;
  final int studentId;
  final StudentDetailPageViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bearerList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Display each bearer
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImageWidget(
                      imageUrl: bearerList[index].profileImage??"",
                      clipBehavior: Clip.hardEdge,
                      imageWidth: 80,
                      imageHeight: 70),
                  const SizedBox(height: 12),
                  Text("${bearerList[index].firstName}")
                ],
              ),
              SizedBox(width: 16.w),
            ],
          );
        },
      ),
    );
  }
}