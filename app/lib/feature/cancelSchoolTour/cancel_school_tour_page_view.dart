import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/school_tour_scheduled_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CancelSchoolTourPageView
    extends BasePageViewWidget<CancelSchoolTourPageModel> {
  final SchoolVisitDetail schoolVisitDetail;
  final EnquiryDetailArgs enquiryDetailArgs;
  
  CancelSchoolTourPageView(super.providerBase,this.schoolVisitDetail,this.enquiryDetailArgs);
  @override
  Widget build(BuildContext context, CancelSchoolTourPageModel model) {
    return AppStreamBuilder<Resource<SchoolVisitDetailBase>>(
      stream: model.cacnelSchoolTour,
      initialData: Resource.none(),
      onData: (value) {
        if (value.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('School tour cancelled successfully')),
          );
          Navigator.of(context).popUntil(ModalRoute.withName(RoutePaths.enquiriesAdmissionsJourneyPage));
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                          image: AppImages.personIcon,
                          name: enquiryDetailArgs.studentName??'',
                          year: enquiryDetailArgs.academicYear??'',
                          id: enquiryDetailArgs.enquiryNumber??'',
                          title: enquiryDetailArgs.school??'',
                          subtitle: "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board}",
                          buttontext: enquiryDetailArgs.currentStage??''),
                      const SizedBox(
                        height: 10,
                      ),
                      SchoolTourScheduledDetailsWidget(schoolVisitDetail: schoolVisitDetail,),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Reason For Cancellation',
                              showAstreik: true,
                              showBorderColor: true,
                              items: model.reasonTypes,
                              onSingleSelect: (selectedValue) {
                                if (model.reasonTypes.contains(selectedValue)) {
                                  model.selectedReasonType.add(true);
                                  model.selectedReason = selectedValue;
                                }
                              },
                              isMutiSelect: false,
                              validator: (value) => AppValidators.validateDropdown(value, "cancellation reason"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFormField(
                              showAstreik: true,
                              controller: model.controller,
                              labelText: "Comment",
                              validator: (value)=> AppValidators.validateNotEmpty(value, "Comment"),
                            ),
                          ],
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
                      if(model.formKey.currentState!.validate()){
                        CommonPopups().showConfirm(
                          context,
                          'Confirm Cancellation Details',
                          'Please Confirm the below details',
                          'Date: ${model.dateFormat.format(DateTime.parse((schoolVisitDetail.schoolVisitDate??DateTime.now().toString())))}',
                          'Selected Time: ${model.schoolVisitDetailData?.slot??''}',
                          'Comments: ${model.controller.text}',
                          (shouldRoute) {
                            model.cacnelSchoolVisit(enquiryID: enquiryDetailArgs.enquiryId??'',schoolVisitID: schoolVisitDetail.id??'');
                          },
                        );
                      }
                    },
                    text: 'Cancel Tour',
                    backgroundColor: AppColors.accent,
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    textColor: AppColors.accentOn,
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
