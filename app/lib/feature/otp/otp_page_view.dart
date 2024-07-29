import 'dart:developer';

import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/molecules/otp/bottom_phone_email_sheet.dart';
import 'package:app/molecules/otp/otp_pin_bottomsheet.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class OtpPageView extends BasePageViewWidget<OtpPageModel> {
  OtpPageView(super.providerBase);

  @override
  Widget build(BuildContext context, OtpPageModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        SvgPicture.asset(AppImages.appLogoBlue),
        SvgPicture.asset(AppImages.otpCenterImage),
        BottomPhoneEmailSheet(
          otpPageModel: model,
        ),
      ],
    );
  }
}
