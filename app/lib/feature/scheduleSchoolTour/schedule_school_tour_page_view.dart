import 'package:app/feature/scheduleSchoolTour/schedule_school_tour_page_model.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/commonTime/common_time_page.dart';
import 'package:app/utils/common_calendar/common_calendar_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/DetailsViewSchoolTour/school_tour_scheduled_details.dart';

class ScheduleSchoolTourPageView
    extends BasePageViewWidget<ScheduleSchoolTourPageModel> {
  ScheduleSchoolTourPageView(super.providerBase);
  @override
  Widget build(BuildContext context, ScheduleSchoolTourPageModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                          image: AppImages.personIcon,
                          name: "Rajeev",
                          year: "AY 2024-2025",
                          id: "ENADMS#4402",
                          title: "Vibgyor Kids & High - Malad West",
                          subtitle: "Grade V | CBSE",
                          buttontext: "School Visit"),
                      SizedBox(
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
                      const CommonCalendarPage(),
                      const SizedBox(
                        height: 16,
                      ),
                      const SchoolTourScheduledDetailsWidget(),

                      /// when reschedule school tour then use this widget
                      CommonText(
                        text: "Select Time",
                        style: AppTypography.body1
                            .copyWith(color: AppColors.textDark),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CommonTimePage(),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 48,
                        child: CommonTextFormField(
                          showAstreik: true,
                          labelText: "Comment",
                          hintText: "Add Comment",
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
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Cancel',
                    borderColor: Theme.of(context).primaryColor,
                    borderWidth: 1,
                    width: 171.w,
                    height: 40.h,
                    textColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CommonElevatedButton(
                    onPressed: () {
                      CommonPopups().showConfirm(
                        context,
                        'Confirm Appointment Details',
                        'Please Confirm the below details',
                        'Date: 3 May 2024',
                        'Selected Time: 08:00 Pm',
                        'Comments: Lorem Ipsum Delo Somet',
                        (shouldRoute) {},
                      );
                    },
                    text: 'Book Tour',
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
