import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class ScheduleSchoolTourPage extends BasePage<ScheduleSchoolTourPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final SchoolVisitDetail? schoolVisitDetail;
  final bool isReschedule;
  const ScheduleSchoolTourPage({super.key,required this.enquiryDetailArgs,this.schoolVisitDetail,this.isReschedule = false});

  @override
  ScheduleSchoolTourPageState createState() => ScheduleSchoolTourPageState();
}

class ScheduleSchoolTourPageState extends AppBasePageState<ScheduleSchoolTourPageModel, ScheduleSchoolTourPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<ScheduleSchoolTourPageModel> provideBase() {
    return scheduleSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(ScheduleSchoolTourPageModel model) {
    model.enquiryID = widget.enquiryDetailArgs.enquiryId??'';
    model.isReschedule == widget.isReschedule;

    if(widget.isReschedule){
      model.schoolVisitDetails = widget.schoolVisitDetail;
      model.selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.parse((widget.schoolVisitDetail?.schoolVisitDate??DateTime.now().toString())));
      model.commentController.text = widget.schoolVisitDetail?.comment??'';
      model.fetchTimeSlotsSchoolVisit(model.selectedDate, widget.enquiryDetailArgs.enquiryId??'');
    }
    else{
      model.fetchTimeSlotsSchoolVisit(DateFormat('dd-MM-yyyy').format(DateTime.now()), widget.enquiryDetailArgs.enquiryId??'');
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
      appbarTitle: widget.isReschedule? 'Reschedule School Visit' : 'Schedule School Visit',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, ScheduleSchoolTourPageModel model) {
    return ScheduleSchoolTourPageView(provideBase(),enquiryDetailArgs: widget.enquiryDetailArgs,schoolVisitDetail: widget.schoolVisitDetail,isReschedule: widget.isReschedule,);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
