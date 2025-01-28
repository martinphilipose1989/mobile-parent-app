import 'package:app/di/states/viewmodels.dart';
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
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:localisation/strings.dart';
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
          if(enquiryDetailArgs.isFrom == "enquiry"){
            ProviderScope.containerOf(context)
                  .read(enquiriesAdmissionsJourneyProvider(enquiryDetailArgs))
                  .getAdmissionJourney(
                      enquiryID: enquiryDetailArgs.enquiryId ?? '',
                      type: enquiryDetailArgs.isFrom ?? 'enquiry');
          }
          else{
            ProviderScope.containerOf(context)
                  .read(admissionsDetailsProvider(enquiryDetailArgs))
                  .getAdmissionJourney(
                      enquiryID: enquiryDetailArgs.enquiryId ?? '',
                      type: enquiryDetailArgs.isFrom ?? 'enquiry');
          }
          if(isReschedule){
            ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(Strings.of(context).school_tour_rescheduled_successfully)),
            );
            schoolVisitDetail?.schoolVisitDate = DateFormat('dd-MM-yyyy').parse(model.selectedDate).toIso8601String();
            schoolVisitDetail?.slot = model.selectedTime;
            schoolVisitDetail?.slotId = model.slotId;
            schoolVisitDetail?.comment = model.commentController.text.trim();
            Navigator.of(context).pop(schoolVisitDetail);
          }
          else{
            ProviderScope.containerOf(context).read(enquiriesAdmissionsJourneyProvider(enquiryDetailArgs)).getAdmissionJourney(enquiryID: enquiryDetailArgs.enquiryId??'', type: enquiryDetailArgs.isFrom??'enquiry');

            ProviderScope.containerOf(context).read(enquiriesAdmissionsJourneyProvider(enquiryDetailArgs)).getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId??'');

            ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text(Strings.of(context).school_tour_scheduled_successfully)),
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
                          AppStreamBuilder<Resource<EnquiryDetailBase>>(
                            stream: model.fetchEnquiryDetail,
                            dataBuilder: (context, snapshot) {
                              return snapshot?.status==Status.loading?const Center(child: CircularProgressIndicator(),):
                              ListItem(
                                image: AppImages.personIcon,
                                name: "${snapshot?.data?.data?.studentFirstName} ${snapshot?.data?.data?.studentLastName}",
                                year: "${snapshot?.data?.data!.academicYearId}",
                                id: snapshot?.data?.data?.enquiryNumber??'',
                                title: snapshot?.data?.data?.existingSchoolName??'',
                                subtitle: "${snapshot?.data?.data?.grade} | ${snapshot?.data?.data?.existingSchoolBoard} | ${enquiryDetailArgs.shift} | ${Strings.of(context).stream}-${enquiryDetailArgs.stream}",
                                buttontext: snapshot?.data?.data?.currentStage??'',

                                status: enquiryDetailArgs.status??'',
                              );
                            }, initialData: Resource.none(),
                          ),
                           SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CommonCalendarPage(
                            initialDate: DateTime.parse((schoolVisitDetail?.schoolVisitDate??DateTime.now().toString())),
                            onDateSelected: (date) {
                              model.selectedTime = '';
                              model.selectedTimeIndex.value = 0; 
                            model.selectedDate = date;
                            model.fetchTimeSlotsSchoolVisit(date, enquiryDetailArgs.enquiryId??'');
                          }),
                          isReschedule? SchoolTourScheduledDetailsWidget(schoolVisitDetail: schoolVisitDetail??SchoolVisitDetail()) : const SizedBox.shrink(),
                          const SizedBox(
                            height: 16,
                          ),                      
                          /// when reschedule school tour then use this widget
                          CommonText(
                            text: isReschedule? Strings.of(context).change_time : Strings.of(context).select_time,
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
                                return ((snapshot?.data?.data??[]).isEmpty) ?  CommonText(text: Strings.of(context).slots_not_available): StreamBuilder<int>(
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
                                return  CommonText(text: Strings.of(context).slots_not_available);
                              }
                            }
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Form(
                            key: model.formKey,
                            child: CommonTextFormField(
                              controller: model.commentController,
                              showAstreik: true,
                              labelText: Strings.of(context).comment,
                              hintText: Strings.of(context).add_comment,
                              validator:(value)=> AppValidators.validateNotEmpty(value, "Comment"),
                            ),
                          ),
                        ],
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
