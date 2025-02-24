import 'dart:convert';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/attendance/attandance_details/student_details.dart'
    as studeuntdetailsmolecule;
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../feature/disciplinarySlip/disciplinary_details_view_model.dart';
import '../../utils/common_widgets/app_images.dart';
import '../../utils/common_widgets/common_elevated_button.dart';
import '../../utils/stream_builder/app_stream_builder.dart';

class DisciplinaryDetails extends StatelessWidget {
  final String name;
  final String? schoolName;
  final String? boardName;
  final String? grade;
  final String? shift;
  final String? division;
  final String? stream;
  final String? course;
  final String? house;

  const DisciplinaryDetails(
      {super.key,
      required this.name,
      this.house,
      this.grade,
      this.course,
      this.schoolName,
      this.boardName,
      this.shift,
      this.division,
      this.stream});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        studeuntdetailsmolecule.StudentDetails(
            image: AppImages.personIcon,
            name: name,
            title: "$schoolName|$boardName",
            subtitle: "$course| $shift| $division| $house| $grade ",
            subtitle2: "${Strings.of(context).stream} $stream "),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Strings.of(context).disciplinary_Slip,
                style: AppTypography.subtitle1,
              ),
              BaseWidget(
                builder: (BuildContext context,
                    DisplinaryDetailsViewModel? model, Widget? child) {
                  return AppStreamBuilder<Resource<CoReasonsListResponseModel>>(
                    stream: model!.coReasonsListModel,
                    dataBuilder: (context, snapshot) {
                      return snapshot?.status == Status.loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () {
                                CommonPopups().showInfo(
                                  context,
                                  barrierDismissible: true,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          snapshot?.data?.data.length ?? 0,
                                          (index) {
                                            return infoRow(
                                                context,
                                                getColorFromJson(snapshot!
                                                    .data!
                                                    .data[index]
                                                    .attributes
                                                    .description),
                                                snapshot.data!.data[index]
                                                    .attributes.name);
                                          },
                                        ),
                                      ),

                                      // Flexible(
                                      // fit:FlexFit.loose,
                                      //   child: ListView.separated(
                                      //       itemBuilder:
                                      //           (BuildContext context, int index) {
                                      //         if (snapshot?.data?.data != null) {
                                      //           return infoRow(
                                      //               context,
                                      //               getColorFromJson(snapshot!
                                      //                   .data!
                                      //                   .data[index]
                                      //                   .attributes
                                      //                   .description),
                                      //               snapshot.data!.data[index]
                                      //                   .attributes.name);
                                      //         }
                                      //       },
                                      //       shrinkWrap: true,
                                      //       separatorBuilder:
                                      //           (BuildContext context, int index) {
                                      //         return SizedBox(
                                      //           height: 10.h,
                                      //         );
                                      //       },
                                      //       itemCount: snapshot?.data?.data.length ?? 0),
                                      // ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CommonElevatedButton(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            text: Strings.of(context).close,
                                            textColor: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  title: Text(
                                    Strings.of(context).slip_information,
                                    style: AppTypography.h6,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: Icon(
                                  CupertinoIcons.info,
                                  size: 30,
                                ),
                              ));
                    },
                    initialData: Resource.none(),
                  );
                },
                providerBase: disciplinarySlipProvider,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

Widget infoRow(BuildContext context, Color color, String text) {
  return Row(
    children: [
      SvgPicture.asset(
        AppImages.date,
        color: color,
        height: 16,
        width: 16,
      ),
      const SizedBox(
        width: 10,
      ),
      CommonText(
        text: text,
        style: AppTypography.subtitle1.copyWith(),
      ),
    ],
  );
}

Color getColorFromJson(String jsonString) {
  Map<String, dynamic> parsedJson = json.decode(jsonString);
  String colorCode = parsedJson['color_code'];
  return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
}
