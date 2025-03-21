import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cancel_competency_test/cancel_competency_test_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/DetailsViewSchoolTour/competency_test_schedule_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CancelCompetencyTestPageView
    extends BasePageViewWidget<CancelCompetencyPageModel> {
  final CompetencyTestDetails competencyTestDetail;
  final EnquiryDetailArgs enquiryDetailArgs;

  CancelCompetencyTestPageView(
      super.providerBase, this.competencyTestDetail, this.enquiryDetailArgs);

  @override
  Widget build(BuildContext context, CancelCompetencyPageModel model) {
    return AppStreamBuilder<Resource<CompetencyTestDetailBase>>(
      stream: model.cancelCompetencyTestStream,
      initialData: Resource.none(),
      onData: (value) {
        if (value.status == Status.success) {
          ProviderScope.containerOf(context)
              .read(admissionsDetailsProvider(enquiryDetailArgs))
              .getAdmissionJourney(
                  enquiryID: enquiryDetailArgs.enquiryId ?? '',
                  type: enquiryDetailArgs.isFrom ?? 'enquiry');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(Strings.of(context).competency_test_cancelled)),
          );
          Navigator.of(context)
              .popUntil(ModalRoute.withName(RoutePaths.admissionsDetails));
        }
      },
      dataBuilder: (context, data) {
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
                        name: enquiryDetailArgs.studentName ?? '',
                        year: enquiryDetailArgs.academicYear ?? '',
                        id: enquiryDetailArgs.enquiryNumber ?? '',
                        title: enquiryDetailArgs.school ?? '',
                        subtitle:
                            "${enquiryDetailArgs.grade} | ${enquiryDetailArgs.board} | ${enquiryDetailArgs.shift} | Stream-${enquiryDetailArgs.stream}",
                        buttontext: enquiryDetailArgs.currentStage ?? '',
                        status: enquiryDetailArgs.status ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CompetencyTestScheduledDetailsWidget(
                        competencyTestDetails: competencyTestDetail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                 CommonText(text: Strings.of(context).cancel_test),
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
                              dropdownName: Strings.of(context).reason_for_cancellation,
                              showAstreik: true,
                              showBorderColor: true,
                              items: model.reasonTypes,
                              onSingleSelect: (selectedValue) {
                                if (model.reasonTypes.contains(selectedValue)) {
                                  model.selectedReasonType.add(true);
                                }
                              },
                              isMutiSelect: false,
                              validator: (value) =>
                                  AppValidators.validateDropdown(
                                      value, "cancellation reason"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFormField(
                              controller: model.controller,
                              showAstreik: true,
                              labelText: Strings.of(context).comment,
                              hintText: "",
                              validator: (value) =>
                                  AppValidators.validateNotEmpty(
                                      value, "Comment"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (data?.status == Status.loading) ...[const CommonAppLoader()]
          ],
        );
      },
    );
  }
}
