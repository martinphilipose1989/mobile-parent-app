import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page_model.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page_view.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ScheduleCompetencyTestPage extends BasePage<CompetencyTestModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final CompetencyTestDetails? competencyTestDetails;
  final bool isReschedule;
  const ScheduleCompetencyTestPage({super.key,required this.enquiryDetailArgs,this.competencyTestDetails,this.isReschedule = false});

  @override
  ScheduleCompetencyTestPageState createState() => ScheduleCompetencyTestPageState();
}

class ScheduleCompetencyTestPageState extends AppBasePageState<CompetencyTestModel, ScheduleCompetencyTestPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<CompetencyTestModel> provideBase() {
    return scheduleCompetencyTestPageModelProvider;
  }

  @override
  void onModelReady(CompetencyTestModel model) {
    model.enquiryID = widget.enquiryDetailArgs.enquiryId??'';
    model.isReschedule == widget.isReschedule;
    model.context = context;
model.getEnquiryDetail(enquiryID: model.enquiryID);
    if(widget.isReschedule){
      model.competencyTestDetail = widget.competencyTestDetails;
      model.selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.parse((widget.competencyTestDetails?.competencyTestDate??DateTime.now().toString())));
      model.selectedMode = widget.competencyTestDetails?.mode??'';
      model.fetchTimeSlots(model.selectedDate, widget.enquiryDetailArgs.enquiryId??'');
    }
    else{
      model.fetchTimeSlots(DateFormat('dd-MM-yyyy').format(DateTime.now()), widget.enquiryDetailArgs.enquiryId??'');
      model.getDefaultDate();
    }
    model.getDefaultDate();
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(CompetencyTestModel model) {
    return CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: widget.isReschedule? 'Reschedule Competency Test' : 'Book Competency Test',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, CompetencyTestModel model) {
    return ScheduleCompetencyTestPageView(provideBase(),enquiryDetailArgs: widget.enquiryDetailArgs,competencyTestDetails: widget.competencyTestDetails,isReschedule: widget.isReschedule,);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildBottomNavigationBar(CompetencyTestModel model) {
    return Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(!widget.isReschedule)...[CommonElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        borderColor: Theme.of(context).primaryColor,
                        borderWidth: 1,
                        width: 171.w,
                        height: 40.h,
                        textColor: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),],
                      CommonElevatedButton(
                        onPressed: () {                      
                            String data = model.validateForm();
                            if(data.isNotEmpty){
                              final snackBar = SnackBar(
                                content: Text(data),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else {
                              CommonPopups().showConfirm(
                                context,
                                widget.isReschedule? 'Confirm Reschedule Details':'Confirm Test Details',
                                'Please Confirm the below details',
                                'Date: ${model.dateFormat.format(DateTime.parse(model.selectedDate.split('-').reversed.join('-')))}',
                                'Selected Time: ${model.selectedTime}',
                                'Mode: ${model.selectedMode}',
                                (shouldRoute) {
                                  if(widget.isReschedule){
                                    model.rescheduleCompetencyTest(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                                  } else {
                                    model.scheduleCompetencyTest(enquiryID: widget.enquiryDetailArgs.enquiryId??'');
                                  }
                                },
                              );
                            }
                        },
                        text: widget.isReschedule? 'Reschedule Test': 'Book Test',
                        backgroundColor: AppColors.accent,
                        width: 171.w,
                        height: 40.h,
                        textColor: AppColors.accentOn,
                      ),
                    ],
                  ),
                ),
              );
  }
}
