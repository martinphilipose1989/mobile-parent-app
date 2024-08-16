import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDocuments extends StatelessWidget {
  EnquiryDetail? enquiryDetail;
  UploadDocuments({super.key,this.enquiryDetail});
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
        Column(
          children: List.generate((enquiryDetail?.enquiryDocuments??[]).length, (index)=> _uploadItem(title: enquiryDetail?.enquiryDocuments?[index].documentName??'')),
        )
      ],
    );
  }

  _uploadItem({required String title}){
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
