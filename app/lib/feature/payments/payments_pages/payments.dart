// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments/payments_pages/payments_model.dart';
import 'package:app/feature/payments/payments_pages/payments_view.dart';
import 'package:app/feature/payments_page/payments_page.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../base/app_base_page.dart';

class Payments extends BasePage<PaymentsModel> {
  final PaymentArguments paymentArguments;
  const Payments({
    super.key,
    required this.paymentArguments,
  });

  @override
  PaymentsPageState createState() => PaymentsPageState();
}

class PaymentsPageState extends AppBasePageState<PaymentsModel, Payments>
    with TickerProviderStateMixin {
  @override
  ProviderBase<PaymentsModel> provideBase() {
    return paymentsModelProvider;
  }

  @override
  void onModelReady(PaymentsModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.tabController = TabController(length: 2, vsync: this);
    if (widget.paymentArguments.enquiryId?.isEmpty ??
        false || widget.paymentArguments.enquiryId == null) {
      model.selectedStudent = ProviderScope.containerOf(context)
              .read(dashboardViewModelProvider)
              .selectedStudentId ??
          [];
      if (model.selectedStudent != null) {
        List<int> temp = [];
        for (var selectedStudent in model.selectedStudent!) {
          temp.add(selectedStudent.id!);
        }
        model.studentIDs = temp;
      }
      model.phoneNo = int.parse(widget.paymentArguments.phoneNo);
      model.getStudentList(model.phoneNo);
    } else {
      model.phoneNo = widget.paymentArguments.phoneNo.isEmpty
          ? 0
          : int.parse(widget.paymentArguments.phoneNo);
      model.paymentArguments = widget.paymentArguments;
      model.updateStudentDetailsForEnquiry(model.paymentArguments);
    }
  }

  @override
  Widget buildView(BuildContext context, PaymentsModel model) {
    return PaymentsView(provideBase());
  }

  @override
  Widget? buildBottomNavigationBar(PaymentsModel model) {
    return AppStreamBuilder<bool>(
        stream: model.paymentsLoader,
        initialData: model.paymentsLoader.value,
        dataBuilder: (context, data) {
          return data! ? const SizedBox.shrink() : payNowButton(model);
        });
  }

  Widget payNowButton(PaymentsModel model) {
    return StreamBuilder<int>(
        stream: model.selectedValue,
        builder: (context, snapshot) {
          return snapshot.data == 0
              ? Container(
                  height: 100.h,
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
                            style: AppTypography.smallCaption
                                .copyWith(color: AppColors.textGray),
                          ),
                          AppStreamBuilder<int>(
                            stream: model.totalAmount,
                            initialData: model.totalAmount.value,
                            dataBuilder: (context, data) {
                              return CommonText(
                                text: CurrencyFormatter.formatToRupee(
                                    data.toString()),
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
                          width: 140.w,
                          child: CommonElevatedButton(
                            onPressed: () {
                              bool result =
                                  model.checkWhetherfeesIdExistInPayments();
                              if (model.finalPaymentModelList.isEmpty) {
                                CommonPopups().showWarning(context,
                                    'Sorry the selected fee do not satisfy payment mode');
                              } else if (result) {
                                CommonPopups().showWarning(context,
                                    'You need to pay fees as per Order Of Preference');
                              } else {
                                Navigator.pushNamed(
                                    context, RoutePaths.paymentsPage,
                                    arguments: PaymentPageeArguments(
                                        currentStage: widget
                                            .paymentArguments.currentStage,
                                        enquiryId:
                                            widget.paymentArguments.enquiryId,
                                        modules: widget.paymentArguments.module,
                                        finalPaymentModelList:
                                            model.finalPaymentModelList,
                                        selectedPendingFessList:
                                            model.selectedPendingFessList));
                              }
                            },
                            text: 'Continue',
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

class PaymentArguments {
  final String? enquiryId;
  final String? enquiryNo;
  final String? studentName;
  final String phoneNo;
  final Modules module;
  // MARKETING MODULE
  final String? currentStage;

  PaymentArguments(
      {required this.phoneNo,
      this.enquiryId,
      this.enquiryNo,
      this.studentName,
      this.currentStage,
      this.module = Modules.finance});

  @override
  String toString() {
    return 'PaymentArguments(enquiryId: $enquiryId, enquiryNo: $enquiryNo, studentName: $studentName, phoneNo: $phoneNo)';
  }
}
