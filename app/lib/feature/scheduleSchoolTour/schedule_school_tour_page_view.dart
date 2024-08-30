import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/school_tour_scheduled_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_calendar/common_calendar_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';


class ScheduleSchoolTourPageView
    extends BasePageViewWidget<ScheduleSchoolTourPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final SchoolVisitDetail? schoolVisitDetail;
  final bool isReschedule;
  ScheduleSchoolTourPageView(super.providerBase,{required this.enquiryDetailArgs,this.schoolVisitDetail,this.isReschedule = false});
  @override
  Widget build(BuildContext context, ScheduleSchoolTourPageModel model) {

    return AppStreamBuilder<Resource<SchoolVisitDetailBase>>(
      stream: model.scheduleSchoolVisit,
      initialData: Resource.none(),
      onData: (value) {
        if (value.status == Status.success) {
          if(isReschedule){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('School tour rescheduled successfully')),
            );
            schoolVisitDetail?.schoolVisitDate = DateFormat('dd-MM-yyyy').parse(model.selectedDate).toIso8601String();
            schoolVisitDetail?.slot = model.selectedTime;
            schoolVisitDetail?.slotId = model.slotId;
            schoolVisitDetail?.comment = model.commentController.text.trim();
            Navigator.of(context).pop(schoolVisitDetail);
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('School tour scheduled successfully')),
            );
            Navigator.pop(context,true);
          }
        }
      },
      dataBuilder: (context, snapshot) {
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
                            model.selectedDate = date;
                            model.fetchTimeSlotsSchoolVisit(date, enquiryDetailArgs.enquiryId??'');
                          }),
                          isReschedule? SchoolTourScheduledDetailsWidget(schoolVisitDetail: schoolVisitDetail??SchoolVisitDetail()) : const SizedBox.shrink(),
                          const SizedBox(
                            height: 16,
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
                          AppStreamBuilder<Resource<Slots>>(
                            stream: model.timeSlots,
                            initialData: Resource.none(),
                            dataBuilder: (context, snapshot) {
                              if(snapshot?.status == Status.loading){
                                return const Center(child: CircularProgressIndicator(),);
                              }
                              if(snapshot?.status == Status.success){
                                return ((snapshot?.data?.data??[]).isEmpty) ?  const CommonText(text: "Slots are not available"): StreamBuilder<int>(
                                  stream: model.selectedTimeIndex,
                                  builder: (context, snapshot) {
                                    return SizedBox(
                                      height: 90,
                                      child: GridView.builder(
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 0.45
                                          ),
                                          itemCount: model.schoolVisitTimeSlots.value.length,
                                          scrollDirection: Axis.horizontal, // Number of items
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                model.selectedTimeIndex.add(index);
                                                model.slotId = model.schoolVisitTimeSlots.value[index].id??'';
                                                model.selectedTime = model.schoolVisitTimeSlots.value[index].slot??'';
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: index==model.selectedTimeIndex.value?AppColors.primaryLighter:Colors.white, //Color(0xffA3A3A3)
                                                    border: Border.all(width: 1,color: index==model.selectedTimeIndex.value?Theme.of(context).primaryColor:AppColors.textLightGray)
                                                ),
                                                child: CommonText(
                                                  text: model.schoolVisitTimeSlots.value[index].slot??'',
                                                  style: AppTypography.subtitle2.copyWith(
                                                      color: index==model.selectedTimeIndex.value?Theme.of(context).primaryColor:AppColors.textGray
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  }
                                );  
                              }
                              else{
                                return const CommonText(text: "Slots are not available");
                              }
                            }
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 48,
                            child: CommonTextFormField(
                              controller: model.commentController,
                              showAstreik: true,
                              labelText: "Comment",
                              hintText: "Add Comment",
                              
                              validator:(value)=> AppValidators.validateNotEmpty(value, "comment"),
                            ),
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
                              isReschedule? 'Confirm Reschedule Details':'Confirm Appointment Details',
                              'Please Confirm the below details',
                              'Date: ${model.dateFormat.format(DateTime.parse(model.selectedDate.split('-').reversed.join('-')))}',
                              'Selected Time: ${model.selectedTime}',
                              'Comments: ${model.commentController.text}',
                              (shouldRoute) {
                                if(isReschedule){
                                    model.rescheduleSchoolTour(enquiryID: enquiryDetailArgs.enquiryId??'',slotid:model.slotId ,Date:model.selectedDate);
                                } else{
                                    model.scheduleSchoolTour(enquiryID:enquiryDetailArgs.enquiryId??'',slotid:model.slotId ,Date:model.selectedDate);
                                }
                              },
                            );
                          }
        
                        },
                        text:isReschedule? 'Reschedule Tour': 'Book Tour',
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
            if(snapshot?.status == Status.loading)...[const CommonAppLoader()]
          ],
        );
      }
    );
  }
}
