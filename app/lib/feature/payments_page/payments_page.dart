import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments_page/payments_page_view.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
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
  void onModelReady(PaymentsPageModel model) {}

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
              CommonText(
                text: '₹ 80,000',
                style: AppTypography.h6
                    .copyWith(color: Theme.of(context).colorScheme.onTertiary),
              ),
            ],
          ),
          AppStreamBuilder<String>(
            stream: model.selectedPaymentType,
            initialData: model.selectedPaymentType.value,
            dataBuilder: (context, data) {
              return SizedBox(
                  height: 40.h,
                  width: 110.w,
                  child: CommonElevatedButton(
                    onPressed: () {
                      if (data == 'Payment Gateway') {
                        CommonPopups().showSuccess(
                          context,
                          'Payment\nSuccessfull!',
                          (shouldRoute) {},
                        );
                      } else {
                        Navigator.pushNamed(context, RoutePaths.chequePayment,
                            arguments: model);
                      }
                    },
                    text: 'Continue',
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    textStyle: AppTypography.subtitle2.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary),
                  ));
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
