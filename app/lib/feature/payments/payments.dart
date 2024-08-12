import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payments_view.dart';
import 'package:app/feature/payments/payments_model.dart';
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

class Payments extends BasePage<PaymentsModel> {
  const Payments({super.key});

  @override
  PaymentsPageState createState() => PaymentsPageState();
}

class PaymentsPageState extends AppBasePageState<PaymentsModel, Payments>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<PaymentsModel> provideBase() {
    return paymentsModelProvider;
  }

  @override
  void onModelReady(PaymentsModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.tabController = TabController(length: 2, vsync: this);
    model.getStudentList();
    model.getAcademicYear();
    model.getSchoolNames();
    model.studentIDs.add(2);
    model.filterPendingFeeList(studentIDs: model.studentIDs, academicYear: []);
  }

  @override
  Widget buildView(BuildContext context, PaymentsModel model) {
    return PaymentsView(provideBase());
  }

  @override
  Widget? buildBottomNavigationBar(PaymentsModel model) {
    // TODO: implement buildBottomNavigationBar
    return payNowButton(model);
  }

  Widget payNowButton(PaymentsModel model) {
    return StreamBuilder<int>(
        stream: model.selectedValue,
        builder: (context, snapshot) {
          return snapshot.data == 0
              ? Container(
                  height: 90.h,
                  width: 390.w,
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                  decoration:
                      const BoxDecoration(color: AppColors.primaryLighter),
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
                            style: AppTypography.body1
                                .copyWith(color: Colors.grey),
                          ),
                          AppStreamBuilder<int>(
                            stream: model.totalAmount,
                            initialData: model.totalAmount.value,
                            dataBuilder: (context, data) {
                              return CommonText(
                                text: '₹ $data',
                                style: AppTypography.h6.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                          height: 40.h,
                          width: 110.w,
                          child: CommonElevatedButton(
                            onPressed: () {
                              model.checkWhetherfeesIdExistInPayments();
                              if (model.finalPaymentModelList.isEmpty) {
                                CommonPopups().showWarning(context,
                                    'Sorry the selected fee do not satisfy payment mode');
                              } else {
                                Navigator.pushNamed(
                                    context, RoutePaths.paymentsPage);
                              }
                            },
                            text: 'Pay Now',
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            textStyle: AppTypography.subtitle2.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                          ))
                    ],
                  ),
                )
              : const SizedBox.shrink();
        });
  }

  @override
  PreferredSizeWidget? buildAppbar(PaymentsModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Fee Collection',
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }
}
