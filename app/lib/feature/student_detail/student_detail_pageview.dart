// ignore_for_file: use_super_parameters

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
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/tansport/visitor_details_row.dart';
import 'student_detail_page_viewmodel.dart';

class StudentDetailPageView
    extends BasePageViewWidget<StudentDetailPageViewModel> {
  //final int studentId;

  StudentDetailPageView(
    ProviderBase<StudentDetailPageViewModel> model,
    // {required this.studentId}
  ) : super(model);

  @override
  Widget build(BuildContext context, StudentDetailPageViewModel model) {
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
              visible: true,
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.profileEdit);
              },
            ),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
              title1: "School Name",
              value1: "Vibgyor High Goregaon",
              title2: "Date of Birth",
              value2: "20-12-2024",
            ),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Board",
                value1: "CBSE",
                title2: "Course",
                value2: "Regular"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Grade", value1: "V", title2: "Division", value2: "A"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Shift",
                value1: "Shift 2",
                title2: "House",
                value2: "Water"),
            SizedBox(height: 16.h),
            const Divider(color: AppColors.dividerColor),
            SizedBox(height: 16.h),
            Infotitlerow(infoText: "Medical Details"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Physical Disability",
                value1: "Polio",
                title2: "Medical History",
                value2: "Amesia"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Alergies",
                value1: "Peanut Allergy",
                title2: "Personalised Learning Needs",
                value2: "Readability"),
            SizedBox(height: 16.h),
            const Divider(color: AppColors.dividerColor),
            SizedBox(height: 16.h),
            Infotitlerow(infoText: "Parent Details"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Parent First Name ",
                value1: "Martin",
                title2: "Parent Last Name",
                value2: "Matthew"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Phone",
                value1: "9876543223",
                title2: "Email",
                value2: "martin.mathew@gmail.com"),
            SizedBox(height: 16.h),
            const Divider(color: AppColors.dividerColor),
            SizedBox(height: 16.h),
            Infotitlerow(infoText: "Address "),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "Address Line 1",
                value1: "house no 7,abc society",
                title2: "Address Line 2",
                value2: "Hinjewadi"),
            SizedBox(height: 16.h),
            VisitorDetailsRow(
                title1: "City",
                value1: "Pune",
                title2: "State",
                value2: "Maharastra"),
            VisitorDetailsRow(
              title1: "Pincode",
              value1: "411057",
            ),
            SizedBox(height: 16.h),
            const Divider(color: AppColors.dividerColor),
            SizedBox(height: 16.h),
            Infotitlerow(infoText: "Bearers "),
            SizedBox(height: 16.h),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: CommonImageWidget(imageHeight: 10, imageUrl: ""),
                      ),
                      Expanded(child: Text("Teacher"))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: CommonImageWidget(imageHeight: 10, imageUrl: ""),
                      ),
                      Expanded(child: Text("Teacher"))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: CommonImageWidget(imageHeight: 10, imageUrl: ""),
                      ),
                      Expanded(child: Text("Teacher"))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: CommonImageWidget(imageHeight: 10, imageUrl: ""),
                      ),
                      Expanded(child: Text("Teacher"))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: CommonImageWidget(imageHeight: 10, imageUrl: ""),
                      ),
                      Expanded(child: Text("Teacher"))
                    ],
                  ),
                ],
              ),
            )

            //     Column(
            //       children: [
            // CommonText(
            //             text: "Bearers", style: AppTypography.subtitle2),
            //         SizedBox(height: 16.h),
            //
            //         /// bearerList is empty
            //         // student?.data?.bearersDetails?.isEmpty == true
            //         //     ? const SizedBox.shrink()
            //         //     : BearerList(
            //         //         model: model,
            //         //         bearerList: student?.data?.bearersDetails ?? [],
            //         //         studentId: studentId)
            //       ],
            //     ),
          ],
        ),
      ),
    );
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
//   final StudentDetailPageViewModel model;

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
