import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_page_view.dart';
import 'package:app/feature/vas/cafeteria/cafeteria_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CafeteriaPage extends BasePage<CafeteriaDetailViewModel> {
  final EnquiryDetailArgs? enquiryDetailArgs;
  const CafeteriaPage({super.key,this.enquiryDetailArgs});

  @override
  CafeteriaPageState createState() => CafeteriaPageState();
}

class CafeteriaPageState extends AppBasePageState<CafeteriaDetailViewModel, CafeteriaPage> {
  @override
  ProviderBase<CafeteriaDetailViewModel> provideBase() {
    return cafeteriaPageModelProvider;
  }

  @override
  void onModelReady(CafeteriaDetailViewModel model) {
    // bind exception handler here.
    model.getCafeteriaDetail();
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  Widget buildView(BuildContext context, CafeteriaDetailViewModel model) {
    return CafeteriaPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar(CafeteriaDetailViewModel model) {
    return const CommonAppBar(
      appbarTitle: 'Cafeteria',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

}
