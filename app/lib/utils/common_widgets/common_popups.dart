import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform, exit;

class CommonPopups {
  // Private constructor
  CommonPopups._();

  // The single instance of the class
  static final CommonPopups _instance = CommonPopups._();

  // Factory constructor to return the same instance
  factory CommonPopups() {
    return _instance;
  }

  // Method to show a success popup
  showSuccess(BuildContext context, String message,
      Function(bool shouldRoute) onChanged) {
    _showDialog(context,
        icon: Icons.check_circle,
        iconColor: Colors.green,
        message: message,
        buttonText: 'OK',
        onChanged: onChanged);
  }

  // Method to show an error popup
  void showError(BuildContext context, String message,
      Function(bool shouldRoute) onChanged) {
    _showDialog(context,
        icon: Icons.error,
        iconColor: Colors.red,
        message: message,
        buttonText: 'OK',
        onChanged: onChanged);
  }

  // Method to show a warning popup
  void showWarning(
    BuildContext context,
    String message,
  ) {
    _showDialog(
      context,
      icon: Icons.warning,
      iconColor: Colors.orange,
      message: message,
      buttonText: 'OK',
      onChanged: (shouldRoute) {},
    );
  }

  void showAppClose(BuildContext context, String message) {}

  showConfirm(
      BuildContext context,
      String message,
      String message1,
      String message2,
      String message3,
      String message4,
      Function(bool shouldRoute) onChanged) {
    _showConfirmDialog(
      context,
      message: message,
      message1: message1,
      message2: message2,
      message3: message3,
      message4: message4,
      onChanged: onChanged,
    );
  }

  // Private method to show a dialog
  void _showDialog(BuildContext context,
      {required IconData icon,
      required Color iconColor,
      required String message,
      required String buttonText,
      required Function(bool shouldRoute) onChanged}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                      Navigator.pop(context);
                      onChanged(true);
                    },
                    text: 'Ok',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textStyle: AppTypography.subtitle2.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ))
            ],
          ),
        );
      },
    );
  }

  // Private method to show a dialog
  void _showAppClosingAlert(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String message,
    required String buttonText,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 40.h,
                      width: 67.w,
                      child: CommonElevatedButton(
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }
                        },
                        text: 'Yes',
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: AppTypography.subtitle2.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                  SizedBox(
                      height: 40.h,
                      width: 67.w,
                      child: CommonElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: '',
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: AppTypography.subtitle2.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _showConfirmDialog(BuildContext context,
      {required String message,
      required String message1,
      required String message2,
      required String message3,
      required String message4,
      required Function(bool shouldRoute) onChanged}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                text: message,
                style:
                    AppTypography.subtitle1.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonText(
                text: message1,
                style:
                    AppTypography.caption.copyWith(color: AppColors.textGray),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonText(
                text: message2,
                style:
                    AppTypography.caption.copyWith(color: AppColors.textGray),
              ),
              CommonText(
                text: message3,
                style:
                    AppTypography.caption.copyWith(color: AppColors.textGray),
              ),
              CommonText(
                text: message4,
                style:
                    AppTypography.caption.copyWith(color: AppColors.textGray),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 40.h,
                      width: 110.w,
                      child: CommonElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onChanged(true);
                        },
                        text: 'Cancel',
                        backgroundColor: Colors.white,
                        borderColor: Theme.of(context).colorScheme.primary,
                        textStyle: AppTypography.subtitle2.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 40.h,
                      width: 110.w,
                      child: CommonElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onChanged(true);
                        },
                        text: 'Confirm',
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: AppTypography.subtitle2.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
