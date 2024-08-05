import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/molecules/DetailsViewSchoolTour/school_tour_scheduled_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CancelSchoolTourPageView
    extends BasePageViewWidget<CancelSchoolTourPageModel> {
  CancelSchoolTourPageView(super.providerBase);
  @override
  Widget build(BuildContext context, CancelSchoolTourPageModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListItem(
                      image: AppImages.personIcon,
                      name: "Rajeev",
                      year: "AY 2024-2025",
                      id: "ENADMS#4402",
                      title: "Vibgyor Kids & High - Malad West",
                      subtitle: "Grade V | CBSE",
                      buttontext: "School Visit"),
                  const SizedBox(
                    height: 10,
                  ),
                  const SchoolTourScheduledDetailsWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    child: CustomDropdownButton(
                      width: MediaQuery.of(context).size.width,
                      onMultiSelect: (selectedValues) {},
                      dropdownName: 'Select Academic year',
                      showAstreik: true,
                      showBorderColor: true,
                      items: model.reasonTypes,
                      onSingleSelect: (selectedValue) {
                        if (model.reasonTypes.contains(selectedValue)) {
                          model.selectedReasonType.add(true);
                        }
                      },
                      isMutiSelect: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 48,
                    child: const CommonTextFormField(
                      showAstreik: true,
                      labelText: "Comment",
                      hintText: "",
                    ),
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
              child: CommonElevatedButton(
                onPressed: () {},
                text: 'Cancel Tour',
                backgroundColor: AppColors.accent,
                width: MediaQuery.of(context).size.width,
                height: 40.h,
                textColor: AppColors.accentOn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
