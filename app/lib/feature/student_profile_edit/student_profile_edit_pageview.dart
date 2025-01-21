// ignore_for_file: use_super_parameters

import 'package:app/molecules/student/InfoTitleRow.dart';
import 'package:app/molecules/student/infoEditRow.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/student/student_image_info.dart';
import 'student_profile_edit_page_viewmodel.dart';

class StudentProfileEditView
    extends BasePageViewWidget<StudentProfileEditViewModel> {
  final StudentData studentData;

  StudentProfileEditView(
    ProviderBase<StudentProfileEditViewModel> model,
    this.studentData,
    // {required this.studentId}
  ) : super(model);

  @override
  Widget build(BuildContext context, StudentProfileEditViewModel model) {
    model.schoolController.text = studentData.profile?.crtSchool ?? "N/A";
    model.boardController.text = studentData.profile?.crtBoard ?? "N/A";
    model.courseController.text = studentData.profile?.courseName ?? "N/A";
    model.gradeController.text = studentData.profile?.crtGrade ?? "N/A";
    model.divisionController.text = studentData.profile?.crtDivision ?? "N/A";
    model.shiftController.text = studentData.profile?.crtShift ?? "N/A";
    model.houseController.text = studentData.profile?.crtHouse ?? "N/A";
    model.allergyController.text =
        studentData.medicalInfo?.allergyDetails ?? "N/A";
    model.medicalController.text =
        studentData.medicalInfo?.medicalHistoryDetails ?? "N/A";

    model.physicalController.text =
        studentData.medicalInfo?.disablilityDetails ?? "N/A";
    model.medicalController.text =
        studentData.medicalInfo?.personalizedLearningNeedsDetails ?? "N/A";
    model.pfirstnameController.text =
        studentData.parent?.first.firstName ?? "N/A";
    model.plastnameController.text =
        studentData.parent?.first.lastName ?? "N/A";
    model.phoneController.text = studentData.parent?.first.mobileNo ?? "N/A";
    model.emailController.text = studentData.parent?.first.email ?? "N/A";
    model.addline1Controller.text = studentData
            .contactInfo?.residentialInformation?.first.houseBuildingNo ??
        "NA";
    model.addLine2Controller.text =
        studentData.contactInfo?.residentialInformation?.first.streetName ??
            "NA";
    model.cityController.text =
        studentData.contactInfo?.residentialInformation?.first.city ?? "NA";
    model.statesController.text =
        studentData.contactInfo?.residentialInformation?.first.state ?? "NA";
    model.pinController.text = studentData
            .contactInfo?.residentialInformation?.first.pincode
            .toString() ??
        "NA";

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
              StudentImageInfo(active:"Active",  name:  studentData.profile!.firstName!+" "+studentData.profile!.lastName!,img: studentData.profile!.profileImageUrl,rollno: studentData.profile!.crtEnrOn,),
              SizedBox(height: 16.h),
              Infotitlerow(
                infoText: "Basic Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "School Name",
                  controllerleft: model.schoolController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return "School name cannot be empty";
                    }
                    return null;
                  },
                  labelText2: "Date Of Birth",
                  controllerRight: model.dobController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Date Of Birth cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Board",
                  controllerleft: model.boardController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Board cannot be empty";
                    }
                    return null;
                  },
                  labelText2: "Course",
                  controllerRight: model.courseController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Course cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Grade",
                  controllerleft: model.gradeController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Grade cannot be empty";
                    }
                    return null;
                  },
                  labelText2: "Division",
                  controllerRight: model.divisionController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Division cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.shiftController,
                  labelText: "Shift",
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Shift cannot be empty";
                    }
                    return null;
                  },
                  labelText2: "House",
                  controllerRight: model.houseController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " House cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              Divider(
                color: AppColors.divider,
              ),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Medical Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.physicalController,
                  labelText: "Physical Disability",
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Physical Disability cannot be empty";
                    }
                    return null;
                  },
                  labelText2: "Medical History",
                  controllerRight: model.medicalController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Medical History cannot be empty";
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "Allergies",
                  controllerleft: model.allergyController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Allergies cannot be empty";
                    }
                    return null;
                  },
                  controllerRight: model.learningController,
                  labelText2: "Learning Needs",
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Learning Needs cannot be empty";
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              Divider(
                color: AppColors.divider,
              ),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Parent Details",
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.pfirstnameController,
                  labelText: "Parent First Name",
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " First Name cannot be empty";
                    }
                    return null;
                  },
                  controllerRight: model.plastnameController,
                  labelText2: "Parent Last Name",
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Last Name cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.phoneController,
                  labelText: "Phone",
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Phone cannot be empty";
                    }
                    return null;
                  },
                  controllerRight: model.emailController,
                  labelText2: "Email",
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Email cannot be empty";
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              Divider(
                color: AppColors.divider,
              ),
              SizedBox(height: 12.h),
              Infotitlerow(
                infoText: "Address",
              ),
              SizedBox(height: 12.h),
              InfoEditRow(
                  controllerleft: model.addline1Controller,
                  labelText: "Address Line 1",
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Address Line 1 cannot be empty";
                    }
                    return null;
                  },
                  controllerRight: model.addLine2Controller,
                  labelText2: "Address Line 2",
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " Address Line 2 cannot be empty";
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: "City",
                  controllerleft: model.cityController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " City cannot be empty";
                    }
                    return null;
                  },
                  controllerRight: model.statesController,
                  labelText2: "States",
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return " States cannot be empty";
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CommonTextFormField(
                    showAstreik: true,
                    labelText: "PinCode",
                    controller: model.pinController,
                    maxLength: 6,
                  )),
              SizedBox(height: 16.h),
              Divider(
                color: AppColors.divider,
              ),
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
                            Stack(children: [
                              InkWell(
                                onTap: () {
                                  CommonPopups().showEdit(context, () {});
                                },
                                child: CommonImageWidget(
                                    imageUrl: "",
                                    clipBehavior: Clip.hardEdge,
                                    imageWidth: 80,
                                    imageHeight: 70),
                              ),
                              Positioned(
                                  bottom: -20,
                                  right: 1.w,
                                  child: SvgPicture.asset(
                                    AppImages.edit,
                                    height: 26,
                                    width: 26,
                                  )),
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
        ));
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

