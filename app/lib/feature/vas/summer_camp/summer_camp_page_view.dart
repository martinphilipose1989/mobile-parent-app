import 'package:app/feature/vas/summer_camp/summer_camp_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/enums/new_enrolment_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SummerCampDetailPageView
    extends BasePageViewWidget<SummerCampDetailViewModel> {
  SummerCampDetailPageView(super.providerBase, {this.onSelectVasEnrolment});
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  @override
  Widget build(BuildContext context, SummerCampDetailViewModel model) {
    return AppStreamBuilder<bool>(
        stream: model.showLoader,
        initialData: model.showLoader.value,
        dataBuilder: (context, snapshot) {
          return Stack(
            children: [
              SingleChildScrollView(
                controller: model.scrollController,
                child: AppStreamBuilder<
                        Resource<SummerCampEnrollmentResponseModel>>(
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
                          child: Visibility(
                            visible:
                                (data?.data?.data?.batches?.isNotEmpty ??
                                        false) &&
                                    (data?.data
                                            ?.data?.feeSubCategory?.isNotEmpty ??
                                        false) &&
                                    (data?.data?.data?.feeSubType?.isNotEmpty ??
                                        false) &&
                                    (data?.data?.data?.feesCategory
                                            ?.isNotEmpty ??
                                        false) &&
                                    (data?.data?.data?.periodOfService
                                            ?.isNotEmpty ??
                                        false),
                            replacement: NoDataFoundWidget(
                                title:
                                Strings.of(context).no_VAS_option_for_summer_camp_available),
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
                                                text: Strings.of(context).calculated_amount,
                                                style: AppTypography.body2,
                                              ),
                                              CommonText(
                                                text: model.fee.value,
                                                style: AppTypography.h6
                                                    .copyWith(
                                                        color:
                                                            AppColors.primary),
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
                                  items: model.feeSubType,
                                  dropdownName: 'PSA Sub Type',
                                  showAstreik: false,
                                  showBorderColor: false,
                                  isMutiSelect: false,
                                  onMultiSelect: (_) {},
                                  singleSelectItemSubject:
                                      model.selectedFeeSubType,
                                  onSingleSelect: (value) {
                                    if (model.selectedFeeSubType.value ==
                                        value) {
                                      return;
                                    }
                                    model.setFeeSubTypeId(value);
                                  },
                                ),
                                SizedBox(height: 15.h),
                                AppStreamBuilder<List<String>>(
                                    initialData: const <String>[],
                                    stream: model.feeCategoryType,
                                    dataBuilder: (context, feeCategoryType) {
                                      return CustomDropdownButton(
                                        items: feeCategoryType ?? [],
                                        dropdownName: 'PSA Category Type',
                                        showAstreik: false,
                                        showBorderColor: false,
                                        isMutiSelect: false,
                                        onMultiSelect: (_) {},
                                        singleSelectItemSubject:
                                            model.selectedFeeCategoryType,
                                        onSingleSelect: (value) {
                                          if (model.selectedFeeCategoryType
                                                  .value ==
                                              value) {
                                            return;
                                          }
                                          model.setCategoryTypeId(value);
                                        },
                                      );
                                    }),
                                SizedBox(height: 15.h),
                                AppStreamBuilder<List<String>>(
                                    initialData: const <String>[],
                                    stream: model.feeSubCategoryType,
                                    dataBuilder: (context, feeSubCategoryType) {
                                      return CustomDropdownButton(
                                        items: feeSubCategoryType ?? [],
                                        dropdownName: 'PSA Sub Category',
                                        showAstreik: false,
                                        showBorderColor: false,
                                        isMutiSelect: false,
                                        onMultiSelect: (_) {},
                                        singleSelectItemSubject:
                                            model.selectedFeeSubCategoryType,
                                        onSingleSelect: (value) {
                                          if (model.selectedFeeSubCategoryType
                                                  .value ==
                                              value) {
                                            return;
                                          }
                                          model.setSubCategoryTypeId(value);
                                        },
                                      );
                                    }),
                                SizedBox(height: 15.h),
                                AppStreamBuilder<List<String>>(
                                    initialData: const <String>[],
                                    stream: model.batchType,
                                    dataBuilder: (context, batchType) {
                                      return CustomDropdownButton(
                                        items: batchType ?? [],
                                        dropdownName: 'PSA Batch',
                                        showAstreik: false,
                                        showBorderColor: false,
                                        isMutiSelect: false,
                                        onMultiSelect: (_) {},
                                        singleSelectItemSubject:
                                            model.selectedBatch,
                                        onSingleSelect: (value) {
                                          if (model.selectedBatch.value ==
                                              value) {
                                            return;
                                          }
                                          model.setBatchId(value);
                                        },
                                      );
                                    }),
                                SizedBox(height: 15.h),
                                AppStreamBuilder<List<String>>(
                                    initialData: const <String>[],
                                    stream: model.periodOfService,
                                    dataBuilder: (context, periodOfService) {
                                      return CustomDropdownButton(
                                        items: periodOfService ?? [],
                                        dropdownName: 'Period Of Service',
                                        showAstreik: false,
                                        showBorderColor: false,
                                        isMutiSelect: false,
                                        onMultiSelect: (_) {},
                                        singleSelectItemSubject:
                                            model.selectedPeriodOfService,
                                        onSingleSelect: (value) {
                                          if (model.selectedPeriodOfService
                                                  .value ==
                                              value) {
                                            return;
                                          }
                                          model.setPeriodOfService(value);
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
                                                text: Strings.of(context).calculate,
                                                backgroundColor:
                                                    AppColors.accent,
                                                width: double.infinity,
                                                textStyle: AppTypography
                                                    .subtitle2
                                                    .copyWith(
                                                        color:
                                                            AppColors.textDark),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CommonElevatedButton(
                                                    onPressed: () {
                                                      if (onSelectVasEnrolment !=
                                                          null) {
                                                        onSelectVasEnrolment
                                                            ?.call(
                                                          StudentEnrolmentFee(
                                                              // enquiryNo: model
                                                              //     .enquiryDetailArgs
                                                              //     ?.enquiryNumber,
                                                              academicYearId: model
                                                                  .enquiryDetailArgs
                                                                  ?.academicYearId,
                                                              boardId: model
                                                                  .enquiryDetailArgs
                                                                  ?.boardId,
                                                              courseId: model
                                                                  .enquiryDetailArgs
                                                                  ?.courseId,
                                                              schoolId: model
                                                                  .enquiryDetailArgs
                                                                  ?.schoolId,
                                                              shiftId: model
                                                                  .enquiryDetailArgs
                                                                  ?.shiftId,
                                                              gradeId: model
                                                                  .enquiryDetailArgs
                                                                  ?.gradeId,
                                                              streamId: model
                                                                  .enquiryDetailArgs
                                                                  ?.streamId,
                                                              brandId: model
                                                                  .enquiryDetailArgs
                                                                  ?.brandId,
                                                              studentId: model
                                                                  .enquiryDetailArgs
                                                                  ?.studentId,
                                                              globalUserId: model
                                                                  .enquiryDetailArgs
                                                                  ?.studentGlobalId,
                                                              batchId:
                                                                  model.batchID,
                                                              feeSubcategoryId: model
                                                                  .feeSubCategoryID,
                                                              feeSubTypeId: model
                                                                  .feeSubTypeID,
                                                              periodOfServiceId: model.periodOfServiceID,
                                                              feeCategoryId: model.feeSubCategoryID,
                                                              feeType: EnrolmentFeeType.summerCamp.type),
                                                        );
                                                      } else {
                                                        model
                                                            .enrollSummerCamp();
                                                      }
                                                    },
                                                    text: Strings.of(context).enroll_now,
                                                    backgroundColor:
                                                        AppColors.accent,
                                                    textStyle: AppTypography
                                                        .subtitle2
                                                        .copyWith(
                                                            color: AppColors
                                                                .textDark),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: CommonElevatedButton(
                                                    onPressed: () {
                                                      model.reset(
                                                          isResetSubType: true);
                                                    },
                                                    text: Strings.of(context).reset,
                                                    backgroundColor:
                                                        AppColors.primaryOn,
                                                    textStyle: AppTypography
                                                        .subtitle2
                                                        .copyWith(
                                                            color: AppColors
                                                                .primary),
                                                  ),
                                                )
                                              ],
                                            );
                                    }),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CommonText(text: Strings.of(context).no_data_found),
                        );
                      }
                    }),
              ),
              if (model.showLoader.value == true) ...[const CommonAppLoader()]
            ],
          );
        });
  }
}
