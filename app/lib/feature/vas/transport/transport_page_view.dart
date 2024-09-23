import 'package:app/feature/vas/transport/transport_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class TransportPageView extends BasePageViewWidget<TransportDetailViewModel>{
  TransportPageView(super.providerBase);

  @override
  Widget build(BuildContext context, TransportDetailViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textDark.withOpacity(0.22),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 2)
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(text: "Calculated Amount",style: AppTypography.body2,),
                CommonText(text: "10,000",style: AppTypography.h6.copyWith(color: AppColors.primary),)
              ],
            ),
          ),
          SizedBox(height: 16.h,),
          const CommonText(text: "Select Bus Type",style: AppTypography.subtitle2,),
          SizedBox(height: 10.h,),
          Column(
            children: List.generate(
              model.busType.length,
              (index) {
                return CommonRadioButtonWidget(
                  commonRadioButton: model.radioButtonBusType,
                  value: model.busType[index],
                  title: model.busType[index],
                );
              },
            ),
          ),
          SizedBox(height: 15.h,),
          const CommonText(
            text: "Select The Service Type",
            style: AppTypography.subtitle2,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: List.generate(
              model.serviceType.length,
              (index) {
                return CommonRadioButtonWidget(
                  commonRadioButton: model.radioButtonServiceType,
                  value: model.serviceType[index],
                  title: model.serviceType[index],
                );
              },
            ),
          ),
          const SizedBox(height: 100,),
          Center(
            child: CommonElevatedButton(
              onPressed: (){},
              text: "Enroll Now",
              backgroundColor: AppColors.accent,
              width: double.infinity,
              textStyle: AppTypography.subtitle2.copyWith(color: AppColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}