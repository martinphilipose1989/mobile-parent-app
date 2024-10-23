
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart' hide State;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import '../../feature/disciplinarySlip/disciplinary_details_view_model.dart';
import '../../utils/app_typography.dart';
import '../../utils/common_widgets/app_images.dart';

class DisciplinarySlipListItem extends StatefulWidget {
 final  String? date;
 final String? discription;
 final int? id;

 DisciplinarySlipListItem({super.key, required this.date, required this.discription, required this.id,});

  @override
  State<DisciplinarySlipListItem> createState() =>
      _DisciplinarySlipListItemState();
}

class _DisciplinarySlipListItemState extends State<DisciplinarySlipListItem> {
  late bool visible = false;
  @override
  Widget build(BuildContext context) {

 return InkWell(
        onTap: () {
          setState(() {
            visible = !visible;
          });
        },
        child: Container(
          //  height: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            boxShadow: [

            ],
            border: Border(
              left: BorderSide(
                color: AppColors.failure, // Change this to your desired color
                width: 5.0, // Width of the colored border
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Card(
            elevation:6,
            shadowColor: AppColors.textPaleGray,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8,left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.slip),
                      SizedBox(
                        width: 5.h,
                      ),
                      CommonText(
                        text: "Slip 0${widget.id}",
                        style: AppTypography.caption
                            .copyWith(color: AppColors.titleNeutral5),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Container(
                        height: 25.h,
                        width: 2.h,
                        color: AppColors.textPaleGray,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SvgPicture.asset(AppImages.calender),
                      SizedBox(
                        width: 5.h,
                      ),
                      CommonText(
                        text:
                        dateFormatToDDMMYYYhhmma  (widget.date??""),
                        style: AppTypography.caption
                            .copyWith(color: AppColors.titleNeutral5),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Container(
                        height: 25.h,
                        width: 2.h,
                        color: AppColors.textPaleGray,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SvgPicture.asset(
                        AppImages.date,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      CommonText(
                        text: "Red",
                        style: AppTypography.caption.copyWith(
                          color: AppColors.titleNeutral5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CommonText(
                    text: "Student Disciplinary Action",
                    style: AppTypography.subtitle2
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child:  CommonText(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            text: widget.discription??""),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(AppImages.expand)
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Visibility(
                    visible: visible,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CommonText(
                              text: "Disciplinary Action : ",
                              style: AppTypography.body2
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            CommonText(
                              text: "Visit School On 22 August",
                              style: AppTypography.body2
                                  .copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          BaseWidget(
                            builder: (BuildContext context, DisplinaryDetailsViewModel? model, Widget? child) {
                              return   AppStreamBuilder<Resource<AcknowlegementResponseModel>>(
                                stream: model!.acknowledgeSlipModel,
                                initialData: Resource.none(),
                                dataBuilder: (BuildContext context, Resource<AcknowlegementResponseModel>? data) {

                                return  CommonElevatedButton(
                                    onPressed: () {
                                      model.acknowledgeSlip(model: AcknowlegementRequestModel(studentWarningId: 1, userId: 1, acknowledgementRole: "Parent", acknowledgementDate: DateTime.now()));
                                      CommonPopups().showSuccess(
                                        context,
                                        "Acknowledged",
                                            (shouldRoute) {},
                                      );
                                    },
                                    text: "Acknowledge",
                                    backgroundColor: AppColors.primary,
                                    textColor: AppColors.primaryOn,
                                  );
                                },

                              );


                            },
                            providerBase: disciplinarySlipProvider,

                          )
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );}

  }

String dateFormatToDDMMYYYhhmma(String time) {
  try {
    DateTime dateTime = DateTime.parse(time);
    return DateFormat('dd/MM/yyyy  hh:mma').format(dateTime);
  } catch (e) {
    return '';
  }}