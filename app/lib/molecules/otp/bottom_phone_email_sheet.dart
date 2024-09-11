import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_inputformatters.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/app_validators.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPhoneEmailSheet extends StatelessWidget {
  final OtpPageModel otpPageModel;
  const BottomPhoneEmailSheet({super.key, required this.otpPageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 331.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: AppColors.disableNeutral80)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTabPage(
            tabController: otpPageModel.tabController,
            selectedValue: otpPageModel.selectedValue,
            firstTabTitle: 'Phone Number',
            secondTabTitle: 'Email',
            onFirstTabChange: () {
              FocusScope.of(context).unfocus();
              otpPageModel.emailContoller.clear();
            },
            onSecondTabChange: () {
              FocusScope.of(context).unfocus();
              otpPageModel.mobileController.clear();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonText(
                text: 'Login into your account',
                style: AppTypography.subtitle1,
              ),
              CommonSizedBox.sizedBox(height: 10, width: 10),
              const CommonText(
                text:
                    'Welcome! please enter your credentials to Continue Your Journey',
                style: AppTypography.caption,
              ),
            ],
          ),
          Column(children: [
            AppStreamBuilder(
              stream: otpPageModel.selectedValue,
              initialData: otpPageModel.selectedValue.value,
              dataBuilder: (context, data) {
                return data == 1
                    ? CommonTextFormField(
                        controller: otpPageModel.emailContoller,
                        showAstreik: false,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Enter Email ID',
                        labelText: '',
                        validator: (value) =>
                            AppValidators.validateEmail(value),
                        inputFormatters: [
                          AppInputformatters.emailFormatter(),
                        ],
                      )
                    : CommonTextFormField(
                        controller: otpPageModel.mobileController,
                        showAstreik: false,
                        keyboardType: TextInputType.phone,
                        hintText: 'Enter Phone Number',
                        labelText: '',
                        validator: (value) =>
                            AppValidators.validateMobile(value),
                        inputFormatters: [
                          AppInputformatters.mobileFormatter(),
                        ],
                      );
              },
            ),
            CommonSizedBox.sizedBox(height: 10, width: 10),
            const Align(
              alignment: Alignment.center,
              child: CommonText(
                  textAlign: TextAlign.left,
                  style: AppTypography.caption,
                  text:
                      'By Authenticating You Agree To Terms & Conditions Of This Platform'),
            ),
          ]),
          CommonElevatedButton(
            onPressed: () {
              if (otpPageModel.mobileController.text.isNotEmpty ||
                  otpPageModel.emailContoller.text.isNotEmpty) {
                otpPageModel.openBottomSheet.add(true);
              }
            },
            text: 'Send OTP',
            textStyle: AppTypography.subtitle2.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            width: MediaQuery.of(context).size.width,
            textColor: Theme.of(context).colorScheme.onPrimaryContainer,
            backgroundColor: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
