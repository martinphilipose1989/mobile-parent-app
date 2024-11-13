import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_card_wrapper.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'trip_list_tile_header.dart';
import 'trip_tile_detail_item.dart';

class UpcomingTripListTile extends StatelessWidget {
  const UpcomingTripListTile({super.key, required this.trip});

  final TripResult trip;

  @override
  Widget build(BuildContext context) {
    return CommonCardWrapper(
      bottom: 16,
      right: 16,
      left: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.schoolTripIcon),
              CommonText(
                  text: trip.schoolName ?? '',
                  style: AppTypography.caption,
                  color: AppColors.textGray),
            ],
          ),
          const Divider(color: AppColors.textPalerGray),
          TripListTileHeader(trip: trip),
          const Divider(color: AppColors.textPalerGray),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TripTileDetailItem(
                title: trip.routeStopMapping?.isEmpty ?? true
                    ? ""
                    : trip.routeStopMapping?.first.stop?.stopName ?? "",
                titleTextStyle:
                    AppTypography.subtitle2.copyWith(color: AppColors.textDark),
                subtitle: "",
                subtitleTextStyle: AppTypography.h6),
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Image.asset(AppImages.routeImage, height: 48.h, width: 144.w),
              ],
            ),
            TripTileDetailItem(
                title: trip.routeStopMapping?.isEmpty ?? true
                    ? ""
                    : trip.routeStopMapping?.last.stop?.stopName ?? "",
                titleTextStyle:
                    AppTypography.subtitle2.copyWith(color: AppColors.textDark),
                subtitle: '',
                subtitleTextStyle: AppTypography.h6),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            TripTileDetailItem(
                title: "Students",
                subtitle: "${trip.studentStopsMappings?.length ?? 0} Students"),
            SizedBox(width: 32.w),
            TripTileDetailItem(
                title: "Action",
                subtitle: trip.routeType == "2"
                    ? "Pickup"
                    : trip.routeType == "1"
                        ? "Drop"
                        : ""),
            SizedBox(width: 32.w),
            TripTileDetailItem(title: "Shift", subtitle: trip.shiftName ?? ''),
          ]),
        ],
      ),
    );
  }
}



/**
 * export enum RouteType {
  SchoolToOut = "1", // drop
  OutToSchool = "2",  // pickup
}
 * 
 */