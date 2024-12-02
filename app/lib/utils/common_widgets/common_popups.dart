import 'dart:io';

import 'package:app/molecules/create_intimation/create_intimation_popup.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/dialog/staff_list_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

import 'app_images.dart';

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

  void showSuccess(BuildContext context, String message,
      Function(bool shouldRoute) onChanged,
      {String? popParameter}) {
    _showDialog(context,
        icon: Icons.check_circle,
        iconColor: Colors.green,
        message: message,
        popParameter: popParameter,
        buttonText: 'OK',
        barrierDismissible: false,
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
        barrierDismissible: true,
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
      barrierDismissible: true,
      onChanged: (shouldRoute) {},
    );
  }

  // Method to show a gallery permission popup
  void showGallerySettingPermission(
      BuildContext context,
      String message,
      bool barrierDismissible,
      IconData icon,
      Function(bool shouldRoute) onChanged) {
    _showDialog(context,
        icon: icon,
        iconColor: Theme.of(context).primaryColor,
        message: message,
        buttonText: 'OK',
        barrierDismissible: barrierDismissible,
        onChanged: onChanged);
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

  showAlert(BuildContext context, String message,
      Function(bool shouldRoute) onChanged) {
    _showAlertDialog(
      context,
      message: message,
      onChanged: onChanged,
    );
  }

  // Private method to show a dialog
  void _showDialog(BuildContext context,
      {required IconData icon,
      required Color iconColor,
      required String message,
      required String buttonText,
      required bool barrierDismissible,
      dynamic popParameter,
      required Function(bool shouldRoute) onChanged}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
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
                      Navigator.pop(context, popParameter);
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

//
  //showinfo
  void showInfo(
    BuildContext context, {
    required Widget title,
    required Widget child,
    required bool barrierDismissible,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
            title: title,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: child);
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

  Widget infoRow(BuildContext context, Color color, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.date,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        CommonText(text: text),
      ],
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
                          // onChanged(true);
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

  showCreateIntimation(BuildContext context,{required int studentId,required int userId}){
    showDialog(context: context, builder: (context){

      return AlertDialog(contentPadding:EdgeInsets.all(10),content: Container(height:400.h,child: CreateIntimationPopup(userid: userId, schoolId: studentId,)));
    });

  }

 showStaff(BuildContext context,{required StaffArgs args}){
    showDialog(context: context, builder: (context){

      return AlertDialog(contentPadding:EdgeInsets.zero,content: Container(height:300.h,child: StaffListPopup(args: args,)));
    });

}
showloading(BuildContext context,){
showDialog(context: context,   builder: (BuildContext context) {
  return AlertDialog(content: Container(
    child :CommonAppLoader(),height: MediaQuery.of(context).size.height*0.2,width:MediaQuery.of(context).size.width*0.2 ,),);
});
}

  _showAlertDialog(BuildContext context,
      {required String message,
      required Function(bool shouldRoute) onChanged}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(25),
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
                          // onChanged(true);
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
