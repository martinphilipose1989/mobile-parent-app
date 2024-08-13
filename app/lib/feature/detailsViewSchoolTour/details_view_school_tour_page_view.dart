import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_model.dart';
import 'package:app/molecules/DetailsViewSchoolTour/school_tour_scheduled_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DetailsViewSchoolTourPageView
    extends BasePageViewWidget<DetailsViewSchoolTourPageModel> {
  DetailsViewSchoolTourPageView(super.providerBase);
  @override
  Widget build(BuildContext context, DetailsViewSchoolTourPageModel model) {
    return Stack(
      children: [
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  Column(
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
                      SchoolTourScheduledDetailsWidget(),
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
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Cancel Tour',
                    borderColor: Theme.of(context).primaryColor,
                    borderWidth: 1,
                    width: 171.w,
                    height: 40.h,
                    textColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Reschedule Tour',
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
