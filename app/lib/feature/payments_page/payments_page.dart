// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments_page/payments_page_view.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/feature/webview/webview_page.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/currency_formatter.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../base/app_base_page.dart';

class PaymentsPage extends BasePage<PaymentsPageModel> {
  final PaymentPageeArguments paymentPageeArguments;
  const PaymentsPage({
    super.key,
    required this.paymentPageeArguments,
  });

  @override
  PaymentsPageState createState() => PaymentsPageState();
}

class PaymentsPageState
    extends AppBasePageState<PaymentsPageModel, PaymentsPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<PaymentsPageModel> provideBase() {
    return paymentsPageModelProvider;
  }

  @override
  void onModelReady(PaymentsPageModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.paymentModes = widget.paymentPageeArguments.finalPaymentModelList;
    model.selectedFees
        .add(widget.paymentPageeArguments.selectedPendingFessList);
    model.phoneNo =
        ProviderScope.containerOf(context).read(paymentsModelProvider).phoneNo;
    model.amount.text = ProviderScope.containerOf(context)
        .read(paymentsModelProvider)
        .totalAmount
        .value
        .toString();
    model.finalAmount.value = model.amount.text;
    model.modules = widget.paymentPageeArguments.modules;
    model.getUserDetails();
  }

  @override
  Widget buildView(BuildContext context, PaymentsPageModel model) {
    return PaymentsPageView(provideBase());
  }

  @override
  Widget? buildBottomNavigationBar(PaymentsPageModel model) {
    return payNowButton(model);
  }

  Widget payNowButton(PaymentsPageModel model) {
    return Container(
      height: 90.h,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      decoration: const BoxDecoration(color: AppColors.primaryLighter),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: 'Total Amount',
                style: AppTypography.body1.copyWith(color: Colors.grey),
              ),
              // AppStreamBuilder<int>(
              //   stream: ProviderScope.containerOf(context)
              //       .read(paymentsModelProvider)
              //       .totalAmount,
              //   initialData: ProviderScope.containerOf(context)
              //       .read(paymentsModelProvider)
              //       .totalAmount
              //       .value,
              //   dataBuilder: (context, data) {
              //     return
              //   },
              // ),
              ValueListenableBuilder<String>(
                  valueListenable: model.finalAmount,
                  builder: (context, value, child) {
                    return CommonText(
                      text: CurrencyFormatter.formatToRupee(value),
                      style: AppTypography.h6.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary),
                    );
                  })
            ],
          ),
          AppStreamBuilder<String>(
            stream: model.selectedPaymentType,
            initialData: model.selectedPaymentType.value,
            dataBuilder: (context, stringValue) {
              return AppStreamBuilder<Resource<GetValidateOnPayModel>>(
                stream: model.getValidateOnPayModel,
                initialData: Resource.none(),
                onData: (value) {
                  if (value.status == Status.success) {
                    if (stringValue ==
                        'Current Date Cheque / Post Dated Cheque / ...') {
                      Navigator.pushNamed(context, RoutePaths.chequePayment,
                          arguments: model);
                    }
                  } else if (value.status == Status.error) {
                    CommonPopups().showError(
                        context,
                        value.dealSafeAppError?.error.message ?? '',
                        (shouldRoute) {});
                  }
                },
                dataBuilder: (context, getValidateOnPaydata) {
                  return AppStreamBuilder<
                      Resource<GetPaymentOrderResponseModel>>(
                    stream: model.getPaymentOrderResponseModel,
                    initialData: Resource.none(),
                    onError: (value) {},
                    onData: (value) {
                      if (value.status == Status.success) {
                        if (stringValue !=
                            'Current Date Cheque / Post Dated Cheque / ...') {
                          Navigator.pushNamed(context, RoutePaths.webview,
                                  arguments: WebviewArguments(
                                      paymentType: model.dynamicPaymentType
                                          ?.toLowerCase(),
                                      paymentsLink: model.dynamicPaymentType ==
                                                  "Billdesk" ||
                                              model.dynamicPaymentType ==
                                                  "GrayQuest"
                                          ? "${FlavorConfig.instance.values.financeBaseUrl}/finance/${value.data?.data?.paymentLink}"
                                          : value.data?.data?.paymentLink ?? '',
                                      orderId:
                                          value.data?.data?.order?.id ?? ''))
                              .then(
                            (value) {
                              if (value == true) {
                                ProviderScope.containerOf(context)
                                    .read(paymentsModelProvider)
                                    .getStudentList(model.phoneNo);
                                ProviderScope.containerOf(context)
                                    .read(paymentsModelProvider)
                                    .paymentsLoader
                                    .add(true);
                                ProviderScope.containerOf(context)
                                    .read(webViewProvider)
                                    .timer
                                    .cancel();
                                CommonPopups().showSuccess(
                                  context,
                                  'Payment\nSuccessfull!',
                                  (shouldRoute) {
                                    if (widget.paymentPageeArguments.modules ==
                                        Modules.admission) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          RoutePaths.tabbar, (route) => false);
                                    } else {
                                      Navigator.popUntil(
                                          context,
                                          ModalRoute.withName(
                                              RoutePaths.payments));
                                    }
                                  },
                                );
                              } else {
                                ProviderScope.containerOf(context)
                                    .read(webViewProvider)
                                    .timer
                                    .cancel();
                                CommonPopups().showError(
                                  context,
                                  'Payment\nFailure!',
                                  (shouldRoute) {},
                                );
                              }
                            },
                          );
                        }
                      } else if (value.status == Status.error) {
                        CommonPopups().showError(
                            context,
                            value.dealSafeAppError?.error.message ?? '',
                            (shouldRoute) {});
                      }
                    },
                    dataBuilder: (context, getPaymentOrderData) {
                      return getValidateOnPaydata!.status == Status.loading
                          ? const SizedBox(
                              child: CircularProgressIndicator(),
                            )
                          : getPaymentOrderData!.status == Status.loading
                              ? const SizedBox(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(
                                  height: 40.h,
                                  width: 140.w,
                                  child: CommonElevatedButton(
                                    onPressed: model
                                                .selectedPaymentType.value ==
                                            ""
                                        ? () {}
                                        : () {
                                            // razorpay, billdesk, paytmEDC, grayQuest
                                            if (stringValue ==
                                                "Pay Online-Billdesk") {
                                              stringValue = "Billdesk";
                                            }
                                            if (stringValue ==
                                                "E-Mandate-GrayQuest") {
                                              stringValue = "grayquest";
                                            }
                                            if (stringValue ==
                                                "EMI-GrayQuest") {
                                              stringValue = "grayquest";
                                            }

                                            switch (stringValue) {
                                              case 'Current Date Cheque / Post Dated Cheque / ...':
                                                model.selectedPaymentMode = 8;
                                                break;
                                              case 'Paytm':
                                                model
                                                    .setProviderIdAndServiceProvider(
                                                        stringValue ?? '');

                                                break;
                                              case 'Easebuzz':
                                                model
                                                    .setProviderIdAndServiceProvider(
                                                        stringValue ?? '');
                                                break;
                                              case 'Billdesk':
                                                model
                                                    .setProviderIdAndServiceProvider(
                                                        stringValue ?? '');
                                                break;
                                              default:
                                            }
                                            if (stringValue ==
                                                'Current Date Cheque / Post Dated Cheque / ...') {
                                              model.getValidateOnPay(
                                                  model.selectedPaymentMode);
                                            } else {
                                              model.dynamicPaymentType =
                                                  stringValue;
                                              model.getPaymentOrder(
                                                  model.selectedPaymentMode,
                                                  model.serviceProviderId);
                                            }
                                          },
                                    text: 'Pay Now',
                                    backgroundColor:
                                        model.selectedPaymentType.value == ""
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onTertiaryContainer
                                            : Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                    textStyle: AppTypography.subtitle2.copyWith(
                                        color:
                                            model.selectedPaymentType.value ==
                                                    ""
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary),
                                  ));
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar(PaymentsPageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: true,
      appbarTitle: 'Payments Page',
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}

class PaymentPageeArguments {
  final List<GetPendingFeesPaymentModeModel> finalPaymentModelList;
  final List<GetPendingFeesFeeModel> selectedPendingFessList;
  final Modules? modules;

  PaymentPageeArguments(
      {required this.finalPaymentModelList,
      required this.selectedPendingFessList,
      this.modules});
}
