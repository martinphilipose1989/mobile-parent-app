import 'package:app/feature/vas/kids_club/kids_club_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class KidsClubDetailPageView extends BasePageViewWidget<KidsClubViewModel> {
  KidsClubDetailPageView(super.providerBase);

  @override
  Widget build(BuildContext context, KidsClubViewModel model) {
    return AppStreamBuilder<bool>(
        stream: model.showLoader,
        initialData: model.showLoader.value,
        dataBuilder: (context, snapshot) {
          return Stack(
            children: [
              AppStreamBuilder<Resource<KidsClubEnrollmentResponseModel>>(
                  stream: model.fetchKidsClubEnrollmentDetail,
                  initialData: Resource.none(),
                  dataBuilder: (context, data) {
                    if (data?.status == Status.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (data?.status == Status.success) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppStreamBuilder<String>(
                                stream: model.fee,
                                initialData: model.fee.value,
                                dataBuilder: (context, snapshot) {
                                  return Visibility(
                                    visible: model.fee.value.isNotEmpty,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.textDark
                                                  .withOpacity(0.22),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 2)),
                                        ],
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 12.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonText(
                                            text: "Calculated Amount",
                                            style: AppTypography.body2,
                                          ),
                                          CommonText(
                                            text: model.fee.value,
                                            style: AppTypography.h6.copyWith(
                                                color: AppColors.primary),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomDropdownButton(
                              items: model.kidsClubOptions,
                              isMutiSelect: false,
                              dropdownName: 'Kids Club Type',
                              showAstreik: false,
                              showBorderColor: false,
                              onMultiSelect: (List<String> selectedValues) {},
                              onSingleSelect: (selectedValue) {
                                if (model.selectedKidsClubType.value ==
                                    selectedValue) {
                                  return;
                                }
                                model.selectedKidsClubType.value =
                                    selectedValue;
                                model.feeSubTypeID = model
                                        .kidsClubEnrollmentDetail
                                        .value
                                        .data
                                        ?.feeSubType
                                        ?.firstWhereOrNull(
                                          (element) =>
                                              element.feeSubType ==
                                              selectedValue,
                                        )
                                        ?.feeSubTypeId ??
                                    0;
                                List<String> options = [];
                                (model.kidsClubEnrollmentDetail.value.data
                                            ?.batches ??
                                        [])
                                    .forEach((element) {
                                  if (element.feeSubType == selectedValue) {
                                    if (!options.contains(element.batchName)) {
                                      options.add(element.batchName ?? '');
                                    }
                                  }
                                });
                                model.month.add(options);
                                model.selectedMonth.value = '';
                                model.batchID = 0;
                                model.periodOfService.value.clear();
                                model.selectedPeriodOfService.value = '';
                                model.periodOfServiceID = 0;
                                model.cafeteriaOptFor.value.clear();
                                model.selectedCafeteriaOptFor.value = '';
                                model.feeCategoryID = 0;
                                if (model.fee.value.isNotEmpty) {
                                  model.fee.value = '';
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            AppStreamBuilder<List<String>>(
                                stream: model.month,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.month.value,
                                    isMutiSelect: false,
                                    dropdownName: 'Batches',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    singleSelectItemSubject:
                                        model.selectedMonth,
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedMonth.value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.selectedMonth.value = selectedValue;
                                      model.batchID = model
                                              .kidsClubEnrollmentDetail
                                              .value
                                              .data
                                              ?.batches
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedKidsClubType
                                                            .value &&
                                                    element.batchName ==
                                                        selectedValue,
                                              )
                                              ?.batchId ??
                                          0;
                                      List<String> options = [];
                                      (model.kidsClubEnrollmentDetail.value.data
                                                  ?.periodOfService ??
                                              [])
                                          .forEach((element) {
                                        if (element.feeSubType ==
                                                model.selectedKidsClubType
                                                    .value &&
                                            element.batchName ==
                                                selectedValue) {
                                          if (!options.contains(
                                              element.periodOfService)) {
                                            options.add(
                                                element.periodOfService ?? '');
                                          }
                                        }
                                      });
                                      model.periodOfService.add(options);
                                      model.selectedPeriodOfService.value = '';
                                      model.periodOfServiceID = 0;
                                      model.cafeteriaOptFor.value.clear();
                                      model.selectedCafeteriaOptFor.value = '';
                                      model.feeCategoryID = 0;
                                      if (model.fee.value.isNotEmpty) {
                                        model.fee.value = '';
                                      }
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 15.h,
                            ),
                            AppStreamBuilder<List<String>>(
                                stream: model.periodOfService,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.periodOfService.value,
                                    isMutiSelect: false,
                                    dropdownName: 'Period Of Service',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    singleSelectItemSubject:
                                        model.selectedPeriodOfService,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedPeriodOfService.value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.selectedPeriodOfService.value =
                                          selectedValue;
                                      model.periodOfServiceID = model
                                              .kidsClubEnrollmentDetail
                                              .value
                                              .data
                                              ?.periodOfService
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedKidsClubType
                                                            .value &&
                                                    element.batchName ==
                                                        model.selectedMonth
                                                            .value &&
                                                    element.periodOfService ==
                                                        selectedValue,
                                              )
                                              ?.periodOfServiceId ??
                                          0;
                                      List<String> options = [];
                                      for (var element in (model
                                              .kidsClubEnrollmentDetail
                                              .value
                                              .data
                                              ?.feeCategory ??
                                          [])) {
                                        if (element.feeSubType ==
                                                model.selectedKidsClubType
                                                    .value &&
                                            element.periodOfService ==
                                                model.selectedPeriodOfService
                                                    .value) {
                                          if (!options
                                              .contains(element.feeCategory)) {
                                            options.add(
                                                element.periodOfService ?? '');
                                          }
                                        }
                                      }
                                      model.cafeteriaOptFor.add(options);
                                      model.selectedCafeteriaOptFor.value = '';
                                      model.feeCategoryID = 0;
                                      if (model.fee.value.isNotEmpty) {
                                        model.fee.value = '';
                                      }
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 15.h,
                            ),
                            AppStreamBuilder<List<String>>(
                                stream: model.cafeteriaOptFor,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.cafeteriaOptFor.value,
                                    isMutiSelect: false,
                                    dropdownName: 'From Cafeteria Opt For',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    singleSelectItemSubject:
                                        model.selectedCafeteriaOptFor,
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedCafeteriaOptFor.value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.feeCategoryID = model
                                              .kidsClubEnrollmentDetail
                                              .value
                                              .data
                                              ?.feeCategory
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedKidsClubType
                                                            .value &&
                                                    element.periodOfService ==
                                                        model
                                                            .selectedPeriodOfService
                                                            .value,
                                              )
                                              ?.feeCategoryId ??
                                          0;
                                      model.selectedCafeteriaOptFor.value =
                                          selectedValue;
                                      if (model.fee.value.isNotEmpty) {
                                        model.fee.value = '';
                                      }
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 15.h,
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            AppStreamBuilder<String>(
                                stream: model.fee,
                                initialData: model.fee.value,
                                dataBuilder: (context, snapshot) {
                                  return model.fee.value.isEmpty
                                      ? Center(
                                          child: CommonElevatedButton(
                                            onPressed: () {
                                              model.calculateFees();
                                            },
                                            text: "Calculate",
                                            backgroundColor: AppColors.accent,
                                            width: double.infinity,
                                            textStyle: AppTypography.subtitle2
                                                .copyWith(
                                                    color: AppColors.textDark),
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: CommonElevatedButton(
                                                onPressed: () {
                                                  model.enrollKidsClub();
                                                },
                                                text: "Enroll Now",
                                                backgroundColor:
                                                    AppColors.accent,
                                                textStyle: AppTypography
                                                    .subtitle2
                                                    .copyWith(
                                                        color:
                                                            AppColors.textDark),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: CommonElevatedButton(
                                                onPressed: () {
                                                  model.selectedKidsClubType
                                                      .value = '';
                                                  model.feeSubTypeID = 0;
                                                  model.month.value.clear();
                                                  model.selectedMonth.value =
                                                      '';
                                                  model.batchID = 0;
                                                  model.periodOfService.value
                                                      .clear();
                                                  model.selectedPeriodOfService
                                                      .value = '';
                                                  model.periodOfServiceID = 0;
                                                  model.cafeteriaOptFor.value
                                                      .clear();
                                                  model.selectedCafeteriaOptFor
                                                      .value = '';
                                                  model.feeCategoryID = 0;
                                                  model.fee.value = '';
                                                },
                                                text: "Reset",
                                                backgroundColor:
                                                    AppColors.primaryOn,
                                                textStyle: AppTypography
                                                    .subtitle2
                                                    .copyWith(
                                                        color:
                                                            AppColors.primary),
                                              ),
                                            )
                                          ],
                                        );
                                }),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CommonText(text: "Data not found"),
                      );
                    }
                  }),
              if (model.showLoader.value) ...[const CommonAppLoader()]
            ],
          );
        });
  }
}
