import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/molecules/otp/countdown_widget.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_pininput_fields.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:services/services.dart';
import 'package:shared/shared.dart';

class OtpPinBottomsheet extends StatefulWidget {
  final OtpPageModel otpPageModel;
  const OtpPinBottomsheet({super.key, required this.otpPageModel});

  @override
  State<OtpPinBottomsheet> createState() => _OtpPinBottomsheetState();
}

class _OtpPinBottomsheetState extends State<OtpPinBottomsheet>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.otpPageModel.controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds: widget.otpPageModel
                .levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    widget.otpPageModel.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 264.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: AppColors.disableNeutral80)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonText(
                      text: 'Login into your account',
                      style: AppTypography.subtitle1,
                    ),
                    InkWell(
                      onTap: () {
                        widget.otpPageModel.openBottomSheet.add(false);
                        widget.otpPageModel.controller.reset();
                      },
                      child: const Icon(Icons.cancel_outlined),
                    )
                  ],
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                const CommonText(
                  text: 'Enter 6 digit code sent on your email address',
                  style: AppTypography.caption,
                )
              ],
            ),
            Column(children: [
              CommonPininputFields(
                onChanged: (otpValue) {
                  if (otpValue.length >= 6) {
                    CommonPopups().showSuccess(
                      context,
                      'Otp Verified Successfully!',
                      (shouldRoute) {
                        SharedPreferenceHelper.saveString(
                            mobileNumber,
                            widget.otpPageModel.mobileOrEmailController.text
                                .trim());
                        widget.otpPageModel.controller.stop();
                        widget.otpPageModel.openBottomSheet.add(false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutePaths.tabbar, (route) => false);
                      },
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CountdownWidget(
                  onTimerEnd: () {
                    widget.otpPageModel.otpExpired.add(true);
                  },
                  animation: StepTween(
                    begin: widget.otpPageModel
                        .levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(widget.otpPageModel.controller),
                ),
              ),
            ]),
            AppStreamBuilder<bool>(
              stream: widget.otpPageModel.otpExpired,
              initialData: widget.otpPageModel.otpExpired.value,
              dataBuilder: (context, data) {
                return Visibility(
                    visible: data!,
                    replacement: const SizedBox.shrink(),
                    child: Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            widget.otpPageModel.controller.reset();
                            widget.otpPageModel.controller.forward();
                            widget.otpPageModel.otpExpired.add(false);
                          },
                          child: CommonText(
                            text: 'Resend OTP',
                            style: AppTypography.subtitle2.copyWith(
                                color: Theme.of(context).primaryColor),
                          ),
                        )));
              },
            )
          ],
        ));
  }
}
