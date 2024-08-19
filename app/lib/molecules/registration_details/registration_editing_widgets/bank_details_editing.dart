import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetailsEditing extends StatelessWidget {
  const BankDetailsEditing({super.key, required this.model});

  final RegistrationsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 358.w,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1,
              )),
          child: ExpansionTile(
              title: const CommonText(
                text: "Bank Info",
                style: AppTypography.subtitle2,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      CommonSizedBox.sizedBox(height: 20, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'IFSC Code',
                        controller: model.ifscCodeController,
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Bank Name',
                        controller:model.bankNameController
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                       CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Branch Name',
                         controller:model.branchNameController
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Account Holder Name',
                        controller:model.accountHolderNameController
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Account Type',
                        controller: model.accountTypeController
                      ),
                      CommonSizedBox.sizedBox(height: 15, width: 10),
                      CommonTextFormField(
                        showAstreik: false,
                        labelText: 'Account Number',
                        controller:model.accountNumberController
                      ),
                    ],
                  ),
                )
              ]),
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const CommonText(
          text: "UPI Info",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: false,
          labelText: 'UPI ID',
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const CommonText(
          text: "UnderTaking",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        const CommonText(
          softWrap: true,
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar sic tempor. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus pronin sapien nunc accuan eget.",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 20, width: 10),
        CommonRadioButtonWidget(
          title: 'I accept the terms & conditions',
          commonRadioButton: model.radioButtonController6,
          value: 'I accept the terms & conditions',
        ),
      ],
    );
  }
}
