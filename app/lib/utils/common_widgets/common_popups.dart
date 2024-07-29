import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  void showSuccess(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.check_circle,
      iconColor: Colors.green,
      message: message,
      buttonText: 'OK',
    );
  }

  // Method to show an error popup
  void showError(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.error,
      iconColor: Colors.red,
      message: message,
      buttonText: 'OK',
    );
  }

  // Method to show a warning popup
  void showWarning(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.warning,
      iconColor: Colors.orange,
      message: message,
      buttonText: 'OK',
    );
  }

  // Private method to show a dialog
  void _showDialog(
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
              SizedBox(
                  height: 40.h,
                  width: 67.w,
                  child: CommonElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
}