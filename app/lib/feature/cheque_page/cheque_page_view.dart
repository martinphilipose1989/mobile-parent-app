import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cheque_page/cheque_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_inputformatters.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                              model.chequeTypeControllers[index].text = model
                                  .getValueForMode(selectedValue)
                                  .toString();
                            },
                            isMutiSelect: false,
                            width: MediaQuery.of(context).size.width - 50,
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
                                      model.chequeTypeControllers[index].text ==
                                              "8"
                                          ? const SizedBox.shrink()
                                          : Column(
                                              children: [
                                                CommonSizedBox.sizedBox(
                                                    height: 20, width: 10),
                                                SizedBox(
                                                  height: 50,
                                                  child: CustomDropdownButton(
                                                    onMultiSelect:
                                                        (selectedValues) {},
                                                    onSingleSelect:
                                                        (selectedValue) {
                                                      model
                                                          .feeTypeControllers[
                                                              index]
                                                          .text = selectedValue;

                                                      model
                                                          .amountControllers[
                                                              index]
                                                          .text = model
                                                              .selectedPendingFessList
                                                              .firstWhere((e) =>
                                                                  e.feeDisplayName ==
                                                                  selectedValue)
                                                              .pending ??
                                                          "";
                                                    },
                                                    isMutiSelect: false,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            50,
                                                    items: model.feesType,
                                                    showAstreik: true,
                                                    showBorderColor: true,
                                                    validator: (value) =>
                                                        AppValidators
                                                            .validateNotEmpty(
                                                                value,
                                                                'Fees Type'),
                                                    dropdownName: 'Fees Type',
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                      SizedBox(
                                        height: 48,
                                        child: CommonDatePickerWidget(
                                          validator: (value) =>
                                              AppValidators.validateNotEmpty(
                                                  value, 'Cheque Date'),
                                          showAstreik: true,
                                          dateController: model
                                              .chequeDateControllers[index],
                                          labelName: 'Cheque Date',
                                        ),
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 20, width: 10),
                                      InkWell(
                                        onTap: () {
                                          model.pickImage(
                                              UpoladFileTypeEnum.image, index);
                                        },
                                        child: AbsorbPointer(
                                          child: CommonTextFormField(
                                            showAstreik: true,
                                            labelText: 'Cheque Image',
                                            readOnly: true,
                                            controller:
                                                model.chequeImage[index],
                                            validator: (value) =>
                                                AppValidators.validateNotEmpty(
                                                    value, 'Cheque Image'),
                                          ),
                                        ),
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
                                        readOnly: model.amountControllers[index]
                                                .text.isNotEmpty
                                            ? true
                                            : false,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          AppInputformatters.mobileFormatter()
                                        ],
                                        controller:
                                            model.amountControllers[index],
                                        validator: (value) =>
                                            AppValidators.validateNotEmpty(
                                                value, 'Amount'),
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
            if (value.status == Status.error) {
              CommonPopups().showError(
                context,
                'Payment Error',
                (shouldRoute) {},
              );
            }
            if (value.status == Status.success) {
              ProviderScope.containerOf(context)
                  .read(paymentsModelProvider)
                  .getStudentList;
              CommonPopups().showSuccess(
                context,
                'Payment\nSuccessfull!',
                (shouldRoute) {
                  Navigator.popUntil(
                      context, ModalRoute.withName(RoutePaths.payments));
                },
              );
            }
          },
          dataBuilder: (context, data) {
            return data!.status == Status.loading
                ? const SizedBox(
                    width: 40,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CommonElevatedButton(
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        model.checkIfAllAmountMatches((value) {
                          if (value) {
                            CommonPopups().showWarning(context,
                                'The amount entered in the cheques should be equal to the payable amount above');
                          }
                        }, model);
                      },
                      text: 'Continue',
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      textStyle: AppTypography.subtitle2.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  );
          },
        )
      ]),
    );
  }
}
