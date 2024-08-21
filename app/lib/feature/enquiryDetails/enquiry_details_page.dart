import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_view.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesDetailsPage extends BasePage<EnquiriesDetailsPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  const EnquiriesDetailsPage({super.key,required this.enquiryDetailArgs});

  @override
  EnquiriesDetailsPageState createState() => EnquiriesDetailsPageState();
}

class EnquiriesDetailsPageState
    extends AppBasePageState<EnquiriesDetailsPageModel, EnquiriesDetailsPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<EnquiriesDetailsPageModel> provideBase() {
    return enquiriesDetailsPageModelProvider;
  }

  @override
  void onModelReady(EnquiriesDetailsPageModel model) {
    model.tabController = TabController(length: 2, vsync: this);
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    if(widget.enquiryDetailArgs.enquiryType == "IVT"){
      model.getIvtDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
    }
    else if(widget.enquiryDetailArgs.enquiryType == "PSA"){
      model.getPsaDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
    }
    else{
      model.getNewAdmissionDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
    }
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesDetailsPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiries Details',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesDetailsPageModel model) {
    return EnquiriesDetailsPageView(provideBase(),widget.enquiryDetailArgs);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildFloatingButton(EnquiriesDetailsPageModel model) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        if (model.selectedValue.value == 1) {
                          model.selectedValue.add(model.selectedValue.value-1);
                          if(widget.enquiryDetailArgs.enquiryType == "IVT"){
                              model.getIvtDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'',);
                            }
                            else if(widget.enquiryDetailArgs.enquiryType == "PSA"){
                              model.getPsaDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                            } 
                            else{
                              model.getNewAdmissionDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                            }
                        }
                        else{
                          Navigator.pop(context);
                        }
                      },
                      text: model.selectedValue.value == 0 ? 'Cancel' : 'Go Back',
                      borderColor: Theme.of(context).primaryColor,
                      borderWidth: 1,
                      width: 171.w,
                      height: 40.h,
                      textColor: Theme.of(context).primaryColor,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        if(model.selectedValue.value==0){
                          
                          model.getEnquiryDetail(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                          if(widget.enquiryDetailArgs.enquiryType == "IVT"){
                            IvtDetailResponseEntity ivtDetail = IvtDetailResponseEntity();
                            ivtDetail.schoolLocation = CommonDataEntity(id: 1, value: "School Location");
                            ivtDetail.studentDetails?.firstName = model.studentFirstNameController.text; 
                            ivtDetail.studentDetails?.lastName = model.studentLastNameController.text; 
                            ivtDetail.studentDetails?.dob = model.dobController.text; 
                            ivtDetail.studentDetails?.gender = CommonDataEntity(id: 1, value: "Male");
                            ivtDetail.studentDetails?.grade = CommonDataEntity(id: 1, value: "Grade");
                            ivtDetail.existingSchoolDetails?.name = CommonDataEntity(id: 1, value: model.existingSchoolNameController.text);
                            ivtDetail.existingSchoolDetails?.grade = CommonDataEntity(id: 1, value: model.selectedExistingSchoolGradeSubject.value);
                            ivtDetail.existingSchoolDetails?.board = CommonDataEntity(id: 1, value: model.selectedExistingSchoolBoardSubject.value);
                            ivtDetail.board = CommonDataEntity(id: 1, value: model.selectedExistingSchoolBoardSubject.value);
                            ivtDetail.course = CommonDataEntity(id: 1, value: "Course");
                            ivtDetail.stream = CommonDataEntity(id: 1, value: "Stream");
                            ivtDetail.shift = CommonDataEntity(id: 1, value: "Shift");
                            model.updateIvtDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'', ivtDetail: ivtDetail);
                          }
                          else if(widget.enquiryDetailArgs.enquiryType == "PSA"){
                            PsaDetailResponseEntity psaDetail = PsaDetailResponseEntity();
                            psaDetail.schoolLocation = CommonDataEntity(id: 1, value: "School Location");
                            psaDetail.studentDetails?.firstName = model.studentFirstNameController.text; 
                            psaDetail.studentDetails?.lastName = model.studentLastNameController.text; 
                            psaDetail.studentDetails?.dob = model.dobController.text; 
                            psaDetail.studentDetails?.gender = CommonDataEntity(id: 1, value: "Male");
                            psaDetail.studentDetails?.grade = CommonDataEntity(id: 1, value: "Grade");
                            psaDetail.existingSchoolDetails?.name = CommonDataEntity(id: 1, value: model.existingSchoolNameController.text);
                            psaDetail.existingSchoolDetails?.grade = CommonDataEntity(id: 1, value: model.selectedExistingSchoolGradeSubject.value);
                            psaDetail.existingSchoolDetails?.board = CommonDataEntity(id: 1, value: model.selectedExistingSchoolBoardSubject.value);
                            psaDetail.psaBatch = CommonDataEntity(id: 1, value: "PSA Batch");
                            psaDetail.psaCategory = CommonDataEntity(id: 1, value: "PSA Category");
                            psaDetail.psaSubCategory = CommonDataEntity(id: 1, value: "PSA Sub Category");
                            psaDetail.psaSubType = CommonDataEntity(id: 1, value: "PSA Sub Type");
                            psaDetail.psaPeriodOfService = CommonDataEntity(id: 1, value: "PSA Period Of Service");
                            model.updatePsaDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'', psaDetail: psaDetail);
                          }
                          else{
                            NewAdmissionDetailEntity newAdmissionDetail = NewAdmissionDetailEntity();
                            newAdmissionDetail.schoolLocation = CommonDataEntity(id: 1, value: "School Location");
                            newAdmissionDetail.studentDetails?.firstName = model.studentFirstNameController.text; 
                            newAdmissionDetail.studentDetails?.lastName = model.studentLastNameController.text; 
                            newAdmissionDetail.studentDetails?.dob = model.dobController.text; 
                            newAdmissionDetail.studentDetails?.gender = CommonDataEntity(id: 1, value: "Male");
                            newAdmissionDetail.studentDetails?.grade = CommonDataEntity(id: 1, value: "Grade");
                            newAdmissionDetail.existingSchoolDetails?.name = CommonDataEntity(id: 1, value: model.existingSchoolNameController.text);
                            newAdmissionDetail.existingSchoolDetails?.grade = CommonDataEntity(id: 1, value: model.selectedExistingSchoolGradeSubject.value);
                            newAdmissionDetail.existingSchoolDetails?.board = CommonDataEntity(id: 1, value: model.selectedExistingSchoolBoardSubject.value);
                            model.updateNewAdmissionDetails(enquiryID: widget.enquiryDetailArgs.enquiryId??'', newAdmissionDetail: newAdmissionDetail);
                          }
                          model.selectedValue.add(model.selectedValue.value+1);
                        }
                        else{
                          Navigator.pop(context);
                        }
                      },
                      text: 'Next',
                      backgroundColor: AppColors.accent,
                      width: 171.w,
                      height: 40.h,
                      textColor: AppColors.accentOn,
                    ),
                  ],
                ))
            : AppStreamBuilder<bool>(
                stream: model.showMenuOnFloatingButton,
                initialData: model.showMenuOnFloatingButton.value,
                dataBuilder: (context, data) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                        height: 56.h,
                        width: 130.w,
                        child: CommonElevatedButton(
                          onPressed: () {
                            if (model.showMenuOnFloatingButton.value) {
                              model.showMenuOnFloatingButton.add(false);
                            } else {
                              model.showMenuOnFloatingButton.add(true);
                            }
                          },
                          text: data! ? 'Close' : 'Action',
                          icon: data ? Icons.close : Icons.add,
                          borderRadius: BorderRadius.circular(10),
                          textColor: Theme.of(context).colorScheme.onTertiary,
                          backgroundColor: AppColors.accent,
                          textStyle: AppTypography.subtitle2.copyWith(
                              color: Theme.of(context).colorScheme.onTertiary),
                        )),
                  );
                },
              );
      },
    );
  }

  @override
  Widget? buildBottomNavigationBar(EnquiriesDetailsPageModel model) {
    
    return super.buildBottomNavigationBar(model);
  }
}
