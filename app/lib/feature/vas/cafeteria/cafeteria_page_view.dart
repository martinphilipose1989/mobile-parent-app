import 'package:app/feature/vas/cafeteria/cafeteria_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/enums/new_enrolment_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CafeteriaPageView extends BasePageViewWidget<CafeteriaDetailViewModel> {
  CafeteriaPageView(super.providerBase, {this.onSelectVasEnrolment});
  final void Function(StudentEnrolmentFee studentFee)? onSelectVasEnrolment;

  @override
  Widget build(BuildContext context, CafeteriaDetailViewModel model) {
    return AppStreamBuilder<Resource<CafeteriaEnrollmentResponseModel>>(
        stream: model.fetchCafeteriaEnrollmentDetail,
        initialData: Resource.none(),
        dataBuilder: (context, data) {
          if (data?.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (data?.status == Status.success) {
            return ValueListenableBuilder(
                valueListenable: model.showLoader,
                builder: (context, bool value, child) {
                  return SingleChildScrollView(
                    controller: model.scrollController,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          child: Visibility(
                            visible: (data
                                        ?.data?.data?.feeSubType?.isNotEmpty ??
                                    false) &&
                                (data?.data?.data?.feeCategory?.isNotEmpty ??
                                    false) &&
                                (data?.data?.data?.periodOfService
                                        ?.isNotEmpty ??
                                    false),
                            replacement: NoDataFoundWidget(
                                title: Strings.of(context)
                                    .no_VAS_option_for_cafeteria_available),
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
                                                text: Strings.of(context)
                                                    .calculated_amount,
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
                                SizedBox(height: 16.h),
                                CustomDropdownButton(
                                  items: model.feeSubType.toSet().toList(),
                                  dropdownName: 'Type of Service',
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
                                    model.setCategoryFeeSubType(value);
                                  },
                                ),
                                AppStreamBuilder<List<String>>(
                                    stream: model.feeCategoryType,
                                    initialData: [],
                                    dataBuilder: (context, feeCategoryType) {
                                      return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (feeCategoryType?.isNotEmpty ??
                                                false) ...[
                                              SizedBox(height: 10.h),
                                              CommonText(
                                                text:
                                                    Strings.of(context).opt_for,
                                                style: AppTypography.subtitle2,
                                              ),
                                              SizedBox(height: 10.h),
                                            ],
                                            ...List.generate(
                                              feeCategoryType
                                                      ?.toSet()
                                                      .toList()
                                                      .length ??
                                                  0,
                                              (index) {
                                                return CommonRadioButtonWidget<
                                                    String>(
                                                  commonRadioButton: model
                                                      .radioButtonFeeOption,
                                                  value: model.feeCategoryType
                                                      .value[index],
                                                  title: model.feeCategoryType
                                                      .value[index],
                                                  onOptionSelected: (value) {
                                                    model.setCategoryType(
                                                        value!);
                                                  },
                                                );
                                              },
                                            ),
                                          ]);
                                    }),
                                AppStreamBuilder<List<String>>(
                                    stream: model.periodOfService,
                                    initialData: const <String>[],
                                    dataBuilder: (context, snapshot) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (snapshot?.isNotEmpty ??
                                              false) ...[
                                            SizedBox(height: 15.h),
                                            CommonText(
                                              text: Strings.of(context)
                                                  .period_of_service,
                                              style: AppTypography.subtitle2,
                                            ),
                                            SizedBox(height: 10.h),
                                          ],
                                          ...List.generate(
                                            model.periodOfService.value
                                                .toSet()
                                                .toList()
                                                .length,
                                            (index) {
                                              return CommonRadioButtonWidget(
                                                commonRadioButton:
                                                    model.radioButtonTerm,
                                                value: model.periodOfService
                                                    .value[index],
                                                title: model.periodOfService
                                                    .value[index],
                                                onOptionSelected: (value) {
                                                  model.setPeriodOfService(
                                                      value!);
                                                },
                                              );
                                            },
                                          )
                                        ],
                                      );
                                    }),
                                const SizedBox(
                                  height: 250,
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
                                                text: Strings.of(context)
                                                    .calculate,
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
                                                            feeCategoryId: model
                                                                .feeCategoryId,
                                                            feeSubTypeId: model
                                                                .feeSubTypeID,
                                                            periodOfServiceId: model
                                                                .periodOfServiceID,
                                                            feeType:
                                                                EnrolmentFeeType
                                                                    .cafeteria
                                                                    .type,
                                                          ),
                                                        );
                                                      } else {
                                                        model.enrollCafeteria();
                                                      }
                                                    },
                                                    text: Strings.of(context)
                                                        .enroll_now,
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
                                                      model.reset();
                                                    },
                                                    text: Strings.of(context)
                                                        .reset,
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
                        ),
                        if (value) ...[const CommonAppLoader()]
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CommonText(text: Strings.of(context).no_data_found),
            );
          }
        });
  }
}
