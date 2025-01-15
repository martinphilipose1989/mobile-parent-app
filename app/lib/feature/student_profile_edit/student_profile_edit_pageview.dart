// ignore_for_file: use_super_parameters

import 'package:app/model/resource.dart';
import 'package:app/molecules/student/InfoTitleRow.dart';
import 'package:app/molecules/student/infoEditRow.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/tansport/visitor_details_row.dart';
import '../../utils/common_widgets/data_status_widget.dart';
import 'student_profile_edit_page_viewmodel.dart';

class StudentProfileEditView
    extends BasePageViewWidget<StudentProfileEditViewModel> {
  //final int studentId;

  StudentProfileEditView(
    ProviderBase<StudentProfileEditViewModel> model,
    // {required this.studentId}
  ) : super(model);

  @override
  Widget build(BuildContext context, StudentProfileEditViewModel model) {
    //return AppStreamBuilder<Resource<GetStudentDetailData>>(
    //     initialData: Resource.none(),
    //     stream: model.studentDetailStream,
    //     dataBuilder: (context, student) {
    //       return DataStatusWidget(
    //         status: student?.status ?? Status.none,
    //         loadingWidget: () =>
    //             const Center(child: CircularProgressIndicator()),
    //         errorWidget: () => Center(
    //           child: NoDataFoundWidget(
    //             title: student?.dealSafeAppError?.error.message
    //                         .contains("internet") ??
    //                     false
    //                 ? "No Internet Connection"
    //                 : "Something Went Wrong",
    //             subtitle: student?.dealSafeAppError?.error.message
    //                         .contains("internet") ??
    //                     false
    //                 ? "It seems you're offline. Please check your internet connection and try again."
    //                 : "An unexpected error occurred. Please try again later or contact support if the issue persists.",
    //             onPressed: () {
    //               model.getStudentDetail(studentId: studentId);
    //             },
    //           ),
    //         ),
    //         successWidget: () =>

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StudentImageInfo(),
              SizedBox(height: 16.h),
              Infotitlerow(
                infoText: "Basic Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "School Name",
                  labelText2: "Date Of Birth",
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Board", labelText2: "Course", readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Grade", labelText2: "Division", readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Shift", labelText2: "House", readOnly: true),

              SizedBox(height: 16.h),
              Divider(color: AppColors.divider,),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Medical Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Physical Disability", labelText2: "Medical Disability", readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Allergies", labelText2: "Learning Needs", readOnly: false),
              SizedBox(height: 16.h),
              Divider(color: AppColors.divider,),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Parent Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Parent First Name", labelText2: "Parent Last Name", readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Phone", labelText2: "Email", readOnly: true),
              SizedBox(height: 16.h),
              Divider(color: AppColors.divider,),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Address",
              ),
              SizedBox(height: 12.h),
              InfoEditRow(
                  labelText: "Address Line 1", labelText2: "Address Line 2", readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "City", labelText2: "States", readOnly: false),
              SizedBox(height: 16.h),
             SizedBox(
               width: MediaQuery.of(context).size.width*0.4,
                 child: CommonTextFormField(showAstreik: true,labelText: "PinCode",maxLength: 6,)),

              SizedBox(height: 16.h),
              Divider(color: AppColors.divider,),
              SizedBox(height: 16.h),
              Infotitlerow(
                infoText: "Bearers",
              ),
          SizedBox(
     height: 150,
            width: 1.sw,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
                        Stack(
                          children: [
                            InkWell(
                              onTap:(){
                                CommonPopups().showEdit(context, (){});

                              },
                              child: CommonImageWidget(
                                imageUrl: "",
                                clipBehavior: Clip.hardEdge,
                                imageWidth: 80,
                                imageHeight: 70),
                            ),

                            Positioned(
                              bottom: -20,
                                right:1.w,
                                child:  SvgPicture.asset(AppImages.edit,height: 26,width: 26,)),
              ]),
                        const SizedBox(height: 12),
                        Text("Ajay Shah")
                      ],
                    ),
                    SizedBox(width: 16.w),
                  ],
                );
              },
            ),
          )

            ],
          ),
        )


        );
    //  ),
    // );
    // );
    // });
  }
}

class BearerList extends StatelessWidget {
  const BearerList(
      {super.key,
      required this.bearerList,
      required this.studentId,
      required this.model});

  final List<BearerResponse> bearerList;
  final int studentId;
  final StudentProfileEditViewModel model;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
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
                      imageUrl: "",
                      clipBehavior: Clip.hardEdge,
                      imageWidth: 50,
                      imageHeight: 50),
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

// class BearerList extends StatelessWidget {
//   const BearerList(
//       {super.key,
//       required this.bearerList,
//       required this.studentId,
//       required this.model});

//   final List<BearerResponse> bearerList;
//   final int studentId;
//   final StudentProfileEditViewModel model;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       width: 1.sw,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 0.7.sw,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: bearerList.length,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         CommonImageWidget(
//                             imageUrl: "${bearerList[index].DetailImage}",
//                             clipBehavior: Clip.hardEdge,
//                             imageWidth: 50,
//                             imageHeight: 50),
//                         const SizedBox(height: 12),
//                         Text("${bearerList[index].firstName}")
//                       ],
//                     ),
//                     SizedBox(width: 16.w),
//                   ],
//                 );
//               },
//             ),
//           ),
//           SizedBox(width: 16.w),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               InkWell(
//                 onTap: () {
//                   showDialog(
//                       context: context,
//                       barrierDismissible: false,
//                       builder: (context) {
//                         return AddNewBearer(
//                             studentId: studentId,
//                             cancelCallback: () {
//                               Navigator.pop(context);
//                             },
//                             addNewBearerCallback: () {});
//                       }).then((value) {
//                     if (value == true) {
//                       model.getStudentDetail(studentId: studentId);
//                     }
//                   });
//                 },
//                 child: const CommonImageWidget(
//                     imageUrl: "imageUrl",
//                     fallbackAssetImagePath: AppImages.addBearerIcon,
//                     clipBehavior: Clip.hardEdge,
//                     imageWidth: 50,
//                     imageHeight: 50),
//               ),
//               const SizedBox(height: 12),
//               const Text("Add New")
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class StudentImageInfo extends StatelessWidget {
  const StudentImageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,

          margin: EdgeInsets.only(
            top: 67.h,
          ),
          child:
              SvgPicture.asset(fit: BoxFit.fitWidth, AppImages.bannerProfile),
          // padding: EdgeInsets.only(
          //   top: 67.h + 24.h,
          //   left: 16,
          //   right: 16,
          //   bottom: 24,
          //  ),
          decoration: BoxDecoration(
            // color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.r),
                boxShadow: [AppColors.boxShadow]),
            child: CircleAvatar(
              radius: 52.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 45.r,
                child: ClipOval(
                    child: CommonImageWidget(
                  imageUrl: "avatarImagePath",
                  fallbackAssetImagePath: AppImages.defaultStudentAvatar,
                  imageHeight: 120.r,
                  imageWidth: 120.r,
                )),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Khevna Shah",
                        style: AppTypography.h5,
                      ),
                      CommonText(
                        text: "En-202023456",
                        style: AppTypography.caption,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    //  width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryOn,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.primary)),
                    padding: EdgeInsets.all(6),
                    child: CommonText(
                      text: "Active",
                      style: AppTypography.caption,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
