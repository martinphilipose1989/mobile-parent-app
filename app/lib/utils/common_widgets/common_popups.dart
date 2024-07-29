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
                  width: 67.w,
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
}
