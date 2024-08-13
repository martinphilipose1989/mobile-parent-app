import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page_model.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/commonTime/common_time_page.dart';
import 'package:app/utils/common_calendar/common_calendar_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';


class ScheduleCompetencyTestPageView
    extends BasePageViewWidget<CompetencyTestModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final CompetencyTestDetails? competencyTestDetails;
  final bool isReschedule;
  ScheduleCompetencyTestPageView(super.providerBase,{required this.enquiryDetailArgs,this.competencyTestDetails,this.isReschedule = false});
  @override
  Widget build(BuildContext context, CompetencyTestModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                          image: AppImages.personIcon,
                          name: enquiryDetailArgs.studentName??'',
                          year: enquiryDetailArgs.academicYear??'',
                          id: enquiryDetailArgs.enquiryId??'',
                          title: enquiryDetailArgs.studentName??'',
                          subtitle: "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board}",
                          buttontext: enquiryDetailArgs.enquiryStage??''),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CommonCalendarPage(onDateSelected: (date) {
                        model.setSelectedDate(date);
                      }),
                      // isReschedule? SchoolTourScheduledDetailsWidget(schoolVisitDetail: schoolVisitDetail??SchoolVisitDetail()) : const SizedBox.shrink(),
                      const SizedBox(
                        height: 16,
                      ),                      
                      StreamBuilder<String>(
                        stream: model.selectedModeSubject,
                        builder: (context, snapshot) {
                          return Row(
                            children: model.testMode.map((mode) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: mode,
                                      groupValue: model.selectedMode,
                                      onChanged: (value) => model.setSelectedMode(value!),
                                    ),
                                    CommonText(text: mode),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }
                      ),
                      /// when reschedule school tour then use this widget
                      CommonText(
                        text: isReschedule? "Change Time" : "Select Time",
                        style: AppTypography.body1
                            .copyWith(color: AppColors.textDark),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonTimePage(onTimeSelected: (time) {
                        model.setSelectedTime(time);
                      }, isSchoolVisit: false,),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!isReschedule)...[CommonElevatedButton(
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
                      if (model.validateForm()) {
                        CommonPopups().showConfirm(
                          context,
                          isReschedule? 'Confirm Reschedule Details':'Confirm Test Details',
                          'Please Confirm the below details',
                          'Date: ${model.dateFormat.format(DateTime.parse(model.selectedDate))}',
                          'Selected Time: ${model.selectedTime}',
                          'Mode: ${model.selectedMode}',
                          (shouldRoute) {
                            model.scheduleCompetencyTest(enquiryID: enquiryDetailArgs.enquiryId??'');
                          },
                        );
                      }
                    },
                    text:isReschedule? 'Reschedule Test': 'Book Test',
                    backgroundColor: AppColors.accent,
                    width: 171.w,
                    height: 40.h,
                    textColor: AppColors.accentOn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
