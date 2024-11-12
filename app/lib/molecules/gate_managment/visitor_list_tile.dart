import 'package:app/molecules/gate_managment/visit_status_widget.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';

import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_card_wrapper.dart';
import 'package:app/utils/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/dateformate.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorListTile extends StatelessWidget {
  const VisitorListTile({super.key, required this.visitorDataModel});

  final VisitorDataModel? visitorDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState?.pushNamed(
          RoutePaths.visitorDetailsPage,
          arguments: {'gatePassId': '${visitorDataModel?.id}'},
        );
      },
      child: CommonCardWrapper(
        isPrimary: visitorDataModel?.visitStatus?.toLowerCase() == "in",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [AppColors.boxShadow],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: CommonImageWidget(
                                  progressSize: const Size(12, 12),
                                  imageHeight: 32.w,
                                  imageWidth: 32.w,
                                  imageUrl:
                                      "${visitorDataModel?.visitorProfileImage}"),
                            ),
                          ],
                        )),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 0.55.sw,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${visitorDataModel?.visitorName}\t",
                                  style: AppTypography.subtitle2.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textDark,
                                      fontSize: 14.sp),
                                ),
                                TextSpan(
                                  text:
                                      "(Visitor: ID#${visitorDataModel?.gatePassNumber ?? "N/A"})",
                                  style: AppTypography.smallCaption.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.textGray,
                                      letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "${visitorDataModel?.visitorType}",
                          style: AppTypography.smallCaption.copyWith(
                              color: AppColors.textGray,
                              fontSize: 10.sp,
                              letterSpacing: 0.25),
                        ),
                        CommonText(
                          text: visitorDataModel?.visitorEmail ?? "",
                          style: AppTypography.smallCaption.copyWith(
                              color: AppColors.textGray,
                              fontSize: 10.sp,
                              letterSpacing: 0.25),
                        ),
                        CommonText(
                          text: "${visitorDataModel?.visitorMobile}",
                          style: AppTypography.smallCaption.copyWith(
                              color: AppColors.textGray, letterSpacing: 0.25),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${visitorDataModel?.issuedDate?.dateFormat()}",
                      style: AppTypography.smallCaption
                          .copyWith(color: AppColors.textGray),
                    ),
                    SizedBox(height: 12.h),
                    if ((visitorDataModel?.incomingTime?.isNotEmpty ?? false))
                      VisitStatusWidget(
                          visitStatus:
                              visitorDataModel?.visitStatus?.toLowerCase() ??
                                  ""),
                  ],
                )
              ],
            ),
            Divider(height: 12.h, color: AppColors.dividerColor),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "To Contact:\t",
                      style: AppTypography.smallCaption.copyWith(
                          letterSpacing: 0.25, color: AppColors.textGray),
                    ),
                    TextSpan(
                      text: visitorDataModel?.pointOfContact ?? "",
                      style: AppTypography.caption.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.textDark,
                          letterSpacing: 0.25),
                    )
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: visitorDataModel?.visitStatus?.toLowerCase() == "in"
                          ? "IN:\t"
                          : "Out:\t",
                      style: AppTypography.smallCaption.copyWith(
                          letterSpacing: 0.25, color: AppColors.textGray),
                    ),
                    TextSpan(
                      text: visitorDataModel?.visitStatus?.toLowerCase() == "in"
                          ? visitorDataModel?.incomingTime
                                  ?.formatTimeWithoutIntl() ??
                              "Not arrived yet"
                          : visitorDataModel?.outgoingTime
                                  ?.formatTimeWithoutIntl() ??
                              "Not arrived yet",
                      style: AppTypography.caption.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.textDark,
                          letterSpacing: 0.25),
                    )
                  ],
                ),
              ),
            ]),
            SizedBox(height: 12.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: REdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                  color: visitorDataModel?.visitStatus?.toLowerCase() == "in"
                      ? AppColors.primaryLighter
                      : AppColors.dividerColor,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Text(
                  "Purpose Of Visit:\t${visitorDataModel?.purposeOfVisitName ?? "N/A"}",
                  style: AppTypography.caption.copyWith(
                      color:
                          visitorDataModel?.visitStatus?.toLowerCase() == "in"
                              ? AppColors.primary
                              : AppColors.textGray)),
            )
          ],
        ),
      ),
    );
  }
}
