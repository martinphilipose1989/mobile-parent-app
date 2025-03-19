// ignore_for_file: use_super_parameters

import 'package:app/feature/student_profile_edit/student_profile_edit_page.dart';
import 'package:app/molecules/student/InfoTitleRow.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import '../../model/resource.dart';
import '../../molecules/student/bearerList.dart';
import '../../molecules/student/student_image_info.dart';
import '../../molecules/tansport/visitor_details_row.dart';
import '../../utils/app_typography.dart';
import '../../utils/common_widgets/common_text_widget.dart';
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
          print("/////////////////////////");
          print(student?.data?.parent?[0].firstName);
          return DataStatusWidget(
            status: student?.status ?? Status.none,
            loadingWidget: () =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: () => Center(
              child: NoDataFoundWidget(
                title: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? Strings.of(context).no_internet_connection
                    : Strings.of(context).something_got_wrong,
                subtitle: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? Strings.of(context).it_seems_you_re_offline
                    : Strings.of(context).an_unexpected_error,
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
                    StudentImageInfo(
                      active: "Active",
                      name:
                          "${student?.data?.profile!.firstName} ${student?.data?.profile!.lastName}",
                      img: student?.data?.profile!.profileImageUrl,
                      rollno: student?.data?.profile!.crtEnrOn,
                    ),

                    SizedBox(height: 16.h),
                    BaseWidget(
                      builder: (BuildContext context, StudentDetailPageViewModel? model, Widget? child) { return Infotitlerow(
                        infoText: Strings.of(context).basic_detail,
                        visible: true,
                        onTap: () {
                          Navigator.pushNamed(context, RoutePaths.profileEdit,
                              arguments:
                              StudentDataArgs(studentData: student?.data,bearerResponse: model?.bererList));
                        },
                      );}, providerBase: studentDetailPageViewModelProvider,

                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: Strings.of(context).school_name,
                      value1: student?.data?.profile?.crtSchool ?? " ",
                      title2: Strings.of(context).date_of_birth,
                      value2: DateFormat('dd-MM-yyyy')
                          .format(student!.data!.profile!.dob),
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).board,
                        value1: student.data?.profile?.crtBoard ?? "NA",
                        title2: Strings.of(context).course,
                        value2: student.data?.profile?.courseName),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).grade,
                        value1: student.data?.profile?.crtGrade ?? "NA",
                        title2: Strings.of(context).division,
                        value2: student.data?.profile?.crtDivision),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).shift,
                        value1: student.data?.profile?.crtShift ?? "NA",
                        title2: Strings.of(context).house,
                        value2: student.data?.profile?.crtHouse ?? "NA"),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: Strings.of(context).medical_details),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).physical_disability,
                        value1: student.data?.medicalInfo?.disablilityDetails??
                            "NA",
                        title2: Strings.of(context).medical_history,
                        value2:
                            student.data?.medicalInfo?.medicalHistoryDetails ??
                                "NA"),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).allergies,
                        value1:
                            student.data?.medicalInfo?.allergyDetails ?? "NA",
                        title2: Strings.of(context).personalised_Learning_Needs,
                        value2: student.data?.medicalInfo
                            ?.personalizedLearningNeedsDetails),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: Strings.of(context).mother_Details),
                    SizedBox(height: 16.h),
                    ////////////////////////////////

                    VisitorDetailsRow(
                      title1: Strings.of(context).mother_first_name,
                      value1: student.data?.parent?[1].firstName?? "",
                      title2: Strings.of(context).Mother_last_name,
                      value2: student.data?.parent?[1].lastName ?? "",
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).mother_Mobile_Number,
                        value1: student.data?.parent?[1].mobileNo ?? "",
                        title2: Strings.of(context).mother_Email_ID,
                        value2: student.data?.parent?[1].email ?? ""),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    //////////////////////////////////
                    Infotitlerow(infoText: Strings.of(context).father_detail),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: Strings.of(context).father_first_name,
                      value1: student.data?.parent?.first.firstName?? "",
                      title2: Strings.of(context).father_last_name,
                      value2: student.data?.parent?.first.lastName ?? "",
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).father_Mobile_Number,
                        value1: student.data?.parent?.first.mobileNo ?? "",
                        title2: Strings.of(context).father_Email_ID,
                        value2: student.data?.parent?.first.email ?? ""),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Infotitlerow(infoText: Strings.of(context).address),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).address_Line_1,
                        value1: student
                                .data
                                ?.contactInfo
                                ?.residentialInformation
                                ?.first
                                .houseBuildingNo ??
                            "",
                        title2: Strings.of(context).address_Line_2,
                        value2: student.data?.contactInfo
                            ?.residentialInformation?.first.streetName),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).city,
                        value1: student.data?.contactInfo
                                ?.residentialInformation?.first.city ??
                            "NA",
                        title2: Strings.of(context).state,
                        value2: student.data?.contactInfo
                                ?.residentialInformation?.first.state ??
                            "NA"),
                    VisitorDetailsRow(
                      title1: Strings.of(context).pincode,
                      value1: (student.data?.contactInfo?.residentialInformation
                                  ?.first.pincode ??
                              0)
                          .toString(),
                    ),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),

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
                                   ? Strings.of(context).no_internet_connection
                                   : Strings.of(context).something_got_wrong,
                               subtitle: bearer?.dealSafeAppError?.error.message
                                   .contains("internet") ??
                                   false
                                   ? Strings.of(context).it_seems_you_re_offline
                                   : Strings.of(context).an_unexpected_error,
                               onPressed: () {
                                 model.getBearerList(studentId: model.selectedStudent?.first.id);
                                 // model.getStudentDetail(
                                 //     studentId: model.selectedStudent?.first.id);
                         },
                             ),
                           ),
                           loadingWidget: ()=> Center(child: CircularProgressIndicator()),
                           successWidget: ()=> Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: Strings.of(context).bearers,
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
