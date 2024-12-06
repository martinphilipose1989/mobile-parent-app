import 'package:app/feature/vas/summer_camp/summer_camp_view_model.dart';
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

class SummerCampDetailPageView
    extends BasePageViewWidget<SummerCampDetailViewModel> {
  SummerCampDetailPageView(super.providerBase);

  @override
  Widget build(BuildContext context, SummerCampDetailViewModel model) {
    return AppStreamBuilder<bool>(
        stream: model.showLoader,
        initialData: model.showLoader.value,
        dataBuilder: (context, snapshot) {
          return Stack(
            children: [
              AppStreamBuilder<Resource<SummerCampEnrollmentResponseModel>>(
                  stream: model.fetchSummerCampEnrollmentDetail,
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
                                          const CommonText(
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
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomDropdownButton(
                              items: model.summerCampType,
                              isMutiSelect: false,
                              dropdownName: 'Summer Camp Type',
                              showAstreik: false,
                              showBorderColor: false,
                              singleSelectItemSubject:
                                  model.selectedSummerCampType,
                              onMultiSelect: (List<String> selectedValues) {},
                              onSingleSelect: (selectedValue) {
                                if (model.selectedSummerCampType.value ==
                                    selectedValue) {
                                  return;
                                }
                                model.selectedSummerCampType.value =
                                    selectedValue;
                                model.feeSubTypeID = model
                                        .summerCampEnrollmentDetail
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
                                (model.summerCampEnrollmentDetail.value.data
                                            ?.feeSubCategory ??
                                        [])
                                    .forEach((element) {
                                  if (element.feeSubType == selectedValue) {
                                    options.add(element.feeSubcategory ?? '');
                                  }
                                });
                                model.summerCampActivity.add(options);
                                model.selectedSummerCamptActivity.value = '';
                                model.feeSubCategoryID = 0;
                                model.summerCampDuration.value.clear();
                                model.selectedSummerCampDuration.value = '';
                                model.periodOfServiceID = 0;
                                model.summerCampBatch.value.clear();
                                model.selectedSummerCampBatch.value = '';
                                model.batchID = 0;
                                if (model.fee.value.isNotEmpty) {
                                  model.fee.value = '';
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            AppStreamBuilder<List<String>>(
                                stream: model.summerCampActivity,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.summerCampActivity.value,
                                    isMutiSelect: false,
                                    dropdownName: 'Summer Camp Activity',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    singleSelectItemSubject:
                                        model.selectedSummerCamptActivity,
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedSummerCamptActivity
                                              .value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.selectedSummerCamptActivity.value =
                                          selectedValue;
                                      model.feeSubCategoryID = model
                                              .summerCampEnrollmentDetail
                                              .value
                                              .data
                                              ?.feeSubCategory
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedSummerCampType
                                                            .value &&
                                                    element.feeSubcategory ==
                                                        selectedValue,
                                              )
                                              ?.feeCategoryId ??
                                          0;
                                      List<String> options = [];
                                      (model.summerCampEnrollmentDetail.value
                                                  .data?.periodOfService ??
                                              [])
                                          .forEach((element) {
                                        if (element.feeSubType ==
                                                model.selectedSummerCampType
                                                    .value &&
                                            element.feeSubcategory ==
                                                selectedValue) {
                                          options.add(
                                              element.periodOfService ?? '');
                                        }
                                      });
                                      model.summerCampDuration.add(options);
                                      model.selectedSummerCampDuration.value =
                                          '';
                                      model.periodOfServiceID = 0;
                                      model.summerCampBatch.value.clear();
                                      model.selectedSummerCampBatch.value = '';
                                      model.batchID = 0;
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
                                stream: model.summerCampDuration,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.summerCampDuration.value,
                                    isMutiSelect: false,
                                    dropdownName: 'Summer Camp Duration',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    singleSelectItemSubject:
                                        model.selectedSummerCampDuration,
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedSummerCampDuration
                                              .value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.selectedSummerCampDuration.value =
                                          selectedValue;
                                      model.periodOfServiceID = model
                                              .summerCampEnrollmentDetail
                                              .value
                                              .data
                                              ?.periodOfService
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedSummerCampType
                                                            .value &&
                                                    element.feeSubcategory ==
                                                        model
                                                            .selectedSummerCamptActivity
                                                            .value &&
                                                    element.periodOfService ==
                                                        selectedValue,
                                              )
                                              ?.periodOfServiceId ??
                                          0;
                                      List<String> options = [];
                                      (model.summerCampEnrollmentDetail.value
                                                  .data?.batches ??
                                              [])
                                          .forEach((element) {
                                        if (element.feeSubType ==
                                                model
                                                    .selectedSummerCampType.value &&
                                            element.feeSubcategory ==
                                                model
                                                    .selectedSummerCamptActivity
                                                    .value &&
                                            element.periodOfService ==
                                                selectedValue) {
                                          options.add(element.batchName ?? '');
                                        }
                                      });
                                      model.summerCampBatch.add(options);
                                      model.selectedSummerCampBatch.value = '';
                                      model.batchID = 0;
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
                                stream: model.summerCampBatch,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return CustomDropdownButton(
                                    items: model.summerCampBatch.value,
                                    isMutiSelect: false,
                                    dropdownName: 'Batch Number',
                                    showAstreik: false,
                                    showBorderColor: false,
                                    onMultiSelect:
                                        (List<String> selectedValues) {},
                                    singleSelectItemSubject:
                                        model.selectedSummerCampBatch,
                                    onSingleSelect: (selectedValue) {
                                      if (model.selectedSummerCampBatch.value ==
                                          selectedValue) {
                                        return;
                                      }
                                      model.selectedSummerCampBatch.value =
                                          selectedValue;
                                      model.batchID = model
                                              .summerCampEnrollmentDetail
                                              .value
                                              .data
                                              ?.batches
                                              ?.firstWhereOrNull(
                                                (element) =>
                                                    element.feeSubType ==
                                                        model
                                                            .selectedSummerCampType
                                                            .value &&
                                                    element.feeSubcategory ==
                                                        model
                                                            .selectedSummerCamptActivity
                                                            .value &&
                                                    element.periodOfService ==
                                                        model
                                                            .selectedSummerCampDuration
                                                            .value &&
                                                    element.batchName ==
                                                        selectedValue,
                                              )
                                              ?.batchId ??
                                          0;
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
                                                  model.enrollSummerCamp();
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
                                                  model.selectedSummerCampType
                                                      .value = '';
                                                  model.feeSubTypeID = 0;
                                                  model.summerCampActivity.value
                                                      .clear();
                                                  model
                                                      .selectedSummerCamptActivity
                                                      .value = '';
                                                  model.feeSubCategoryID = 0;
                                                  model.summerCampDuration.value
                                                      .clear();
                                                  model
                                                      .selectedSummerCampDuration
                                                      .value = '';
                                                  model.periodOfServiceID = 0;
                                                  model.summerCampBatch.value
                                                      .clear();
                                                  model.selectedSummerCampBatch
                                                      .value = '';
                                                  model.batchID = 0;
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
              if (model.showLoader.value == true) ...[const CommonAppLoader()]
            ],
          );
        });
  }
}
