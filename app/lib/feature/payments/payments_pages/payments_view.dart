import 'package:app/feature/payments/payment_history/payment_history_page.dart';
import 'package:app/feature/payments/payments_pages/payments_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/payments/pending_amount_expansion_tile.dart';
import 'package:app/molecules/payments/payments_chips_list.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
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
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const PaymentHistoryPage());
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
                AppStreamBuilder(
                  stream: model.exactPendingAmountToBePaid,
                  initialData: model.exactPendingAmountToBePaid.value,
                  dataBuilder: (context, data) {
                    return CommonText(
                      text: '₹ $data',
                      style: AppTypography.h6
                          .copyWith(color: Theme.of(cxt).colorScheme.primary),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        AppStreamBuilder<Resource<SchoolNamesModel>>(
          stream: model.getSchoolNamesModel,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            return data!.status == Status.loading
                ? const SizedBox(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: SizedBox(
                      height: 38.h,
                      child: PaymentsChipsList(
                        chipValues: List.generate(
                          data.data?.data?.brandCodes!.length ?? 0,
                          (index) {
                            return ChipsModel(
                                name: data
                                    .data?.data?.brandCodes![index].displayName,
                                isSelected: false);
                          },
                        ),
                        onCallBack: (routeName) {},
                      ),
                    ),
                  );
          },
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        PendingAmountExpansionTile(
          model: model,
        )
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
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child:
                    AppStreamBuilder<Resource<GetGuardianStudentDetailsModel>>(
                  stream: model.getGuardianStudentDetailsModel,
                  initialData: Resource.none(),
                  dataBuilder: (context, data) {
                    return data!.status == Status.loading
                        ? const SizedBox(
                            child: CircularProgressIndicator(),
                          )
                        : data.data?.data?.students == null
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 50.h,
                                width: 128.w,
                                child: CustomDropdownButton(
                                  dropdownName: '',
                                  width: 300,
                                  showAstreik: false,
                                  showBorderColor: false,
                                  displayZerothIndex: true,
                                  items: data.data?.data?.students!
                                          .map((e) => e.studentDisplayName)
                                          .toList() ??
                                      [],
                                  isMutiSelect: true,
                                  onMultiSelect: (selectedValues) {
                                    model.getSelectedStudentIds(
                                        students:
                                            data.data?.data!.students ?? [],
                                        selectedValues: selectedValues);
                                  },
                                ),
                              );
                  },
                ),
              )
            ],
          ),
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
                      : SizedBox(
                          height: 50.h,
                          width: 175.w,
                          child: CustomDropdownButton(
                            displayZerothIndex: true,
                            onMultiSelect: (selectedValues) {
                              model.getSelectedAcademicYear(
                                  data: data.data?.data! ?? [],
                                  selectedValues: selectedValues);
                            },
                            dropdownName: 'Select Academic year',
                            showAstreik: true,
                            showBorderColor: true,
                            items:
                                data.data?.data?.map((e) => e.name).toList() ??
                                    [],
                            isMutiSelect: true,
                          ),
                        );
            },
          )
        ],
      ),
    );
  }
}
