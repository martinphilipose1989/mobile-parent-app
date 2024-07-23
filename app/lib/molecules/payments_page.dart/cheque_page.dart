import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';

class Chequepage extends StatelessWidget {
  const Chequepage({
    super.key,
    required this.pageModel,
  });

  final PaymentsPageModel pageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        child: CommonElevatedButton(
          width: MediaQuery.of(context).size.width,
          onPressed: () {
            CommonPopups().showSuccess(context, 'Payment\nSuccessfull!');
          },
          text: 'Continue',
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textStyle: AppTypography.subtitle2
              .copyWith(color: Theme.of(context).colorScheme.onTertiary),
        ),
      ),
      appBar: const CommonAppBar(
        appbarTitle: 'Cheque Page',
        notShowNotificationAndUserBatch: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const CommonTextFormField(
            showAstreik: true,
            labelText: 'Payment Type',
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const CommonTextFormField(
            showAstreik: true,
            labelText: 'In Favour',
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const CommonTextFormField(
            showAstreik: true,
            labelText: 'Amount',
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const Divider(
            height: 10,
            thickness: 1,
            color: AppColors.textPaleGray,
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const CommonTextFormField(
            showAstreik: false,
            labelText: 'Token Number',
          ),
          CommonSizedBox.sizedBox(height: 20, width: 10),
          CustomDropdownButton(
            onMultiSelect: (selectedValues) {},
            onSingleSelect: (selectedValue) {
              if (pageModel.chequeTypes.contains(selectedValue)) {
                pageModel.selectedChequeType.add(true);
              }
            },
            isMutiSelect: false,
            width: MediaQuery.of(context).size.width,
            items: pageModel.chequeTypes,
            showAstreik: true,
            showBorderColor: true,
            dropdownName: 'Cheque Type',
          ),
          AppStreamBuilder<bool>(
            stream: pageModel.selectedChequeType,
            initialData: pageModel.selectedChequeType.value,
            dataBuilder: (context, data) {
              return (data ?? false)
                  ? AppStreamBuilder<int>(
                      stream: pageModel.noOfCheques,
                      initialData: pageModel.noOfCheques.value,
                      dataBuilder: (context, data) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonSizedBox.sizedBox(height: 20, width: 10),
                            CustomDropdownButton(
                              onMultiSelect: (selectedValues) {},
                              isMutiSelect: true,
                              width: MediaQuery.of(context).size.width,
                              items: pageModel.feesType,
                              showAstreik: true,
                              showBorderColor: true,
                              dropdownName: 'Fees Type',
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                pageModel.noOfCheques.value,
                                (index) {
                                  return Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: index != 0
                                            ? Column(
                                                children: [
                                                  CommonSizedBox.sizedBox(
                                                      height: 20, width: 10),
                                                  InkWell(
                                                    onTap: () {
                                                      pageModel.noOfCheques
                                                          .add(data! - 1);
                                                    },
                                                    child: const Icon(
                                                      Icons.delete_outlined,
                                                      color: AppColors.failure,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      const CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Cheque Number',
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      const CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Cheque Date',
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      const CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'IFSC Code',
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      const CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Issue Name',
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      const CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Amount',
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            CommonSizedBox.sizedBox(height: 20, width: 10),
                            InkWell(
                              onTap: () {
                                pageModel.noOfCheques.add(data! + 1);
                              },
                              child: CommonText(
                                text: '+Add Another Cheque',
                                style: AppTypography.subtitle2.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : const SizedBox.shrink();
            },
          )
        ]),
      ),
    );
  }
}
