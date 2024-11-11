import 'package:app/di/states/viewmodels.dart';

import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';

import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../feature/my_duty/my_duty_page_viewmodel.dart';
import '../../../utils/common_widgets/common_image_widget.dart';
import '../../../utils/common_widgets/common_primary_elevated_button.dart';

class TripListTileHeader extends StatelessWidget {
  const TripListTileHeader(
      {super.key,
      this.tripStatus = "upcoming",
      this.buttonTitle = "Start",
      this.trip});

  final String tripStatus;
  final String buttonTitle;
  final TripResult? trip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonImageWidget(
          imageUrl: "",
          fallbackAssetImagePath: AppImages.defaultBus,
          imageHeight: 40.h,
          imageWidth: 40.w,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "#${trip?.routeCode ?? ""}",
                maxLines: 1,
                overflow: TextOverflow
                    .ellipsis, // Ensures text truncates with ellipsis
                style: AppTypography.smallCaption,
                color: AppColors.textGray,
              ),
              CommonText(
                text: (trip?.routeBusUserMapping?.isNotEmpty ?? false)
                    ? (trip?.routeBusUserMapping?[0].bus?.busNumber ?? '')
                    : '',
                style: AppTypography.subtitle2,
                color: AppColors.textDark,
              ),
            ],
          ),
        ),
        tripStatus == "upcoming"
            ? BaseWidget<MyDutyPageViewModel>(
                builder: (context, model, child) {return Text("hello");
                  // return AppStreamBuilder<Resource<CreateRouteLogsData>>(
                  //   stream: model!.createRouteLogsStream,
                  //   initialData: Resource.none(),
                  //   onData: (value) {
                  //     if (value.status == Status.success &&
                  //         (trip?.isLoading ?? false)) {
                  //       if (trip?.routeType == "1") {
                  //         BusRouteDetailsPageParams params =
                  //             BusRouteDetailsPageParams(
                  //                 dropStarted: false,
                  //                 trip: trip,
                  //                 stop: StopModel(
                  //                     academicYrsId: trip?.routeStopMapping?[0]
                  //                         .stop?.academicYrsId,
                  //                     createdAt: DateTime.parse(trip
                  //                             ?.routeStopMapping?[0]
                  //                             .stop
                  //                             ?.createdAt ??
                  //                         ''),
                  //                     distanceKm: trip?.routeStopMapping?[0]
                  //                         .stop?.distanceKm,
                  //                     endDate: DateTime.parse(trip
                  //                             ?.routeStopMapping?[0]
                  //                             .stop
                  //                             ?.endDate ??
                  //                         ''),
                  //                     //  id: trip?.routeStopMapping?[0].stop?.id,
                  //                     isDraft: trip
                  //                         ?.routeStopMapping?[0].stop?.isDraft,
                  //                     lat: trip?.routeStopMapping?[0].stop?.lat,
                  //                     long:
                  //                         trip?.routeStopMapping?[0].stop?.long,
                  //                     orderBy: trip
                  //                         ?.routeStopMapping?[0].stop?.orderBy,
                  //                     relatedStopId: trip?.routeStopMapping?[0]
                  //                         .stop?.relatedStopId,
                  //                     schoolId: trip?.routeStopMapping?[0].stop?.schoolId,
                  //                     startDate: DateTime.parse(trip?.routeStopMapping?[0].stop?.startDate ?? ''),
                  //                     stopMapName: trip?.routeStopMapping?[0].stop?.stopMapName,
                  //                     stopName: trip?.routeStopMapping?[0].stop?.stopName,
                  //                     updatedAt: DateTime.parse(trip?.routeStopMapping?[0].stop?.updatedAt ?? ''),
                  //                     zoneName: trip?.routeStopMapping?[0].stop?.zoneName),
                  //                 isLastIndex: false);
                  //         Navigator.pushNamed(
                  //             context, RoutePaths.busRouteDetailsPage,
                  //             arguments: params);
                  //       } else {
                  //         Navigator.pushNamed(
                  //             context, RoutePaths.busCheckListPage,
                  //             arguments: trip);
                  //       }
                  //       model.stopLoader(trip!);
                  //     } else if (value.status == Status.error) {
                  //       model.stopLoader(trip!);
                  //     }
                  //   },
                  //   dataBuilder: (context, data) {
                  //     return CommonPrimaryElevatedButton(
                  //       title: buttonTitle,
                  //       isDisabled:
                  //           trip?.studentStopsMappings?.isEmpty ?? false,
                  //       isLoading: (trip?.isLoading ?? false),
                  //       titleTextStyle: AppTypography.subtitle2,
                  //       onPressed: () {
                  //         if(trip?.routeBusUserMapping?.isNotEmpty ?? false){
                  //         model.startRouteCall(trip!);
                  //         }
                  //         else{
                  //           model.flutterToastErrorPresenter.show(Exception(), context, "No bus assigned for  particular route");
                  //         }
                  //       },
                  //       icon: SvgPicture.asset(AppImages.playButton),
                  //       backgroundColor: AppColors.primary,
                  //       foregroundColor: AppColors.primaryOn,
                  //     );
                  //   },
                  // );
                },
                providerBase: myDutyPageViewModelProvider)
            : CommonPrimaryElevatedButton(
                title: "Complete",
                titleTextStyle: AppTypography.subtitle2,
                onPressed: () {},
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.primaryOn,
              )
      ],
    );
  }
}
