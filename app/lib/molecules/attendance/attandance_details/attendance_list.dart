import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../feature/attendance/attendance_list1/attendance_details_view_model.dart';
import '../../../utils/app_typography.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.only(right: 70, left: 20, top: 10),
          decoration: const BoxDecoration(
            color: AppColors.textPaleGray,
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommonText(text: Strings.of(context).periods),
                  Icon(
                    CupertinoIcons.arrow_up,
                    color: AppColors.titleNeutral5,
                  )
                ],
              ),
              CommonText(text: Strings.of(context).attendance),
            ],
          ),
        ),
        BaseWidget(
            builder: (BuildContext context, AttendanceDetailsViewModel? model,
                Widget? child) {
              return AppStreamBuilder<Resource<AttendanceDetailsResponseModel>>(
                dataBuilder: (context, snapshot) {
                  return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        final period =
                            snapshot.data!.data.data.first.attendanceDetails;
                        return snapshot.status == Status.loading
                            ? CircularProgressIndicator()
                            : Container(
                                padding: EdgeInsets.only(
                                  right: 70,
                                  left: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    (snapshot
                                                    .data
                                                    ?.data
                                                    .data
                                                    .first
                                                    .attendanceDetails?[index]
                                                    .attendanceType ==
                                                5) ? CommonText(
                                        text: Strings.of(context).bus_attendance+"(Drop)"):
                                            (snapshot
                                                    .data
                                                    ?.data
                                                    .data
                                                    .first
                                                    .attendanceDetails?[index]
                                                    .attendanceType ==
                                                6)
                                        ?  SizedBox(width: 200.w,
                                          child: CommonText(maxLines: 3,softWrap: true,
                                              text: Strings.of(context).bus_attendance+"(Pickup from stop)"),
                                        )
                                        : (snapshot
                                                .data
                                                ?.data
                                                .data
                                                .first
                                                .attendanceDetails?[index]
                                                .attendanceType ==
                                                3)
                                            ? SizedBox(width: 200.w,
                                              child: CommonText(maxLines: 3,softWrap: true,
                                                  text: Strings.of(context).bus_attendance+"(Reached School)"),
                                            ):

                                            (snapshot
                                                .data
                                                ?.data
                                                .data
                                                .first
                                                .attendanceDetails?[index]
                                                .attendanceType ==
                                                4)
                                                ? SizedBox(width: 150.w,
                                                  child: CommonText(maxLines: 3,
                                                  text: Strings.of(context).bus_attendance+"(Pickup from School)"),
                                                ):
                                            CommonText(
                                            text:

                                                "${Strings.of(context).period}${period?.map((e) {

                                            return (period.indexOf(e) + 1)
                                                .toString();
                                          }).join(", ")}"),
                                    CommonText(
                                        text: '${
                                                 snapshot
                                                      .data
                                                      ?.data
                                                      .data
                                                      .first
                                                      .attendanceDetails?[index]
                                                      .attendanceRemark?[0]
                                                      .toUpperCase()
                                                }''${
                                                      snapshot
                                                          .data
                                                          ?.data
                                                          .data
                                                          .first
                                                          .attendanceDetails?[
                                                              index]
                                                          .attendanceRemark?.substring(1)

                                                    }'
                                            ,
                                        style: AppTypography.caption
                                            .copyWith(color: AppColors.success))
                                  ],
                                ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: snapshot!
                          .data!.data.data.first.attendanceDetails!.length,
                    ),
                  ));
                },
                stream: model!.getAttendanceDetail,
                initialData: Resource.none(),
              );
            },
            providerBase: attendanceDetailsProvider),
      ],
    );
  }
}
