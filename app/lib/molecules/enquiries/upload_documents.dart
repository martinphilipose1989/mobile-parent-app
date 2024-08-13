import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Container(
          height: 54,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffF0F2F4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CommonText(text: "Documents",
                      style: AppTypography.body2.copyWith(
                        fontFamily: 'Poppins',
                        color: AppColors.textGray
                      ),
                    ),
                    const Icon(
                      Icons.arrow_upward,
                      color: AppColors.textGray,
                      size: 16,
                    ),
                  ],
                ),
                CommonText(text: "Action",
                  style: AppTypography.body2.copyWith(
                      fontFamily: 'Poppins',
                      color: AppColors.textGray
                  ),
                ),
              ],
            ),
          ),
        ),
        _uploadItem(title: "*Aadhaar Card of Student"),
        _uploadItem(title: "*Birth Certificate of Student"),
        _uploadItem(title: "Report Card (Previous Year)"),
        _uploadItem(title: "Report Card [Previous Year (-) 1]"),
        _uploadItem(title: "Report Card [Previous Year (-) 2]"),
        _uploadItem(title: "*Aadhar Card of Father"),
        _uploadItem(title: "PAN Card of Father"),
        _uploadItem(title: "*Gazetted copy of Name Change"),
      ],
    );
  }

  _uploadItem({title}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: title,
                style: AppTypography.button.copyWith(
                  color: AppColors.textDark
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.uploadIcon),
                  const SizedBox(width: 5,),
                  SvgPicture.asset(AppImages.import),
                  const SizedBox(width: 5,),
                  SvgPicture.asset(AppImages.delete),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
