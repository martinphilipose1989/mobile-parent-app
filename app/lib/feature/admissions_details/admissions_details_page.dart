import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/admissions_details/admissions_details_page_view.dart';
import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsPage extends BasePage<AdmissionsDetailsViewModel> {
  const AdmissionsDetailsPage({super.key});

  @override
  State<AdmissionsDetailsPage> createState() => _AdmissionsPageState();
}

class _AdmissionsPageState extends AppBasePageState<AdmissionsDetailsViewModel,
    AdmissionsDetailsPage> {
  @override
  void onModelReady(AdmissionsDetailsViewModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(AdmissionsDetailsViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Admissions Details',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, AdmissionsDetailsViewModel model) {
    // TODO: implement buildView
    return AdmissionsDetailsPageView(provideBase());
  }

  @override
  ProviderBase<AdmissionsDetailsViewModel> provideBase() {
    return admissionsDetailsProvider;
  }

  @override
  Widget? buildFloatingButton(AdmissionsDetailsViewModel model) {
    return AppStreamBuilder<bool>(
      stream: model.showMenuOnFloatingButton,
      initialData: model.showMenuOnFloatingButton.value,
      dataBuilder: (context, data) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
              height: 56.h,
              width: 130.w,
              child: CommonElevatedButton(
                onPressed: () {
                  if (model.showMenuOnFloatingButton.value) {
                    model.showMenuOnFloatingButton.add(false);
                  } else {
                    model.showMenuOnFloatingButton.add(true);
                  }
                },
                text: data! ? 'Close' : 'Action',
                icon: data ? Icons.close : Icons.add,
                borderRadius: BorderRadius.circular(10),
                textColor: Theme.of(context).colorScheme.onTertiary,
                backgroundColor: AppColors.accent,
                textStyle: AppTypography.subtitle2
                    .copyWith(color: Theme.of(context).colorScheme.onTertiary),
              )),
        );
      },
    );
  }
}
