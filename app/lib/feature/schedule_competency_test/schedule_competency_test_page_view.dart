import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/schedule_competency_test/schedule_competency_test_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/competency_test_schedule_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_calendar/common_calendar_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';


class ScheduleCompetencyTestPageView
    extends BasePageViewWidget<CompetencyTestModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final CompetencyTestDetails? competencyTestDetails;
  final bool isReschedule;
  ScheduleCompetencyTestPageView(super.providerBase,{required this.enquiryDetailArgs,this.competencyTestDetails,this.isReschedule = false});
  @override
  Widget build(BuildContext context, CompetencyTestModel model) {
    return AppStreamBuilder<Resource<CompetencyTestDetailBase>>(
      stream: model.createCompetencyTest,
      initialData: Resource.none(),
      onData: (value) {
        if (value.status == Status.success) {
          if(isReschedule){
            ProviderScope.containerOf(context)
                  .read(admissionsDetailsProvider(enquiryDetailArgs))
                  .getAdmissionJourney(
                      enquiryID: enquiryDetailArgs.enquiryId ?? '',
                      type: 'admission');
            competencyTestDetails?.competencyTestDate = DateFormat('dd-MM-yyyy').parse(model.selectedDate).toIso8601String();
            competencyTestDetails?.slot = model.selectedTime;
            competencyTestDetails?.slotID = model.slotID;
            competencyTestDetails?.mode = model.selectedMode;
            Navigator.of(context).pop(competencyTestDetails);
          }
          else{
            ProviderScope.containerOf(context)
                  .read(admissionsDetailsProvider(enquiryDetailArgs))
                  .getAdmissionJourney(
                      enquiryID: enquiryDetailArgs.enquiryId ?? '',
                      type: 'admission');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Competency test scheduled successfully')),
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
                                subtitle: "${snapshot?.data?.data?.grade} | ${snapshot?.data?.data?.existingSchoolBoard} | ${enquiryDetailArgs.shift} | Stream-${enquiryDetailArgs.stream}",
                                buttontext: snapshot?.data?.data?.currentStage??'',

                                status: enquiryDetailArgs.status??'',
                              );
                            }, initialData: Resource.none(),
                          ),
                          // ListItem(
                          //     image: AppImages.personIcon,
                          //     name: enquiryDetailArgs.studentName??'',
                          //     year: enquiryDetailArgs.academicYear??'',
                          //     id: enquiryDetailArgs.enquiryNumber??'',
                          //     title: enquiryDetailArgs.studentName??'',
                          //     subtitle: "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board} | ${enquiryDetailArgs.shift} | Stream-${enquiryDetailArgs.stream}",
                          //     buttontext: enquiryDetailArgs.currentStage??'',
                          //     status: enquiryDetailArgs.status??'',),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isReschedule? CompetencyTestScheduledDetailsWidget(competencyTestDetails: competencyTestDetails??CompetencyTestDetails()) : const SizedBox.shrink(),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonCalendarPage(
                            initialDate: DateTime.parse((competencyTestDetails?.competencyTestDate??DateTime.now().toString())),
                            onDateSelected: (date) {
                            model.selectedDate=date;
                            model.selectedTime = '';
                            model.selectedTimeIndex.value = 0;
                            model.fetchTimeSlots(date, enquiryDetailArgs.enquiryId??'');
                          }),
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
                            text: isReschedule? Strings.of(context).change_time: Strings.of(context).select_time,
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
                                return ((snapshot?.data?.data??[]).isEmpty)? const CommonText(text: "Slots are not available"): 
                                StreamBuilder<int>(
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
                                          itemCount: model.competenctTestSlots.value.length,
                                          scrollDirection: Axis.horizontal, // Number of items
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                model.selectedTimeIndex.add(index);
                                                model.slotID = model.competenctTestSlots.value[index].id??'';
                                                model.selectedTime = model.competenctTestSlots.value[index].slot??'';
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: index==model.selectedTimeIndex.value?AppColors.primaryLighter:Colors.white, //Color(0xffA3A3A3)
                                                    border: Border.all(width: 1,color: index==model.selectedTimeIndex.value?Theme.of(context).primaryColor:AppColors.textLightGray)
                                                ),
                                                child: CommonText(
                                                  text: model.competenctTestSlots.value[index].slot??'',
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
            if(snapshot?.status == Status.loading)...[const CommonAppLoader()]
          ],
        );
      }
    );
  }
}
