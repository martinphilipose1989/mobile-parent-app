import 'dart:developer';

import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/molecules/tracker/admissions/closed_admissions.dart';
import 'package:app/molecules/tracker/admissions/open_admissions.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              return TabBar(
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
                          'Open Enquiries',
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
                          'Closed Enquiries',
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
              OpenAdmissionsPage(
                model: model,
              ),
              ClosedAdmissionsPage(
                model: model,
              ),
            ],
          ),
        )
      ],
    );
  }
}
