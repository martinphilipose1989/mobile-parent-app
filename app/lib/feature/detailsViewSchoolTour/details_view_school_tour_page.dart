import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_model.dart';
import 'package:app/feature/detailsViewSchoolTour/details_view_school_tour_page_view.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class DetailsViewSchoolTourPage extends BasePage<DetailsViewSchoolTourPageModel> {
  const DetailsViewSchoolTourPage({super.key});

  @override
  DetailsViewSchoolTourPageState createState() => DetailsViewSchoolTourPageState();
}

class DetailsViewSchoolTourPageState extends AppBasePageState<DetailsViewSchoolTourPageModel, DetailsViewSchoolTourPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<DetailsViewSchoolTourPageModel> provideBase() {
    return detailsViewSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(DetailsViewSchoolTourPageModel model) {
  }

  @override
  PreferredSizeWidget? buildAppbar(DetailsViewSchoolTourPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'View School Tour',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, DetailsViewSchoolTourPageModel model) {
    return DetailsViewSchoolTourPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}