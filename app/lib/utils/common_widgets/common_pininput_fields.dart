import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CommonPininputFields extends StatelessWidget {
  final Function(String)? onChanged;
  const CommonPininputFields({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: true,
      obscuringCharacter: '*',
      autoDismissKeyboard: true,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      pinTheme: PinTheme(
        selectedColor: Theme.of(context).colorScheme.primary,
        inactiveColor:
            Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
        activeColor: Theme.of(context).colorScheme.primary,
        disabledColor:
            Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 46.h,
        fieldWidth: 46.w,
        activeFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
