import 'package:app/molecules/tansport/trip_list/trip_tile_detail_item.dart';
import 'package:app/themes_setup.dart';

import 'package:app/utils/common_widgets/common_card_wrapper.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'trip_list_tile_header.dart';

class CompletedTripListTile extends StatelessWidget {
  final TripResult trip;
  const CompletedTripListTile({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return CommonCardWrapper(
      bottom: 16,
      left: 16,
      right: 16,
      isPrimary: false,
      child: Column(
        children: [
          TripListTileHeader(tripStatus: "Completed", trip: trip),
          const Divider(color: AppColors.textPalerGray),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TripTileDetailItem(
                  title: "Pickup point",
                  subtitle: trip.routeStopMapping?.isEmpty ?? true
                      ? ""
                      : trip.routeStopMapping?.first.stop?.stopName ?? ""),
              TripTileDetailItem(
                  title: "Drop point",
                  subtitle: trip.routeStopMapping?.isEmpty ?? true
                      ? ""
                      : trip.routeStopMapping?.last.stop?.stopName ?? ""),
              const Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(""),
                      Text(""),
                    ]),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TripTileDetailItem(
                  title: "Students",
                  subtitle:
                      "${trip.studentStopsMappings?.length ?? 0} Students"),
              TripTileDetailItem(
                  title: "Action",
                  subtitle: trip.routeType == '2'
                      ? "Pickup"
                      : trip.routeType == '1'
                          ? "Drop"
                          : ""),
              TripTileDetailItem(
                  title: "Shift", subtitle: trip.shiftName ?? ''),
            ],
          )
        ],
      ),
    );
  }
}
