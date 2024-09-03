import 'package:app/feature/payments/payment_history/payment_history_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/payment_history/switch_views_payment_history.dart';
import 'package:app/molecules/payments/payments_chips_list.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class PaymentsHistoryView extends BasePageViewWidget<PaymentHistoryModel> {
  PaymentsHistoryView(super.providerBase);

  @override
  Widget build(BuildContext context, PaymentHistoryModel model) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 20, width: 10),
        AppStreamBuilder<Resource<GetAcademicYearModel>>(
          stream: model.getAcademicYearModel,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            return data!.status == Status.loading
                ? const SizedBox(
                    child: CircularProgressIndicator(),
                  )
                : data.data?.data == null
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 50.h,
                          width: 175.w,
                          child: CustomDropdownButton(
                            displayZerothIndex: true,
                            onMultiSelect: (selectedValues) {
                              model.getSelectedAcademicYear(
                                  selectedValues: selectedValues,
                                  data: data.data?.data ?? [],
                                  onchange: (values) {
                                    if (model.switchTabsPaymentHistory.value ==
                                        0) {
                                      model.getFeesCollected();
                                    } else if (model
                                            .switchTabsPaymentHistory.value ==
                                        1) {
                                      model.getFeesType();
                                    } else {
                                      model.getStudentLedger();
                                    }
                                  });
                            },
                            dropdownName: 'Select Academic year',
                            showAstreik: true,
                            showBorderColor: true,
                            items:
                                data.data?.data?.map((e) => e.name).toList() ??
                                    [],
                            isMutiSelect: true,
                          ),
                        ),
                      );
          },
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
                  return ChipsModel(
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
        SwitchViewPaymentHistory(providerBase)
      ],
    );
  }
}
