import 'package:app/feature/cancel_competency_test/cancel_competency_test_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/molecules/DetailsViewSchoolTour/competency_test_schedule_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CancelCompetencyTestPageView
    extends BasePageViewWidget<CancelCompetencyPageModel> {
  final CompetencyTestDetails competencyTestDetail;
  final EnquiryDetailArgs enquiryDetailArgs;
  CancelCompetencyTestPageView(super.providerBase,this.competencyTestDetail,this.enquiryDetailArgs);
  @override
  Widget build(BuildContext context, CancelCompetencyPageModel model) {
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
                  ListItem(
                      image: AppImages.personIcon,
                      name: enquiryDetailArgs.studentName??'',
                      year: enquiryDetailArgs.academicYear??'',
                      id: enquiryDetailArgs.enquiryId??'',
                      title: enquiryDetailArgs.school??'',
                      subtitle: "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board}",
                      buttontext: enquiryDetailArgs.enquiryStage??''),
                  const SizedBox(
                    height: 10,
                  ),
                  CompetencyTestScheduledDetailsWidget(competencyTestDetails: competencyTestDetail,),
                  const SizedBox(
                    height: 10,
                  ),
                  const CommonText(text: "Cancel Test"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    child: CustomDropdownButton(
                      width: MediaQuery.of(context).size.width,
                      onMultiSelect: (selectedValues) {},
                      dropdownName: 'Reason For Cancellation',
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
                  const SizedBox(
                    height: 48,
                    child: CommonTextFormField(
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
                onPressed: () {
                  if(model.validateForm()){
                    CommonPopups().showConfirm(
                          context,
                          'Confirm Cancellation Details',
                          'Please Confirm the below details',
                          'Date: ${model.dateFormat.format(DateTime.parse(competencyTestDetail.competencyTestDate??DateTime.now().toString()))}',
                          'Selected Time: ${competencyTestDetail.slot}',
                          'Comments: ${model.controller.text}',
                          (shouldRoute) {
                            model.cancelCompetencyTest(enquiryID: enquiryDetailArgs.enquiryId??'',competencyTestID: competencyTestDetail.id??'');
                          },
                        );
                  }
                },
                text: 'Cancel Test',
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
