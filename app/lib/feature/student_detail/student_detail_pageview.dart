// ignore_for_file: use_super_parameters

import 'dart:ffi';

import 'package:app/molecules/student/InfoTitleRow.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../molecules/student/bearerList.dart';
import '../../molecules/student/student_image_info.dart';
import '../../molecules/tansport/visitor_details_row.dart';
import '../../utils/common_widgets/data_status_widget.dart';
import '../../utils/common_widgets/no_data_found_widget.dart';
import '../../utils/stream_builder/app_stream_builder.dart';
import 'student_detail_page_viewmodel.dart';

class StudentDetailPageView
    extends BasePageViewWidget<StudentDetailPageViewModel> {
  // final int studentId;

  StudentDetailPageView(
    ProviderBase<StudentDetailPageViewModel> model,
    // {required this.studentId}
  ) : super(model);

  @override
  Widget build(BuildContext context, StudentDetailPageViewModel model) {
    return AppStreamBuilder<Resource<StudentData>>(
        initialData: Resource.none(),
        stream: model.studentDetailStream,
        dataBuilder: (context, student) {
          return DataStatusWidget(
            status: student?.status ?? Status.none,
            loadingWidget: () =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: () => Center(
              child: NoDataFoundWidget(
                title: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? "No Internet Connection"
                    : "Something Went Wrong",
                subtitle: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? "It seems you're offline. Please check your internet connection and try again."
                    : "An unexpected error occurred. Please try again later or contact support if the issue persists.",
                onPressed: () {
                  model.getStudentDetail(
                      studentId: model.selectedStudent?.first.id);
                },
              ),
            ),
            successWidget: () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudentImageInfo(),
                    SizedBox(height: 16.h),
                    Infotitlerow(
                      infoText: "Basic Details",
                      visible: true,
                      onTap: () {
                        Navigator.pushNamed(context, RoutePaths.profileEdit);
                      },
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: "School Name",
                      value1: student?.data?.profile?.crtSchool ?? " ",
                      title2: "Date of Birth",
                      value2: DateFormat('dd-MM-yyyy')
                          .format(student!.data!.profile!.dob),
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Board",
                        value1: student?.data?.profile?.crtBoard ?? "NA",
                        title2: "Course",
                        value2: student?.data?.profile?.courseName),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Grade",
                        value1: student?.data?.profile?.crtGrade ?? "NA",
                        title2: "Division",
                        value2: student?.data?.profile?.crtDivision),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Shift",
                        value1: student?.data?.profile?.crtShift ?? "NA",
                        title2: "House",
                        value2: student?.data?.profile?.crtHouse ?? "NA"),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: "Medical Details"),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Physical Disability",
                        value1:
                            student?.data?.medicalInfo?.disablilityDetails ??
                                "NA",
                        title2: "Medical History",
                        value2:
                            student?.data?.medicalInfo?.medicalHistoryDetails ??
                                "NA"),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Alergies",
                        value1:
                            student?.data?.medicalInfo?.allergyDetails ?? "NA",
                        title2: "Personalised Learning Needs",
                        value2: student?.data?.medicalInfo
                            ?.personalizedLearningNeedsDetails),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: "Parent Details"),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: "Parent First Name ",
                      value1: student?.data?.parent?.first.firstName ?? "",
                      title2: "Parent Last Name",
                      value2: student?.data?.parent?.first.lastName ?? "",
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Phone",
                        value1: student?.data?.parent?.first.mobileNo ?? "",
                        title2: "Email",
                        value2: student?.data?.parent?.first.email ?? ""),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: "Address "),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "Address Line 1",
                        value1: student
                                ?.data
                                ?.contactInfo
                                ?.residentialInformation
                                ?.first
                                ?.houseBuildingNo ??
                            "",
                        title2: "Address Line 2",
                        value2: student?.data?.contactInfo
                            ?.residentialInformation?.first.streetName),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: "City",
                        value1: student?.data?.contactInfo
                                ?.residentialInformation?.first.city ??
                            "NA",
                        title2: "State",
                        value2: student?.data?.contactInfo
                                ?.residentialInformation?.first.state ??
                            "NA"),
                    VisitorDetailsRow(
                      title1: "Pincode",
                      value1: (student?.data?.contactInfo
                                  ?.residentialInformation?.first.pincode ??
                              0)
                          .toString(),
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    // Infotitlerow(infoText: "Bearers "),
                    // SizedBox(height: 16.h),
                    // SizedBox(
                    //   height: 160,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Expanded(
                    //             child: CommonImageWidget(imageHeight: 50,
                    //                 imageWidth: 80,
                    //                 imageUrl: ""),
                    //           ),
                    //           Expanded(child: Text("Teacher"))
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Column(
                    //         children: [
                    //           Expanded(
                    //             child: CommonImageWidget(
                    //                 imageHeight: 10, imageUrl: ""),
                    //           ),
                    //           Expanded(child: Text("Teacher"))
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Column(
                    //         children: [
                    //           Expanded(
                    //             child: CommonImageWidget(
                    //                 imageHeight: 10, imageUrl: ""),
                    //           ),
                    //           Expanded(child: Text("Teacher"))
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Column(
                    //         children: [
                    //           Expanded(
                    //             child: CommonImageWidget(
                    //                 imageHeight: 10, imageUrl: ""),
                    //           ),
                    //           Expanded(child: Text("Teacher"))
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Column(
                    //         children: [
                    //           Expanded(
                    //             child: CommonImageWidget(
                    //                 imageHeight: 10, imageUrl: ""),
                    //           ),
                    //           Expanded(child: Text("Teacher"))
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // )

                    AppStreamBuilder<Resource<List<BearerResponse>>>(
                        stream: model.bearerStream,
                        initialData: Resource.none(),
                        dataBuilder: (context, bearer) {
                          return DataStatusWidget(
                              status: bearer?.status ?? Status.none,
                           errorWidget: ()=>Center(
                             child: NoDataFoundWidget(
                               title: bearer?.dealSafeAppError?.error.message
                                   .contains("internet") ??
                                   false
                                   ? "No Internet Connection"
                                   : "Something Went Wrong",
                               subtitle: bearer?.dealSafeAppError?.error.message
                                   .contains("internet") ??
                                   false
                                   ? "It seems you're offline. Please check your internet connection and try again."
                                   : "An unexpected error occurred. Please try again later or contact support if the issue persists.",
                               onPressed: () {
                                 model.getBearerList(studentId: model.selectedStudent?.first.id);
                               //   model.getStudentDetail(
                               //       studentId: model.selectedStudent?.first.id);
                         },
                             ),
                           ),
                           loadingWidget: ()=> Center(child: CircularProgressIndicator()),
                           successWidget: ()=> Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: "Bearers",
                                    style: AppTypography.subtitle2),
                                SizedBox(height: 16.h),

                                /// bearerList is empty
                                bearer?.data?.isEmpty == true
                                    ? BearerList(
                                    model: model,
                                    bearerList:  [],
                                    studentId:0)
                                    : BearerList(
                                        model: model,
                                        bearerList: bearer?.data ?? [],
                                        studentId:
                                            model.selectedStudent?.first.id)
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
