import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/competency_test_detail/details_view_competency_test_page_model.dart';
import 'package:app/feature/competency_test_detail/details_view_competency_test_page_view.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class DetailsViewCompetencyTestPage extends BasePage<DetailsViewCompetencyTestPageModel> {
  final EnquiryDetailArgs enquiryDetail;
  const DetailsViewCompetencyTestPage({super.key,required this.enquiryDetail});

  @override
  DetailsViewSchoolTourPageState createState() => DetailsViewSchoolTourPageState();
}

class DetailsViewSchoolTourPageState extends AppBasePageState<DetailsViewCompetencyTestPageModel, DetailsViewCompetencyTestPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<DetailsViewCompetencyTestPageModel> provideBase() {
    return detailsViewCompetencyTestPageModelProvider;
  }

  @override
  void onModelReady(DetailsViewCompetencyTestPageModel model) {
    model.getCompetencyTestDetail(widget.enquiryDetail.enquiryId??'');
    model.exceptionHandlerBinder.bind(
      context,
      super.stateObserver,
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(DetailsViewCompetencyTestPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'View Test Detail',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, DetailsViewCompetencyTestPageModel model) {
    return DetailsViewCompetencyTestPageView(provideBase(),enquiryDetail: widget.enquiryDetail);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
