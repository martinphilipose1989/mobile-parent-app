// ignore_for_file: use_super_parameters

import '../../molecules/student/InfoTitleRow.dart';
import '../../molecules/student/infoEditRow.dart';
import 'package:app/themes_setup.dart';

import '../../utils/common_widgets/common_image_widget.dart';
import '../../utils/common_widgets/common_textformfield_widget.dart';

import '../../utils/common_widgets/common_image_widget.dart';
import '../../utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/student/student_image_info.dart';
import 'student_profile_edit_page_viewmodel.dart';

class StudentProfileEditView
    extends BasePageViewWidget<StudentProfileEditViewModel> {
  final StudentData studentData;
final List<BearerResponse> bearerList;
  StudentProfileEditView(
    ProviderBase<StudentProfileEditViewModel> model,
    this.studentData, this.bearerList,
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



    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StudentImageInfo(active:"Active",  name:  studentData.profile!.firstName!+" "+studentData.profile!.lastName!,img: studentData.profile!.profileImageUrl,rollno: studentData.profile!.crtEnrOn,),
              SizedBox(height: 16.h),
              Infotitlerow(
                infoText: Strings.of(context).basic_detail,
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: Strings.of(context).school_name,
                  controllerleft: model.schoolController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).school_name_cannot_empty;
                    }
                    return null;
                  },
                  labelText2: Strings.of(context).date_of_birth,
                  controllerRight: model.dobController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).date_of_birth;
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: Strings.of(context).board,
                  controllerleft: model.boardController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).board_cannot_be_empty;
                    }
                    return null;
                  },
                  labelText2: Strings.of(context).course,
                  controllerRight: model.courseController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).course_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: Strings.of(context).grade,
                  controllerleft: model.gradeController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).grade_cannot_be_empty;
                    }
                    return null;
                  },
                  labelText2: Strings.of(context).division,
                  controllerRight: model.divisionController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).division_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.shiftController,
                  labelText: Strings.of(context).shift,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).shift_cannot_be_empty;
                    }
                    return null;
                  },
                  labelText2: Strings.of(context).house,
                  controllerRight: model.houseController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).house_cannot_be_empty;
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
                infoText: Strings.of(context).medical_details,
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.physicalController,
                  labelText: Strings.of(context).physical_disability,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).physical_disability_cannot_be_empty;
                    }
                    return null;
                  },
                  labelText2: Strings.of(context).medical_history,
                  controllerRight: model.medicalController,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).medical_history_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: Strings.of(context).allergies,
                  controllerleft: model.allergyController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).allergies_cannot_be_empty;
                    }
                    return null;
                  },
                  controllerRight: model.learningController,
                  labelText2: Strings.of(context).learning_needs,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).learning_needs_cannot_be_empty;
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
                infoText: Strings.of(context).parent_details,
              ),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.pfirstnameController,
                  labelText: Strings.of(context).parent_First_name,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).first_name_cannot_be_empty;
                    }
                    return null;
                  },
                  controllerRight: model.plastnameController,
                  labelText2: Strings.of(context).parent_last_name,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).last_name_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: true),
              SizedBox(height: 16.h),
              InfoEditRow(
                  controllerleft: model.phoneController,
                  labelText: Strings.of(context).phone,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).phone_cannot_be_empty;
                    }
                    return null;
                  },
                  controllerRight: model.emailController,
                  labelText2: Strings.of(context).email,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).email_cannot_be_empty;
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
                infoText: Strings.of(context).address,
              ),
              SizedBox(height: 12.h),
              InfoEditRow(
                  controllerleft: model.addline1Controller,
                  labelText: Strings.of(context).address_Line_1,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).address_Line1_cannot_be_empty;
                    }
                    return null;
                  },
                  controllerRight: model.addLine2Controller,
                  labelText2: Strings.of(context).address_Line_2,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).address_Line2_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              InfoEditRow(
                  labelText: Strings.of(context).city,
                  controllerleft: model.cityController,
                  validatorleft: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).city_cannot_be_empty;
                    }
                    return null;
                  },
                  controllerRight: model.statesController,
                  labelText2: Strings.of(context).state,
                  validatorright: (value) {
                    if (Validator.isEmpty(value!)) {
                      return Strings.of(context).state_cannot_be_empty;
                    }
                    return null;
                  },
                  readOnly: false),
              SizedBox(height: 16.h),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CommonTextFormField(
                    showAstreik: true,
                    labelText: Strings.of(context).pincode,
                    controller: model.pinController,
                    maxLength: 6,
                  )),
              SizedBox(height: 16.h),
              Divider(
                color: AppColors.divider,
              ),
              SizedBox(height: 16.h),
              Infotitlerow(
                infoText: Strings.of(context).bearers,
              ),
              SizedBox(
                height: 150,
                width: 1.sw,
                child: BearerList(bearerList: bearerList, studentId: studentData.profile?.id??0, model: model)
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
      height: 200.h,
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
                      imageWidth: 50.h,
                      imageHeight: 50.h),
                  SizedBox(height: 12.w),
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



