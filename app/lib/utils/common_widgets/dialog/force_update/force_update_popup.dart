import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_typography.dart';
import '../../common_elevated_button.dart';
import '../../common_text_widget.dart';

class ForceUpdatePopup extends StatelessWidget {
final IconData icon;
final Color iconColor;
final String message;
final String buttonText;
final bool barrierDismissible;
  dynamic? popParameter;
 final Function(bool shouldRoute) onChanged;
ForceUpdatePopup({super.key,this.popParameter, required this.icon, required this.iconColor, required this.message, required this.buttonText, required this.barrierDismissible, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 60,
          ),
          const SizedBox(height: 15),
          CommonText(
            text: message,
            textAlign: TextAlign.center,
            style: AppTypography.subtitle1
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: 40.h,
              width: 80.w,
              child: CommonElevatedButton(
                onPressed: () {
                  onChanged(true);
                  Navigator.pop(context, popParameter);

                },
                text: 'Ok',
                backgroundColor: Theme.of(context).colorScheme.primary,
                textStyle: AppTypography.subtitle2.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary),
              ))
        ],
      ),
    );
  }
}
