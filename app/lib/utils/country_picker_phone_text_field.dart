import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPickerPhoneTextField extends StatelessWidget {
  const CountryPickerPhoneTextField(
      {super.key,
      required this.controller,
      required this.onCountryChanged,
      this.onChanged,
      this.validator,
      this.readOnly,
      this.initialSelection = "+91"});

  final TextEditingController controller;
  final void Function(CountryCode)? onCountryChanged;
  final String? Function(String?)? validator;
  final String initialSelection;
  final bool? readOnly;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      showAstreik: true,
      readOnly: readOnly ?? false,
      bottomPadding: 16,
      labelText: 'Contact Number',
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'^[6789]\d{0,9}$'))
      ],
      prefixIconConstraints: BoxConstraints(maxWidth: 110.w),
      validator: validator,
      prefix: Row(children: [
        SizedBox(width: 16.w),
        CountryCodePicker(
          enabled: readOnly == false,
          flagWidth: 32.w,
          initialSelection: initialSelection,
          onChanged: onCountryChanged,
          builder: (countrycode) {
            return Row(
              children: [
                Image.asset("${countrycode?.flagUri}",
                    package: 'country_code_picker', height: 24, width: 24),
                SizedBox(width: 4.w),
                Text("${countrycode?.dialCode}",
                    style: AppTypography.body1.copyWith(
                        color: AppColors.textGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal)),
                const Icon(Icons.keyboard_arrow_down),
                Container(
                  width: 1.w,
                  height: 16.h,
                  decoration:
                      const BoxDecoration(color: AppColors.textLightGray),
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
