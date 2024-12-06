import 'package:app/feature/vas/cafeteria/cafeteria_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CafeteriaPageView extends BasePageViewWidget<CafeteriaDetailViewModel> {
  CafeteriaPageView(super.providerBase);

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
                  return Stack(
                    children: [
                      Padding(
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
                            const CommonText(
                              text: "Opt For",
                              style: AppTypography.subtitle2,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: List.generate(
                                model.cafeteriaOptions.length,
                                (index) {
                                  return CommonRadioButtonWidget<String>(
                                    commonRadioButton:
                                        model.radioButtonFeeOption,
                                    value: model.cafeteriaOptions[index],
                                    title: model.cafeteriaOptions[index],
                                    onOptionSelected: (value) {
                                      List<String> options = [];
                                      model.feeCategoryId = model
                                              .cafeteriaEnrollmentDetail
                                              .value
                                              .data
                                              ?.feeCategory
                                              ?.firstWhereOrNull((element) =>
                                                  (element.feeCategory ?? '') ==
                                                  value)
                                              ?.feeCategoryId ??
                                          0;
                                      model.feeSubTypeID = model
                                              .cafeteriaEnrollmentDetail
                                              .value
                                              .data
                                              ?.feeCategory
                                              ?.firstWhereOrNull((element) =>
                                                  (element.feeCategory ?? '') ==
                                                  value)
                                              ?.feeSubTypeId ??
                                          0;

                                      (model.cafeteriaEnrollmentDetail.value
                                                  .data?.periodOfService ??
                                              [])
                                          .forEach((element) {
                                        if (element.feeCategory == value) {
                                          options.add(
                                              element.periodOfService ?? '');
                                        }
                                      });
                                      if (model.radioButtonFeeOption
                                              .selectedItem !=
                                          value) {
                                        if ((model.radioButtonTerm
                                                    .selectedItem ??
                                                '')
                                            .isNotEmpty) {
                                          model.radioButtonTerm.selectItem("");
                                          model.periodOfServiceID = 0;
                                        }
                                      }
                                      if (model.fee.value.isNotEmpty) {
                                        model.fee.value = "";
                                      }
                                      model.terms.add(options);
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const CommonText(
                              text: "Period Of Service",
                              style: AppTypography.subtitle2,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppStreamBuilder<List<String>>(
                                stream: model.terms,
                                initialData: [],
                                dataBuilder: (context, snapshot) {
                                  return Column(
                                    children: List.generate(
                                      model.terms.value.length,
                                      (index) {
                                        return CommonRadioButtonWidget(
                                          commonRadioButton:
                                              model.radioButtonTerm,
                                          value: model.terms.value[index],
                                          title: model.terms.value[index],
                                          onOptionSelected: (value) {
                                            model.periodOfServiceID = model
                                                    .cafeteriaEnrollmentDetail
                                                    .value
                                                    .data
                                                    ?.periodOfService
                                                    ?.firstWhereOrNull((element) =>
                                                        ((element.feeCategory ??
                                                                    '') ==
                                                                model
                                                                    .radioButtonFeeOption
                                                                    .selectedItem &&
                                                            (element.periodOfService ??
                                                                    '') ==
                                                                value))
                                                    ?.periodOfServiceId ??
                                                0;
                                            if (model.fee.value.isNotEmpty) {
                                              model.fee.value = "";
                                            }
                                          },
                                        );
                                      },
                                    ),
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
                                                  model.enrollCafeteria();
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
                                                  model.radioButtonFeeOption
                                                      .selectItem("");
                                                  model.radioButtonTerm
                                                      .selectItem("");
                                                  model.feeSubTypeID = 0;
                                                  model.periodOfServiceID = 0;
                                                  model.fee.value = "";
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
                      ),
                      if (value) ...[const CommonAppLoader()]
                    ],
                  );
                });
          } else {
            return const Center(
              child: CommonText(text: "Data not found"),
            );
          }
        });
  }
}
