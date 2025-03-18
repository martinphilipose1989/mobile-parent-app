import 'package:app/di/states/viewmodels.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../molecules/disciplinarySlip/disciplinary_details.dart';
import '../../molecules/disciplinarySlip/disciplinary_slip_list.dart';
import 'disciplinary_details_view_model.dart';

class DisplinaryDetailsPageView
    extends BasePageViewWidget<DisplinaryDetailsViewModel> {
  DisplinaryDetailsPageView(
    super.providerBase,
  );

  @override
  Widget build(BuildContext context, DisplinaryDetailsViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: BaseWidget(
        builder: (BuildContext context, DisplinaryDetailsViewModel? model,
            Widget? child) {
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              AppStreamBuilder<Resource<StudentDetailsResponseModel>>(
                dataBuilder: (context, data) {
                  return data?.status == Status.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : DisciplinaryDetails(
                          name:
                              model.selectedStudent?.first.studentDisplayName ??
                                  "",
                          schoolName: data?.data?.data?.profile?.crtSchool??"NA",
                          boardName: data?.data?.data?.profile?.crtBoard,
                          stream: data?.data?.data?.profile?.streamName??"NA",
                          grade: data?.data?.data?.profile?.crtGrade??"NA",
                          course: data?.data?.data?.profile?.courseName??"NA",
                          shift: data?.data?.data?.profile?.crtShift??"NA",
                          division: data?.data?.data?.profile?.crtDivision??"NA",
                          house: data?.data?.data?.profile?.crtHouse??"NA",
                        );
                },
                stream: model!.studentDetails,
                initialData: Resource.none(),
              ),
           const  DisciplinarySlipList()
            ],
          );
        },
        providerBase: disciplinarySlipProvider,
      ),
    );
  }
}
