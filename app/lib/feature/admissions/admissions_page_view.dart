import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/molecules/tracker/admissions/closed_admissions.dart';
import 'package:app/molecules/tracker/admissions/open_admissions.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsPageView extends BasePageViewWidget<AdmissionsViewModel> {
  AdmissionsPageView(super.providerBase);

  @override
  Widget build(BuildContext context, AdmissionsViewModel model) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        AppStreamBuilder<int>(
            stream: model.selectedTab,
            initialData: model.selectedTab.value,
            dataBuilder: (context, data) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: model.controller,
                    onTap: (index) {
                      model.selectedTab.add(index);
                      if (index == 0) {
                        if (model.admissions.value.isEmpty) {
                          model.fetchAdmissionList();
                        }
                      }
                      if (index == 1) {
                        if (model.closedAdmissions.value.isEmpty) {
                          model.fetchClosedAdmissionList();
                        }
                      }
                    },
                    indicator: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    labelPadding: EdgeInsets.all(8),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.selectedTab.value == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : AppColors.textNeutral35,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: model.selectedTab.value == 0
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              Strings.of(context).open_enquiry,
                              style: AppTypography.subtitle2.copyWith(
                                color: model.selectedTab.value == 0
                                    ? Theme.of(context).colorScheme.primary
                                    : AppColors.textNeutral35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.selectedTab.value == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : AppColors.textNeutral35,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: model.selectedTab.value == 1
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              Strings.of(context).closed_enquiries,
                              style: AppTypography.subtitle2.copyWith(
                                color: model.selectedTab.value == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : AppColors.textNeutral35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: TabBarView(
            controller: model.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OpenAdmissionsPage(model: model),
              ClosedAdmissionsPage(model: model),
            ],
          ),
        )
      ],
    );
  }
}
