import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class ChequePageView extends BasePageViewWidget<ChequePageModel> {
  ChequePageView(super.providerBase);

  @override
  Widget build(BuildContext context, ChequePageModel model) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(children: [
        CommonSizedBox.sizedBox(height: 20, width: 10),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Payment Type',
          controller: model.payemntType,
          readOnly: true,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'In Favour',
          controller: model.inFavour,
          readOnly: true,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        CommonTextFormField(
          showAstreik: true,
          labelText: 'Amount',
          controller: model.amount,
          readOnly: true,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        const Divider(
          height: 10,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: model.formKey,
            child: AppStreamBuilder(
              stream: model.noOfCheques,
              initialData: model.noOfCheques.value,
              dataBuilder: (context, data) {
                return ListView.builder(
                  itemCount: model.noOfCheques.value,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        index == 0
                            ? const SizedBox.shrink()
                            : CommonSizedBox.sizedBox(height: 20, width: 10),
                        index == 0
                            ? const SizedBox.shrink()
                            : Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.removeCheque(index);
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                    CommonSizedBox.sizedBox(
                                        height: 20, width: 10),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 48,
                          child: CustomDropdownButton(
                            onMultiSelect: (selectedValues) {},
                            onSingleSelect: (selectedValue) {
                              // model.tokenNumberControllers[index].text =
                              //     model.getChequeId(selectedValue).toString();
                              model.addCheque(selectedValue, index);
                            },
                            isMutiSelect: false,
                            width: MediaQuery.of(context).size.width,
                            items: model.chequeTypes,
                            showAstreik: true,
                            showBorderColor: true,
                            dropdownName: 'Cheque Type',
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 20, width: 10),
                        AppStreamBuilder<List<bool>>(
                          stream: model.selectedChequeType,
                          initialData: model.selectedChequeType.value,
                          dataBuilder: (context, data) {
                            return data![index] == true
                                ? Column(
                                    children: [
                                      AppStreamBuilder<
                                          Resource<GetTokenGeneratorModel>>(
                                        stream: model.getTokenGeneratorModel,
                                        initialData: Resource.none(),
                                        dataBuilder: (context, data) {
                                          return data!.status == Status.loading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : CommonTextFormField(
                                                  showAstreik: false,
                                                  readOnly: true,
                                                  labelText: 'Token Number',
                                                  controller: model
                                                          .tokenNumberControllers[
                                                      index],
                                                );
                                        },
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      SizedBox(
                                          height: 48,
                                          child: CustomDropdownButton(
                                            onMultiSelect: (selectedValues) {
                                              // model.feeTypeControllers[index]
                                              //     .text = selectedValues.length > 1 ? selectedValues[0]:selectedValues.map((e)=> );
                                            },
                                            isMutiSelect: true,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            items: model.feesType,
                                            showAstreik: true,
                                            showBorderColor: true,
                                            validator: (value) =>
                                                AppValidators.validateNotEmpty(
                                                    value, 'Fees Type'),
                                            dropdownName: 'Fees Type',
                                          )),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Cheque Number',
                                        controller: model
                                            .chequeNumberControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'Cheque Number'),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Cheque Date',
                                        controller:
                                            model.chequeDateControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'Cheque Date'),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Bank Name',
                                        controller:
                                            model.ifscCodeControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'Bank Name'),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'IFSC Code',
                                        controller:
                                            model.ifscCodeControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'IFSC Code'),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Issue Name',
                                        controller:
                                            model.issueNameControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'IFSC Code'),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      CommonTextFormField(
                                        showAstreik: true,
                                        labelText: 'Amount',
                                        controller:
                                            model.amountControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'IFSC Code'),
                                      ),
                                    ],
                                  )
                                : const SizedBox();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )),
        AppStreamBuilder<List<bool>>(
            stream: model.selectedChequeType,
            initialData: model.selectedChequeType.value,
            dataBuilder: (context, data) {
              return data!.isEmpty
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonSizedBox.sizedBox(height: 20, width: 10),
                        InkWell(
                          onTap: () {
                            model.noOfCheques.add(model.noOfCheques.value + 1);
                          },
                          child: CommonText(
                            text: '+Add Another Cheque',
                            style: AppTypography.subtitle2.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 20, width: 10),
                      ],
                    );
            }),
        AppStreamBuilder<Resource<GetStorePaymentModel>>(
          stream: model.getStorePaymentModel,
          initialData: Resource.none(),
          onData: (value) {
            if (value.status == Status.success) {
              CommonPopups().showSuccess(
                context,
                'Payment\nSuccessfull!',
                (shouldRoute) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutePaths.payments, ModalRoute.withName('/'));
                },
              );
            }
          },
          dataBuilder: (context, data) {
            return data!.status == Status.loading
                ? const SizedBox(
                    width: 100,
                    child: CircularProgressIndicator(),
                  )
                : CommonElevatedButton(
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      model.submitForm(model);
                    },
                    text: 'Continue',
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    textStyle: AppTypography.subtitle2.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary),
                  );
          },
        )
      ]),
    );
  }
}
