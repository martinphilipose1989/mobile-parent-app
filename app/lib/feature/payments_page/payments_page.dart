import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments_page/payments_page_view.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class PaymentsPage extends BasePage<PaymentsPageModel> {
  const PaymentsPage({super.key});

  @override
  PaymentsPageState createState() => PaymentsPageState();
}

class PaymentsPageState
    extends AppBasePageState<PaymentsPageModel, PaymentsPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<PaymentsPageModel> provideBase() {
    return paymentsPageModelProvider;
  }

  @override
  void onModelReady(PaymentsPageModel model) {
    model.paymentModes.addAll(ProviderScope.containerOf(context)
        .read(paymentsModelProvider)
        .finalPaymentModelList);
    model.selectedFees.addAll(ProviderScope.containerOf(context)
        .read(paymentsModelProvider)
        .selectedPendingFessList);

    model.amount.text = ProviderScope.containerOf(context)
        .read(paymentsModelProvider)
        .totalAmount
        .value
        .toString();
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
      width: 390.w,
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
              AppStreamBuilder<int>(
                stream: ProviderScope.containerOf(context)
                    .read(paymentsModelProvider)
                    .totalAmount,
                initialData: ProviderScope.containerOf(context)
                    .read(paymentsModelProvider)
                    .totalAmount
                    .value,
                dataBuilder: (context, data) {
                  return CommonText(
                    text: '₹ $data',
                    style: AppTypography.h6.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary),
                  );
                },
              ),
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
                    } else {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.webview,
                      );
                    }
                  }
                },
                dataBuilder: (context, data) {
                  return data!.status == Status.loading
                      ? const SizedBox(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 40.h,
                          width: 110.w,
                          child: CommonElevatedButton(
                            onPressed: () {
                              switch (stringValue) {
                                case 'Current Date Cheque / Post Dated Cheque / ...':
                                  model.selectedPaymentMode = 8;
                                  break;
                                case 'Paytm':
                                  model.selectedPaymentMode = 1;
                                  break;
                                case 'Easebuzz':
                                  model.selectedPaymentMode = 1;
                                  break;
                                default:
                              }
                              model.getValidateOnPay(model.selectedPaymentMode);
                            },
                            text: 'Pay Now',
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            textStyle: AppTypography.subtitle2.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                          ));
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
