import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/molecules/otp/bottom_phone_email_sheet.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class OtpPageView extends BasePageViewWidget<OtpPageModel> {
  OtpPageView(super.providerBase);

  @override
  Widget build(BuildContext context, OtpPageModel model) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            SvgPicture.asset(AppImages.appLogoBlue),
            SvgPicture.asset(AppImages.otpCenterImage),
            BottomPhoneEmailSheet(
              otpPageModel: model,
            ),
          ],
        ),
      ),
    );
  }
}
