import 'package:app/feature/vas/psa/psa_view_model.dart';
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

class PsaDetailPageView extends BasePageViewWidget<PsaDetailViewModel> {
  PsaDetailPageView(super.providerBase);

  @override
  Widget build(BuildContext context, PsaDetailViewModel model) {
    return AppStreamBuilder<bool>(
      stream: model.showLoader,
      initialData: model.showLoader.value,
      dataBuilder: (context,data) {
        return Stack(
          children: [
            AppStreamBuilder<Resource<PsaEnrollmentDetailResponseModel>>(
              stream: model.fetchPsaEnrollmentDetail,
              initialData: Resource.none(),
              dataBuilder: (context, data) {
                if (data?.status == Status.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(data?.status == Status.success){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.textDark.withOpacity(0.22),
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 2)),
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CommonText(
                                      text: "Calculated Amount",
                                      style: AppTypography.body2,
                                    ),
                                    CommonText(
                                      text: model.fee.value,
                                      style: AppTypography.h6.copyWith(color: AppColors.primary),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const CommonText(
                          text: "Select Post School Activity",
                          style: AppTypography.subtitle2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomDropdownButton(
                          items: model.psaOptions, 
                          isMutiSelect: false,
                          dropdownName: 'PSA Sub Type',
                          showAstreik: false, 
                          showBorderColor: false, 
                          onMultiSelect: (List<String> selectedValues) {},
                          singleSelectItemSubject: model.selectedPsaSubType,
                          onSingleSelect: (selectedValue) {
                            if(model.selectedPsaSubType.value == selectedValue){
                              return;
                            }
                            model.selectedPsaSubType.value = selectedValue;
                            model.feeSubTypeID = model.psaEnrollmentDetail.value.data?.feeSubType?.firstWhereOrNull(
                              (element) => element.feeSubType == selectedValue,
                            )?.feeSubTypeId??0;
                            List<String> options = [];
                            (model.psaEnrollmentDetail.value.data?.feeCategory ?? []).forEach((element) {
                              if (element.feeSubType == selectedValue) {
                                options.add(element.feeCategory ?? '');
                              }
                            });
                            model.psaCategory.add(options);
                            model.selectedPsaCategory.value = '';
                            model.psaSubCategory.value.clear();
                            model.selectedPsaSubCategory.value = '';
                            model.periodOfService.value.clear();
                            model.selectedPeriodOfService.value = '';
                            model.psaBatch.value.clear();
                            model.selectedPsaBatch.value = '';
                            model.feeCategoryID = 0;
                            model.feeSubCategoryID = 0;
                            model.periodOfServiceID = 0;
                            model.batchID = 0;
                            if(model.fee.value.isNotEmpty){
                              model.fee.value = '';
                            }
                          },
                        ),
                        SizedBox(height: 15.h,),
                        AppStreamBuilder<List<String>>(
                          stream: model.psaCategory,
                          initialData: [],
                          dataBuilder: (context, snapshot) {
                            return CustomDropdownButton(
                              items: model.psaCategory.value,
                              isMutiSelect: false,
                              dropdownName: 'PSA Category',
                              showAstreik: false,
                              showBorderColor: false,
                              onMultiSelect: (List<String> selectedValues) {},
                              singleSelectItemSubject: model.selectedPsaCategory,
                              onSingleSelect: (selectedValue) {
                                if(model.selectedPsaCategory.value == selectedValue){
                                  return;
                                }
                                model.selectedPsaCategory.value = selectedValue;
                                model.feeCategoryID = model.psaEnrollmentDetail.value.data?.feeCategory?.firstWhereOrNull(
                                  (element) => element.feeSubType == model.selectedPsaSubType.value && element.feeCategory == selectedValue,
                                )?.feeCategoryId??0;
                                List<String> options = [];
                                (model.psaEnrollmentDetail.value.data?.feeSubCategory ??[]).forEach((element) {
                                  if (element.feeCategory == selectedValue && element.feeSubType == model.selectedPsaSubType.value) {
                                    options.add(element.feeSubcategory ?? '');
                                  }
                                });
                                model.psaSubCategory.add(options);
                                model.selectedPsaSubCategory.value = '';
                                model.periodOfService.value.clear();
                                model.selectedPeriodOfService.value = '';
                                model.psaBatch.value.clear();
                                model.selectedPsaBatch.value = '';
                                model.feeSubCategoryID = 0;
                                model.periodOfServiceID = 0;
                                model.batchID = 0;
                                if(model.fee.value.isNotEmpty){
                                model.fee.value = '';
                                }
                              },
                            );
                          }
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        AppStreamBuilder<List<String>>(
                          stream: model.psaSubCategory,
                          initialData: [],
                          dataBuilder: (context, snapshot) {
                            return CustomDropdownButton(
                              items: model.psaSubCategory.value,
                              isMutiSelect: false,
                              dropdownName: 'PSA Sub Category',
                              showAstreik: false,
                              showBorderColor: false,
                              onMultiSelect: (List<String> selectedValues) {},
                              singleSelectItemSubject: model.selectedPsaSubCategory,
                              onSingleSelect: (selectedValue) {
                                if(model.selectedPsaSubCategory.value == selectedValue){
                                  return;
                                }
                                model.feeSubCategoryID = model.psaEnrollmentDetail.value.data?.feeSubCategory?.firstWhereOrNull(
                                  (element) => element.feeSubType == model.selectedPsaSubType.value && element.feeCategory == model.selectedPsaCategory.value
                                    && element.feeSubcategory == selectedValue,
                                )?.feeSubcategoryId??0;
                                model.selectedPsaSubCategory.value = selectedValue;
                                List<String> options = [];
                                (model.psaEnrollmentDetail.value.data?.periodOfService ??[]).forEach((element) {
                                  if ( element.feeSubcategory == selectedValue
                                  && element.feeCategory == model.selectedPsaCategory.value 
                                  && element.feeSubType == model.selectedPsaSubType.value) {
                                    options.add(element.periodOfService ?? '');
                                  }
                                });
                                model.periodOfService.add(options);
                                model.selectedPeriodOfService.value = '';
                                model.psaBatch.value.clear();
                                model.selectedPsaBatch.value = '';
                                model.periodOfServiceID = 0;
                                model.batchID = 0;
                                if(model.fee.value.isNotEmpty){
                                  model.fee.value = '';
                                }
                              },
                            );
                          }
                        ),
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
                              onMultiSelect: (List<String> selectedValues) {},
                              singleSelectItemSubject: model.selectedPeriodOfService,
                              onSingleSelect: (selectedValue) {
                                if(model.selectedPeriodOfService.value == selectedValue){
                                  return;
                                }
                                model.periodOfServiceID = model.psaEnrollmentDetail.value.data?.periodOfService?.firstWhereOrNull(
                                  (element) => element.feeSubType == model.selectedPsaSubType.value && element.feeCategory == model.selectedPsaCategory.value
                                    && element.feeSubcategory == model.selectedPsaSubCategory.value && element.periodOfService == selectedValue,
                                )?.periodOfServiceId??0;
                                model.selectedPeriodOfService.value = selectedValue;
                                List<String> options = [];
                                (model.psaEnrollmentDetail.value.data?.batches ??[]).forEach((element) {
                                  if ( element.periodOfService == selectedValue 
                                  && element.feeSubcategory == model.selectedPsaSubCategory.value
                                  && element.feeCategory == model.selectedPsaCategory.value 
                                  && element.feeSubType == model.selectedPsaSubType.value) {
                                    options.add(element.batchName ?? '');
                                  }
                                });
                                model.psaBatch.add(options);
                                model.selectedPsaBatch.value = '';
                                model.batchID = 0;
                                if(model.fee.value.isNotEmpty){
                                  model.fee.value = '';
                                }
                              },
                            );
                          }
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        AppStreamBuilder<List<String>>(
                          stream: model.psaBatch,
                          initialData: [],
                          dataBuilder: (context, snapshot) {
                            return CustomDropdownButton(
                              items: model.psaBatch.value,
                              isMutiSelect: false,
                              dropdownName: 'PSA Batch',
                              showAstreik: false,
                              showBorderColor: false,
                              onMultiSelect: (List<String> selectedValues) {},
                              singleSelectItemSubject: model.selectedPsaBatch,
                              onSingleSelect: (selectedValue) {
                                if(model.selectedPsaBatch.value == selectedValue){
                                  return;
                                }
                                model.selectedPsaBatch.value = selectedValue;
                                model.batchID = model.psaEnrollmentDetail.value.data?.batches?.firstWhereOrNull(
                                  (element) => element.feeSubType == model.selectedPsaSubType.value && element.feeCategory == model.selectedPsaCategory.value
                                    && element.feeSubcategory == model.selectedPsaSubCategory.value && element.periodOfService == model.selectedPeriodOfService.value
                                    && element.batchName == selectedValue,
                                )?.batchId??0;
                                if(model.fee.value.isNotEmpty){
                                  model.fee.value = '';
                                }
                              },
                            );
                          }
                        ),
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
                            return model.fee.value.isEmpty ? Center(
                              child: CommonElevatedButton(
                                onPressed: () {
                                  model.calculateFees();
                                },
                                text: "Calculate",
                                backgroundColor: AppColors.accent,
                                width: double.infinity,
                                textStyle: AppTypography.subtitle2
                                    .copyWith(color: AppColors.textDark),
                              ),
                            ) : Row(  
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CommonElevatedButton(
                                    onPressed: () {
                                      model.enrollPsa();
                                    },
                                    text: "Enroll Now",
                                    backgroundColor: AppColors.accent,
                                    textStyle: AppTypography.subtitle2
                                      .copyWith(color: AppColors.textDark),
                                  ),
                                ),
                                SizedBox(width: 15.w,),
                                Expanded(
                                  flex: 1,
                                  child: CommonElevatedButton(
                                    onPressed: () {
                                      model.fee.value = '';
                                      model.selectedPsaSubType.value = '';
                                      model.feeSubTypeID = 0;
                                      model.psaCategory.value.clear();
                                      model.selectedPsaCategory.value = '';
                                      model.psaSubCategory.value.clear();
                                      model.selectedPsaSubCategory.value = '';
                                      model.periodOfService.value.clear();
                                      model.selectedPeriodOfService.value = '';
                                      model.psaBatch.value.clear();
                                      model.selectedPsaBatch.value = '';
                                      model.feeCategoryID = 0;
                                      model.feeSubCategoryID = 0;
                                      model.periodOfServiceID = 0;
                                      model.batchID = 0;
                                    },
                                    text: "Reset",
                                    backgroundColor: AppColors.primaryOn,
                                    textStyle: AppTypography.subtitle2
                                      .copyWith(color: AppColors.primary),
                                  ),
                                )
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                  );
                }
                else{
                  return const Center(
                    child: CommonText(text: "Data not found"),
                  );
                }
              }
            ),
            if(model.showLoader.value == true)...[const CommonAppLoader()]
          ],
        );
      }
    );
  }
}
