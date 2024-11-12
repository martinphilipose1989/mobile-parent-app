import 'dart:typed_data';

import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorInfoCard extends StatelessWidget {
  final String visitorName;
  final String issuedOn;
  final Uint8List qrImagePath;
  final String avatarImagePath;

  const VisitorInfoCard({
    super.key,
    required this.visitorName,
    required this.issuedOn,
    required this.qrImagePath,
    required this.avatarImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 67.h,
          ),
          padding: EdgeInsets.only(
            top: 67.h + 24.h,
            left: 16,
            right: 16,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: visitorName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          AppTypography.h6.copyWith(color: AppColors.textDark),
                    ),
                    SizedBox(height: 8.h),
                    CommonText(
                      text: "Issued On: $issuedOn",
                      style: AppTypography.body2.copyWith(
                          color: AppColors.textGray,
                          fontSize: 14.sp,
                          height: 1.1),
                    ),
                  ],
                ),
              ),
              qrImagePath.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        navigatorKey.currentState?.pushNamed(
                            RoutePaths.qrCodeDetailsPage,
                            arguments: qrImagePath);
                      },
                      child: Image.memory(
                        qrImagePath,
                        fit: BoxFit.cover,
                        height: 45.w,
                        width: 45.w,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                              Icons.error); // Display an error icon or widget
                        },
                      ),
                    )
                  : SizedBox(
                      height: 45.w,
                      width: 45.w,
                    ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.r),
                boxShadow: [AppColors.boxShadow]),
            child: CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 60.r,
                child: ClipOval(
                    child: CommonImageWidget(
                  imageUrl: avatarImagePath,
                  imageHeight: 120.r,
                  imageWidth: 120.r,
                )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
