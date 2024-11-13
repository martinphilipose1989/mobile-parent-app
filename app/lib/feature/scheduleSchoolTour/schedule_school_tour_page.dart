import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_view.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ScheduleSchoolTourPage extends BasePage<ScheduleSchoolTourPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final SchoolVisitDetail? schoolVisitDetail;
  final bool isReschedule;
  const ScheduleSchoolTourPage(
      {super.key,
      required this.enquiryDetailArgs,
      this.schoolVisitDetail,
      this.isReschedule = false});

  @override
  ScheduleSchoolTourPageState createState() => ScheduleSchoolTourPageState();
}

class ScheduleSchoolTourPageState extends AppBasePageState<
    ScheduleSchoolTourPageModel,
    ScheduleSchoolTourPage> with SingleTickerProviderStateMixin {
  @override
  ProviderBase<ScheduleSchoolTourPageModel> provideBase() {
    return scheduleSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(ScheduleSchoolTourPageModel model) {
    model.enquiryID = widget.enquiryDetailArgs.enquiryId ?? '';
    model.isReschedule == widget.isReschedule;
    model.context = context;

    if (widget.isReschedule) {
      model.schoolVisitDetails = widget.schoolVisitDetail;
      model.selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.parse(
          (widget.schoolVisitDetail?.schoolVisitDate ??
              DateTime.now().toString())));
      model.commentController.text = widget.schoolVisitDetail?.comment ?? '';
      model.fetchTimeSlotsSchoolVisit(
          model.selectedDate, widget.enquiryDetailArgs.enquiryId ?? '');
    } else {
      model.fetchTimeSlotsSchoolVisit(
          DateFormat('dd-MM-yyyy').format(DateTime.now()),
          widget.enquiryDetailArgs.enquiryId ?? '');
      model.getDefaultDate();
    }
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(ScheduleSchoolTourPageModel model) {
    return CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: widget.isReschedule
          ? 'Reschedule School Tour'
          : 'Schedule School Tour',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, ScheduleSchoolTourPageModel model) {
    return ScheduleSchoolTourPageView(
      provideBase(),
      enquiryDetailArgs: widget.enquiryDetailArgs,
      schoolVisitDetail: widget.schoolVisitDetail,
      isReschedule: widget.isReschedule,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildBottomNavigationBar(ScheduleSchoolTourPageModel model) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!widget.isReschedule) ...[
              AppStreamBuilder<Resource<SchoolVisitDetail>>(
                  initialData: Resource.none(),
                  stream: model.schoolVisitDetail,
                  dataBuilder: (context, schoolVisit) {
                    return CommonElevatedButton(
                      isDisabled: schoolVisit?.status == Status.loading,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      borderColor: Theme.of(context).primaryColor,
                      borderWidth: 1,
                      width: 171.w,
                      height: 40.h,
                      textColor: Theme.of(context).primaryColor,
                    );
                  }),
              const SizedBox(
                width: 10,
              ),
            ],
            AppStreamBuilder<Resource<SchoolVisitDetail>>(
                initialData: Resource.none(),
                stream: model.schoolVisitDetail,
                dataBuilder: (context, schoolVisit) {
                  return CommonElevatedButton(
                    isDisabled: schoolVisit?.status == Status.loading,
                    onPressed: () {
                      if (model.formKey.currentState!.validate()) {
                        var data = model.validateForm();
                        if (data.isNotEmpty) {
                          final snackBar = SnackBar(
                            content: Text(data),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          CommonPopups().showConfirm(
                            context,
                            widget.isReschedule
                                ? 'Confirm Reschedule Details'
                                : 'Confirm Appointment Details',
                            'Please Confirm the below details',
                            'Date: ${model.dateFormat.format(DateTime.parse(model.selectedDate.split('-').reversed.join('-')))}',
                            'Selected Time: ${model.selectedTime}',
                            'Comments: ${model.commentController.text}',
                            (shouldRoute) {
                              if (widget.isReschedule) {
                                model.rescheduleSchoolTour(
                                    enquiryID:
                                        widget.enquiryDetailArgs.enquiryId ??
                                            '',
                                    slotid: model.slotId,
                                    Date: model.selectedDate);
                              } else {
                                model.scheduleSchoolTour(
                                    enquiryID:
                                        widget.enquiryDetailArgs.enquiryId ??
                                            '',
                                    slotid: model.slotId,
                                    Date: model.selectedDate);
                              }
                            },
                          );
                        }
                      }
                    },
                    text: widget.isReschedule ? 'Reschedule Tour' : 'Book Tour',
                    backgroundColor: AppColors.accent,
                    width: 171.w,
                    height: 40.h,
                    textColor: AppColors.accentOn,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
