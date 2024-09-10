import 'package:app/feature/payments/payments_model.dart';
import 'package:app/molecules/payments/pending_amount_expansion_tile.dart';
import 'package:app/molecules/payments/payments_chips_list.dart';
import 'package:app/molecules/payments/switch_views_payment_history.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentsView extends BasePageViewWidget<PaymentsModel> {
  PaymentsView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentsModel model) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            tabs(context, model),
          ],
        ));
  }

  Widget tabs(BuildContext cxt, PaymentsModel model) {
    return Column(
      children: [
        CommonTabPage(
          tabController: model.tabController,
          selectedValue: model.selectedValue,
          firstTabTitle: 'Pending Amount',
          secondTabTitle: 'Payment History',
        ),
        AppStreamBuilder<int>(
          stream: model.selectedValue,
          initialData: model.selectedValue.value,
          dataBuilder: (context, data) {
            return data == 0
                ? pendingAmount(cxt, model)
                : paymentHistory(cxt, model);
          },
        )
      ],
    );
  }

  Widget pendingAmount(BuildContext cxt, PaymentsModel model) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 20, width: 10),
        selectChildAndAcademicyear(cxt, model),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        Container(
          height: 46.h,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 2)
              ],
              borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    text: 'Calculated Amount',
                    style: AppTypography.body2
                        .copyWith(color: AppColors.inactiveNeutral60)),
                CommonText(
                  text: '₹ 10,000',
                  style: AppTypography.h6
                      .copyWith(color: Theme.of(cxt).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: SizedBox(
            height: 38.h,
            child: PaymentsChipsList(
              chipValues: List.generate(
                model.schoolList.length,
                (index) {
                  return Chips(
                      name: model.schoolList[index]['name'],
                      isSelected: model.schoolList[index]['isSelected']);
                },
              ),
              onCallBack: (routeName) {},
            ),
          ),
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        PendingAmountExpansionTile()
      ],
    );
  }

  Widget selectChildAndAcademicyear(BuildContext cxt, PaymentsModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.studentIcon,
                height: 20.h,
              ),
              SizedBox(
                height: 48.h,
                width: 128.w,
                child: CustomDropdownButton(
                  dropdownName: '',
                  showAstreik: false,
                  showBorderColor: false,
                  items: model.studentDropdownValues,
                  isMutiSelect: true,
                  onMultiSelect: (selectedValues) {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.h,
            width: 175.w,
            child: CustomDropdownButton(
              onMultiSelect: (selectedValues) {},
              dropdownName: 'Select Academic year',
              showAstreik: true,
              showBorderColor: true,
              items: model.academicYearDropdownValues,
              isMutiSelect: true,
            ),
          )
        ],
      ),
    );
  }

  Widget paymentHistory(BuildContext cxt, PaymentsModel model) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 20, width: 10),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 48.h,
            width: 175.w,
            child: CustomDropdownButton(
              dropdownName: 'Select Academic year',
              showAstreik: true,
              showBorderColor: true,
              items: model.academicYearDropdownValues,
              isMutiSelect: true,
              onMultiSelect: (selectedValues) {},
            ),
          ),
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: SizedBox(
            height: 38.h,
            child: PaymentsChipsList(
              chipValues: List.generate(
                model.paymentHistoryTypes.length,
                (index) {
                  return Chips(
                      name: model.paymentHistoryTypes[index]['name'],
                      isSelected: model.paymentHistoryTypes[index]
                          ['isSelected']);
                },
              ),
              onCallBack: (contentType) {
                model.switchTabsPaymentHistory.add(contentType);
                debugPrint(contentType.toString());
              },
            ),
          ),
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        SwitchViewPaymentHistory(providerBase),
      ],
    );
  }
}
