import 'package:app/di/states/viewmodels.dart';
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
                              // Total Fees
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
                              CommonText(
                                text: "Select Bus Type",
                                style: AppTypography.subtitle2,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              const SelectBusType(),
                              SizedBox(height: 15.h),
                              const SelectServiceType(),
                              SizedBox(height: 15.h),
                              const ChooseOneWayToRoute(),
                              SizedBox(height: 15.h),

                              const RoutePoints(),

                              const BothWayRoutes(),

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

class SelectBusType extends StatelessWidget {
  const SelectBusType({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      providerBase: transportPageModelProvider,
      builder: (context, model, _) => Column(
        children: List.generate(
          model!.feeSubType.length,
          (index) {
            return CommonRadioButtonWidget(
              commonRadioButton: model.radioButtonBusType,
              value: model.feeSubType[index],
              title: model.feeSubType[index],
              onOptionSelected: (value) {
                model.setFeeSubType(value!);
              },
            );
          },
        ),
      ),
    );
  }
}

class SelectServiceType extends StatelessWidget {
  const SelectServiceType({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, _) {
          return Visibility(
            visible: model!.serviceType.value.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Select The Service Type",
                  style: AppTypography.subtitle2,
                ),
                SizedBox(height: 10.h),
                AppStreamBuilder(
                  stream: model.serviceType,
                  initialData: const <String>[],
                  dataBuilder: (context, services) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: services?.length,
                      itemBuilder: (context, index) {
                        return CommonRadioButtonWidget(
                          commonRadioButton: model.radioButtonServiceType,
                          value: services?[index] ?? '',
                          title: services?[index] ?? '',
                          onOptionSelected: (value) {
                            model.setFeeCategory(value!);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
        providerBase: transportPageModelProvider);
  }
}

class ChooseOneWayToRoute extends StatelessWidget {
  const ChooseOneWayToRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, child) {
          return AppStreamBuilder<String?>(
              stream: model!.radioButtonServiceType.selectedItemStream,
              initialData: model.radioButtonServiceType.selectedItem,
              dataBuilder: (context, selectServiceType) {
                return Visibility(
                  visible: selectServiceType?.toLowerCase() == "one way",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      CommonText(
                        text: "Choose One Way Route",
                        style: AppTypography.subtitle2,
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          model.onWayRouteType.length,
                          (index) {
                            return CommonRadioButtonWidget(
                              commonRadioButton:
                                  model.radioButtonOneWayRouteType,
                              value: model.onWayRouteType[index],
                              title: model.onWayRouteType[index],
                              onOptionSelected: (value) {
                                model.fetchStop();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        providerBase: transportPageModelProvider);
  }
}

class RoutePoints extends StatelessWidget {
  const RoutePoints({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, _) {
          return AppStreamBuilder<String?>(
            stream: model!.radioButtonOneWayRouteType.selectedItemStream,
            initialData: model.radioButtonOneWayRouteType.selectedItem,
            dataBuilder: (context, oneWayRoute) {
              return switch (oneWayRoute) {
                'Pickup Point To School' => const PickUpPointToSchool(),
                'School to Drop Point' => const SchoolToDropPoint(),
                null => const SizedBox(),
                _ => const SizedBox(),
              };
            },
          );
        },
        providerBase: transportPageModelProvider);
  }
}

class PickUpPointToSchool extends StatelessWidget {
  const PickUpPointToSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, _) {
          return Column(
            children: [
              AppStreamBuilder(
                  stream: model!.oneWayPickupPoint,
                  initialData: model.oneWayPickupPoint.value,
                  dataBuilder: (context, oneWayList) {
                    return CustomDropdownButton(
                      items: oneWayList?.toSet().toList() ?? [],
                      dropdownName: "Pickup Point",
                      showAstreik: true,
                      showBorderColor: true,
                      isMutiSelect: false,
                      onMultiSelect: (_) {},
                      onSingleSelect: (selectedValue) {
                        model.filterPeriodService(routeType: "pickup");
                      },
                    );
                  }),
              SizedBox(height: 15.h),
              const CommonTextFormField(
                showAstreik: false,
                labelText: "Drop Point",
                readOnly: true,
              ),
            ],
          );
        },
        providerBase: transportPageModelProvider);
  }
}

class SchoolToDropPoint extends StatelessWidget {
  const SchoolToDropPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, _) {
          return Column(
            children: [
              const CommonTextFormField(
                showAstreik: false,
                labelText: "Pickup Point",
                readOnly: true,
              ),
              SizedBox(height: 15.h),
              AppStreamBuilder(
                  stream: model!.oneWayDropPoint,
                  initialData: model.oneWayDropPoint.value,
                  dataBuilder: (context, oneWayList) {
                    return CustomDropdownButton(
                      items: oneWayList?.toSet().toList() ?? [],
                      dropdownName: "Drop Point",
                      showAstreik: true,
                      showBorderColor: true,
                      isMutiSelect: false,
                      onMultiSelect: (_) {},
                      onSingleSelect: (selectedValue) {
                        model.filterPeriodService(routeType: "drop");
                      },
                    );
                  }),
            ],
          );
        },
        providerBase: transportPageModelProvider);
  }
}

class BothWayRoutes extends StatelessWidget {
  const BothWayRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, model, _) {
          return AppStreamBuilder<String?>(
              stream: model!.radioButtonServiceType.selectedItemStream,
              initialData: model.radioButtonServiceType.selectedItem,
              dataBuilder: (context, selectServiceType) {
                return Visibility(
                  visible: selectServiceType?.toLowerCase() == "both way",
                  child: Column(
                    children: [
                      AppStreamBuilder(
                          stream: model.oneWayPickupPoint,
                          initialData: model.oneWayPickupPoint.value,
                          dataBuilder: (context, oneWayList) {
                            return CustomDropdownButton(
                              items: oneWayList?.toSet().toList() ?? [],
                              dropdownName: "Pickup Point",
                              showAstreik: true,
                              showBorderColor: true,
                              isMutiSelect: false,
                              onMultiSelect: (_) {},
                              onSingleSelect: (selectedValue) {
                                model.filterPeriodService(routeType: "pickup");
                              },
                            );
                          }),
                      SizedBox(height: 15.h),
                      AppStreamBuilder(
                          stream: model.oneWayDropPoint,
                          initialData: model.oneWayDropPoint.value,
                          dataBuilder: (context, oneWayList) {
                            return CustomDropdownButton(
                              items: oneWayList?.toSet().toList() ?? [],
                              dropdownName: "Drop Point",
                              showAstreik: true,
                              showBorderColor: true,
                              isMutiSelect: false,
                              onMultiSelect: (_) {},
                              onSingleSelect: (selectedValue) {
                                model.filterPeriodService(routeType: "drop");
                              },
                            );
                          }),
                    ],
                  ),
                );
              });
        },
        providerBase: transportPageModelProvider);
  }
}
