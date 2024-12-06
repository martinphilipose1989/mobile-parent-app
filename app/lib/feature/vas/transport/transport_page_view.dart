import 'package:app/feature/vas/transport/transport_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/string_extension.dart';
import 'package:collection/collection.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class TransportPageView extends BasePageViewWidget<TransportDetailViewModel> {
  TransportPageView(super.providerBase);

  @override
  Widget build(BuildContext context, TransportDetailViewModel model) {
    return AppStreamBuilder<bool>(
        stream: model.showLoader,
        initialData: model.showLoader.value,
        dataBuilder: (context, snapshot) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: AppStreamBuilder<
                        Resource<TransportEnrollmentResponseModel>>(
                    stream: model.fetchTransportEnrollmentDetail,
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
                                  dataBuilder: (context, data) {
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
                                text: "Select Bus Type",
                                style: AppTypography.subtitle2,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Column(
                                children: List.generate(
                                  model.busType.value.length,
                                  (index) {
                                    return CommonRadioButtonWidget(
                                      commonRadioButton:
                                          model.radioButtonBusType,
                                      value: model.busType.value[index],
                                      title: model.busType.value[index],
                                      onOptionSelected: (value) {
                                        List<String> options = [];
                                        (model.transportEnrollmentDetail.value
                                                    .data?.feeCategory ??
                                                [])
                                            .forEach((element) {
                                          if (element.feeSubType == value) {
                                            options
                                                .add(element.feeCategory ?? '');
                                          }
                                        });
                                        model.feeSubTypeID = model
                                                .transportEnrollmentDetail
                                                .value
                                                .data
                                                ?.feeSubType
                                                ?.firstWhereOrNull((element) =>
                                                    element.feeSubType ==
                                                    model.radioButtonBusType
                                                        .selectedItem)
                                                ?.feeSubTypeId ??
                                            0;
                                        model.serviceType.add(options);
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              const CommonText(
                                text: "Select The Service Type",
                                style: AppTypography.subtitle2,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppStreamBuilder<List<String>>(
                                  stream: model.serviceType,
                                  initialData: model.serviceType.value,
                                  dataBuilder: (context, data) {
                                    return Column(
                                      children: List.generate(
                                        model.serviceType.value.length,
                                        (index) {
                                          return CommonRadioButtonWidget(
                                            commonRadioButton:
                                                model.radioButtonServiceType,
                                            value:
                                                model.serviceType.value[index],
                                            title:
                                                model.serviceType.value[index],
                                            onOptionSelected: (value) {
                                              if ((model.radioButtonServiceType
                                                              .selectedItem ??
                                                          '')
                                                      .toLowerCase() ==
                                                  "both way") {
                                                model.fetchStop(
                                                    forBothWay: true,
                                                    routeType: "1");
                                                model.fetchStop(
                                                    forBothWay: true,
                                                    routeType: "2");
                                                if (!model.feeSubCategoryStart
                                                        .isEmptyOrNull() ||
                                                    !model.feeSubCategoryEnd
                                                        .isEmptyOrNull()) {
                                                  model.feeSubCategoryStart =
                                                      null;
                                                  model.feeSubCategoryEnd =
                                                      null;
                                                }
                                              }
                                              model.feeCategoryID = model
                                                      .transportEnrollmentDetail
                                                      .value
                                                      .data
                                                      ?.feeCategory
                                                      ?.firstWhereOrNull((element) =>
                                                          element.feeCategory ==
                                                          model
                                                              .radioButtonServiceType
                                                              .selectedItem)
                                                      ?.feeCategoryId ??
                                                  0;
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  }),
                              AppStreamBuilder<String?>(
                                stream: model
                                    .radioButtonServiceType.selectedItemStream,
                                initialData:
                                    model.radioButtonServiceType.selectedItem,
                                dataBuilder: (context, data) {
                                  return (data ?? '').toLowerCase() == "one way"
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            const CommonText(
                                              text: "Choose One Way Route",
                                              style: AppTypography.subtitle2,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Column(
                                              children: List.generate(
                                                model.onWayRouteType.length,
                                                (index) {
                                                  return CommonRadioButtonWidget(
                                                    commonRadioButton: model
                                                        .radioButtonOneWayRouteType,
                                                    value: model
                                                        .onWayRouteType[index],
                                                    title: model
                                                        .onWayRouteType[index],
                                                    onOptionSelected: (value) {
                                                      model.fetchStop();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            AppStreamBuilder<String?>(
                                              stream: model
                                                  .radioButtonOneWayRouteType
                                                  .selectedItemStream,
                                              initialData: model
                                                  .radioButtonOneWayRouteType
                                                  .selectedItem,
                                              dataBuilder: (context, data) {
                                                return ((data ?? '') ==
                                                        'Pickup Point To School')
                                                    ? Column(
                                                        children: [
                                                          AppStreamBuilder<
                                                              List<String>>(
                                                            stream: model
                                                                .oneWayPickupPoint,
                                                            initialData: model
                                                                .oneWayPickupPoint
                                                                .value,
                                                            dataBuilder:
                                                                (context,
                                                                    data) {
                                                              return CustomDropdownButton(
                                                                items: model
                                                                    .oneWayPickupPoint
                                                                    .value
                                                                    .toSet()
                                                                    .toList(),
                                                                isMutiSelect:
                                                                    false,
                                                                dropdownName:
                                                                    "Pickup Point",
                                                                showAstreik:
                                                                    true,
                                                                showBorderColor:
                                                                    true,
                                                                onMultiSelect:
                                                                    (selectedValues) {},
                                                                onSingleSelect:
                                                                    (selectedValue) {
                                                                  model.feeSubCategoryStart =
                                                                      selectedValue;
                                                                  model
                                                                      .filterPeriodService();
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          const CommonTextFormField(
                                                            showAstreik: false,
                                                            labelText:
                                                                "Drop Point",
                                                            readOnly: true,
                                                          ),
                                                        ],
                                                      )
                                                    : ((data ?? '') ==
                                                            "School to Drop Point")
                                                        ? Column(
                                                            children: [
                                                              const CommonTextFormField(
                                                                showAstreik:
                                                                    false,
                                                                labelText:
                                                                    "Pickup Point",
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              AppStreamBuilder<
                                                                  List<String>>(
                                                                stream: model
                                                                    .oneWayPickupPoint,
                                                                initialData: model
                                                                    .oneWayPickupPoint
                                                                    .value,
                                                                dataBuilder:
                                                                    (context,
                                                                        data) {
                                                                  return CustomDropdownButton(
                                                                    items: model
                                                                        .oneWayDropPoint
                                                                        .value
                                                                        .toSet()
                                                                        .toList(),
                                                                    isMutiSelect:
                                                                        false,
                                                                    dropdownName:
                                                                        "Drop Point",
                                                                    showAstreik:
                                                                        true,
                                                                    showBorderColor:
                                                                        true,
                                                                    onMultiSelect:
                                                                        (selectedValues) {},
                                                                    onSingleSelect:
                                                                        (selectedValue) {
                                                                      model.feeSubCategoryStart =
                                                                          selectedValue;
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox
                                                            .shrink();
                                              },
                                            )
                                          ],
                                        )
                                      : ((data ?? '').toLowerCase() ==
                                              'both way')
                                          ? Column(
                                              children: [
                                                AppStreamBuilder<List<String>>(
                                                  stream:
                                                      model.oneWayPickupPoint,
                                                  initialData: model
                                                      .oneWayPickupPoint.value,
                                                  dataBuilder: (context, data) {
                                                    return CustomDropdownButton(
                                                      items: model
                                                          .oneWayPickupPoint
                                                          .value
                                                          .toSet()
                                                          .toList(),
                                                      isMutiSelect: false,
                                                      dropdownName:
                                                          "Pickup Point",
                                                      showAstreik: true,
                                                      showBorderColor: true,
                                                      onMultiSelect:
                                                          (selectedValues) {},
                                                      onSingleSelect:
                                                          (selectedValue) {
                                                        model.feeSubCategoryStart =
                                                            selectedValue;
                                                      },
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                AppStreamBuilder<List<String>>(
                                                  stream:
                                                      model.oneWayPickupPoint,
                                                  initialData: model
                                                      .oneWayPickupPoint.value,
                                                  dataBuilder: (context, data) {
                                                    return CustomDropdownButton(
                                                      items: model
                                                          .oneWayDropPoint
                                                          .value,
                                                      isMutiSelect: false,
                                                      dropdownName:
                                                          "Drop Point",
                                                      showAstreik: true,
                                                      showBorderColor: true,
                                                      onMultiSelect:
                                                          (selectedValues) {},
                                                      onSingleSelect:
                                                          (selectedValue) {
                                                        model.feeSubCategoryEnd =
                                                            selectedValue;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink();
                                },
                              ),
                              if ((model.radioButtonBusType.selectedItem
                                          ?.isNotEmpty ??
                                      false) &&
                                  (model.radioButtonServiceType.selectedItem
                                          ?.isNotEmpty ??
                                      false)) ...[
                                SizedBox(height: 10.h),
                                AppStreamBuilder<List<String>>(
                                  stream: model.periodOfService,
                                  initialData: model.periodOfService.value,
                                  dataBuilder: (context, data) {
                                    return CustomDropdownButton(
                                      items: data ?? [],
                                      isMutiSelect: false,
                                      dropdownName: "Period of Service",
                                      showAstreik: true,
                                      showBorderColor: true,
                                      onMultiSelect: (selectedValues) {},
                                      onSingleSelect: (selectedValue) {
                                        model.setPeriodOfService(selectedValue);
                                        // model.feeSubCategoryStart =
                                        //     selectedValue;
                                      },
                                    );
                                  },
                                ),
                              ],
                              const SizedBox(height: 100),
                              AppStreamBuilder<String>(
                                  stream: model.fee,
                                  initialData: model.fee.value,
                                  dataBuilder: (context, snapshot) {
                                    return model.fee.value.isEmpty
                                        ? Center(
                                            child: CommonElevatedButton(
                                              onPressed: () {
                                                model.calculateFees();
                                                // model.filterPeriodService();
                                              },
                                              text: "Calculate",
                                              backgroundColor: AppColors.accent,
                                              width: double.infinity,
                                              textStyle: AppTypography.subtitle2
                                                  .copyWith(
                                                      color:
                                                          AppColors.textDark),
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
                                                    model.enrollTransport();
                                                  },
                                                  text: "Enroll Now",
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
                                                    model.fee.value = '';
                                                    model.radioButtonBusType
                                                        .selectItem(null);
                                                    model.radioButtonServiceType
                                                        .selectItem(null);
                                                    model
                                                        .radioButtonOneWayRouteType
                                                        .selectItem(null);
                                                    model.feeSubTypeID = 0;
                                                    model.feeCategoryID = 0;
                                                    model.feeSubCategoryStart =
                                                        null;
                                                    model.feeSubCategoryEnd =
                                                        null;
                                                  },
                                                  text: "Reset",
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
                        );
                      } else {
                        return const CommonText(
                            text: "Transport Details not found");
                      }
                    }),
              ),
              if (model.showLoader.value) ...[const CommonAppLoader()]
            ],
          );
        });
  }
}
