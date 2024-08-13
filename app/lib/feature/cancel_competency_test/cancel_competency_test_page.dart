import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cancel_competency_test/cancel_competency_test_page_model.dart';
import 'package:app/feature/cancel_competency_test/cancel_competency_test_page_view.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class CancelCompetencyTestPage extends BasePage<CancelCompetencyPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final CompetencyTestDetails competencyTestDetail;
  const CancelCompetencyTestPage({super.key,required this.enquiryDetailArgs,required this.competencyTestDetail});

  @override
  CancelSchoolTourPageState createState() => CancelSchoolTourPageState();
}

class CancelSchoolTourPageState
    extends AppBasePageState<CancelCompetencyPageModel, CancelCompetencyTestPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<CancelCompetencyPageModel> provideBase() {
    return cancelCompetencyTestPageModelProvider;
  }

  @override
  void onModelReady(CancelCompetencyPageModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(CancelCompetencyPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Cancel Competency Test',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, CancelCompetencyPageModel model) {
    return CancelCompetencyTestPageView(provideBase(),widget.competencyTestDetail,widget.enquiryDetailArgs);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
