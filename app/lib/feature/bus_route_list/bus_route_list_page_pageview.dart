// ignore_for_file: unused_local_variable

import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/tansport/student_details_row_widget.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_refresh_indicator.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/dialog/staff_list_popup.dart';
import 'package:app/utils/common_widgets/dialog/staff_list_view_model.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/tansport/arrival_info_tile.dart';
import '../../utils/common_widgets/data_status_widget.dart';
import 'bus_route_list_page_viewmodel.dart';

class BusRouteListPageView
    extends BasePageViewWidget<BusRouteListPageViewModel> {
  // ignore: use_super_parameters
  BusRouteListPageView(ProviderBase<BusRouteListPageViewModel> model)
      : super(model);

  @override
  Widget build(BuildContext context, BusRouteListPageViewModel model) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: ArrivalInfoTile(
                vehicleNumber:
                    model.trip?.routeBusUserMapping?[0].bus?.busNumber ?? '',
                startTime: model.trip?.shiftName ?? '',
                totalStudents: model.trip?.studentStopsMappings?.length ?? 0)),
        Expanded(
            child: AppStreamBuilder<Resource<List<RouteStopMappingModel>>>(
                stream: model.busStopsListStream,
                initialData: Resource.none(),
                dataBuilder: (context, busStopsListData) {
                  return CommonRefreshIndicator(
                      onRefresh: () {
                        return model.refreshMyDutyList();
                      },
                      child: DataStatusWidget(
                          status: busStopsListData?.status ?? Status.none,
                          loadingWidget: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget: () => Center(
                                child: NoDataFoundWidget(
                                  title: busStopsListData
                                              ?.dealSafeAppError?.error.message
                                              .contains("internet") ??
                                          false
                                      ? Strings.of(context)
                                          .no_internet_connection
                                      : Strings.of(context).something_got_wrong,
                                  subtitle: busStopsListData
                                              ?.dealSafeAppError?.error.message
                                              .contains("internet") ??
                                          false
                                      ? Strings.of(context)
                                          .it_seems_you_re_offline
                                      : Strings.of(context).an_unexpected_error,
                                  onPressed: () {
                                    model.refreshMyDutyList();
                                  },
                                ),
                              ),
                          successWidget: () {
                            return AppStreamBuilder<bool>(
                                stream: model.hasMorePagesStream,
                                initialData: model.hasMorePagesSubject.value,
                                dataBuilder: (context, hasMorePage) {
                                  return NotificationListener<
                                          ScrollNotification>(
                                      onNotification: (scrollNotification) {
                                        if (scrollNotification.metrics.pixels ==
                                            scrollNotification
                                                .metrics.maxScrollExtent) {
                                          //model.loadMoreVisitorList();
                                        }
                                        return false;
                                      },
                                      child: AppStreamBuilder<bool>(
                                          stream: model.loadingStream,
                                          initialData: false,
                                          dataBuilder: (context, isLoading) {
                                            // final itemCount = (busStopsListData
                                            //             ?.data?.length ??
                                            //         0) +
                                            //     (isLoading! && hasMorePage!
                                            //         ? 1
                                            //         : 0);
                                            return Visibility(
                                              visible: busStopsListData
                                                      ?.data?.isEmpty ??
                                                  false,
                                              replacement:
                                                  CommonRefreshIndicator(
                                                isChildScrollable: true,
                                                onRefresh: () {
                                                  return model
                                                      .refreshMyDutyList();
                                                },
                                                child: Column(
                                                  children: [
                                                    BaseWidget(
                                                      builder: (BuildContext
                                                              context,
                                                          StaffListViewModel?
                                                              staffmodel,
                                                          Widget? child) {
                                                        return _trackBus(context: context,
                                                            onTap: () {
                                                          staffmodel?.getStaffList(
                                                              routeId: int
                                                                  .parse(model
                                                                          .trip
                                                                          ?.id ??
                                                                      ""),
                                                              app: 'app');

                                                          CommonPopups().showStaff(
                                                              context,
                                                              args: StaffArgs(
                                                                  routeId: int.parse(
                                                                      model.trip
                                                                              ?.id ??
                                                                          "")));
                                                        });
                                                      },
                                                      providerBase:
                                                          staffListViewModelProvider,
                                                    ),

                                                    /// bus TackingListWidget
                                                    _busTackingListWidget(
                                                      busStopsListData,
                                                      model,
                                                      context,
                                                    ),
                                                    _studentDetailsBottomWidget(
                                                      model,
                                                      context,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child:  NoDataFoundWidget(
                                                title:
                                                 Strings.of(context).no_bus_stops
                                              ),
                                            );
                                          }));
                                });
                          }));
                })),
      ],
    );
  }

  void navigateToBusRouteDetails(
      {required BuildContext context,
      required Resource<List<RouteStopMappingModel>>? busStopsListData,
      required int index,
      required BusRouteListPageViewModel model}) {
    final busStopData = busStopsListData?.data?[index].stop;
    final isLastIndex = index == ((busStopsListData?.data?.length ?? 0) - 1);

    final stopData = isLastIndex
        ? StopModel(
            id: isLastIndex && (model.trip?.routeType == '1')
                ? busStopData?.id
                : null,
            academicYrsId: busStopData?.academicYrsId,
            isDraft: busStopData?.isDraft,
            createdAt: busStopData?.createdAt,
            distanceKm: busStopData?.distanceKm,
            endDate: busStopData?.endDate,
            lat: busStopData?.lat,
            long: busStopData?.long,
            orderBy: busStopData?.orderBy,
            relatedStopId: busStopData?.relatedStopId,
            schoolId: busStopData?.schoolId,
            startDate: busStopData?.startDate,
            stopMapName: busStopData?.stopMapName,
            stopName: busStopData?.stopName,
            updatedAt: busStopData?.updatedAt,
            zoneName: busStopData?.zoneName,
          )
        : busStopData;

    //   BusRouteDetailsPageParams params = BusRouteDetailsPageParams(
    //     dropStarted: model.dropStarted,
    //     trip: null,
    //     stop: stopData!,
    //     isLastIndex: isLastIndex,
    //   );
    //
    //   Navigator.pushNamed(
    //     context,
    //     RoutePaths.busRouteDetailsPage,
    //     arguments: params,
    //   ).then((value) {
    //     model.getBusStopsList();
    //   });
  }

  Widget _studentDetailsBottomWidget(BusRouteListPageViewModel model, context) {
    return AppStreamBuilder<Resource<GetStudentAttendance>>(
        stream: model.studentAttendanceStream,
        initialData: Resource.none(),
        dataBuilder: (context, snapshot) {
          List<AttendanceLogDetailsResponse>? attendanceList =
              snapshot?.data?.data?.attendents?.first.attendanceList;
          var data = snapshot?.data?.data;
          var studentId = snapshot?.data?.data?.attendents?.first.studentId;
          // var attendanceListItem =
          // attendanceList!.isNotEmpty ? attendanceList.first : null;
          //// attendanceList empty or null
          if (snapshot?.status == Status.loading) {
            return const CircularProgressIndicator();
          } else {

            AttendanceLogDetailsResponse? preferredDetail;

            if (model.trip?.routeType == "1") {
              preferredDetail = attendanceList
                  ?.where((e) => e.attendanceType == 5)
                  .firstOrNull ??
                  attendanceList?.where((e) => e.attendanceType == 4).firstOrNull;
            } else if (model.trip?.routeType == "2") {
              preferredDetail = attendanceList
                  ?.where((e) => e.attendanceType == 3)
                  .firstOrNull ??
                  attendanceList?.where((e) => e.attendanceType == 6).firstOrNull;
            }

            return StudentDetailsRowWidget(
              name: snapshot?.data?.data?.attendents?.first.firstName,
              desc: model.getAttendanceStatus(preferredDetail?.attendanceType),
              status: preferredDetail != null
                  ? preferredDetail.attendanceRemark
                  : 'Absent',  // This only shows if `preferredDetail` is null
              lname: snapshot?.data?.data?.attendents?.first.lastName,
              image: snapshot?.data?.data?.attendents?.first.profileImage,
              id: studentId,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.studentProfilePage,
                  arguments: studentId,
                );
              },
            );
        //second start  //   AttendanceLogDetailsResponse? preferredDetail = attendanceList
          //       ?.where((e) => e.attendanceType == 5)
          //       .firstOrNull ??
          //       attendanceList?.where((e) => e.attendanceType == 4).firstOrNull;
          //   return StudentDetailsRowWidget(
          //     name: snapshot?.data?.data?.attendents?.first.firstName,
          //     desc: "Regular Student",
          //     status: preferredDetail != null
          //         ? model.getAttendanceStatus(preferredDetail.attendanceType)
          //         : 'Absent',
          // lname: snapshot?.data?.data?.attendents?.first.lastName,
          //     image: snapshot?.data?.data?.attendents?.first.profileImage,
          //     id: studentId,
          //     onPressed: () {
          //       Navigator.pushNamed(
          //         context,
          //         RoutePaths.studentProfilePage,
          //         arguments: studentId,
          //       );
          //     },
          //   );//second end
            // return Visibility(visible: attendanceList?.map((e)=>e.attendanceType)==4||attendanceList?.map((e)=>e.attendanceType)==5,
            //   child: StudentDetailsRowWidget(
            //       name: snapshot?.data?.data?.attendents?.first.firstName,
            //       desc: "Regular Student",
            //       status: attendanceList?.isNotEmpty==true
            //           ? model.getAttendanceStatus(attendanceList?.map((e)=>e.attendanceType) as int)
            //           : 'Absent',
            //       lname: snapshot?.data?.data?.attendents?.first.lastName,
            //       image: snapshot?.data?.data?.attendents?.first.profileImage,
            //       id: studentId,
            //       onPressed: () {
            //         Navigator.pushNamed(
            //           context,
            //           RoutePaths.studentProfilePage,
            //           arguments: studentId,
            //         );
            //       }),
            // );
          }
        });
  }

  Widget _busTackingListWidget(
    Resource<List<RouteStopMappingModel>>? busStopsListData,
    BusRouteListPageViewModel model,
    BuildContext context,
  ) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: busStopsListData?.data?.length ?? 0,
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.h);
          },
          itemBuilder: (context, index) {
            return AppStreamBuilder<double>(
                stream: model.distanceStream,
                initialData: model.distanceSubject.value,
                onData: (distance) {
                  if (distance > 0) {
                    // model
                    //     .updateLiveLocationStatus(
                    //         false);
                    // model.enableLiveLocation =
                    //     false;
                    // model
                    //     .distanceSubject
                    //     .add(0);
                    // navigateToBusRouteDetails(
                    //     context:
                    //         context,
                    //     busStopsListData:
                    //         busStopsListData,
                    //     index: index,
                    //     model: model);
                  }
                },
                dataBuilder: (context, distanceBetweenBusAndStop) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        navigateToBusRouteDetails(
                            context: context,
                            busStopsListData: busStopsListData,
                            index: index,
                            model: model);
                      },
                      child: TimelineTile(
                        model: model,
                        index: index,
                        stopid: busStopsListData?.data?[index].stop?.id ?? 0,
                        isActive: true,
                        lineWidth: 3.w,
                        stopName:
                            busStopsListData?.data?[index].stop?.stopName ?? '',
                        circleColor: AppColors.primary,
                        leadingChild: Column(children: [
                          CommonText(
                              text: model.convertTo12HourFormat(
                                  busStopsListData?.data?[index].approxTime ??
                                      ""),
                              style: AppTypography.caption,
                              color: AppColors.textGray),
                          // CommonText(
                          //     text:
                          //         "7:00 Am",
                          //     style: AppTypography
                          //         .caption,
                          //     color: index ==
                          //             0
                          //         ? AppColors
                          //             .success
                          //         : AppColors
                          //             .failure),
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: busStopsListData
                                        ?.data?[index].stop?.stopName ??
                                    '',
                                color: index <= (model.updatedRouteIndex ?? 0)
                                    ? AppColors.primary
                                    : AppColors.textLightGray,
                                style: AppTypography.subtitle2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(AppImages.userOutlineIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                CommonText(
                                    text:
                                        "${busStopsListData?.data?[index].totalStudents} Students",
                                    color: AppColors.textGray,
                                    style: AppTypography.caption),
                              ],
                            ),
                            if (index == 0)
                              Expanded(child: Container(height: 100.h))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget _trackBus({required void Function() onTap,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.only(left: 22.0, right: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: Strings.of(context).track_bus,
            style: AppTypography.subtitle1,
          ),
          InkWell(
            child: SvgPicture.asset(AppImages.trackBus),
            onTap: () {
              onTap();
            },
          )
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  const TimelineTile(
      {super.key,
      this.lineWidth = 1.3,
      this.circleSize,
      this.lineColor,
      this.circleColor,
      this.leadingChild,
      this.isActive = false,
      required this.index,
      required this.child,
      required this.stopName,
      required this.stopid,
      required this.model});

  final double? lineWidth;
  final double? circleSize;
  final Color? lineColor;
  final Color? circleColor;
  final Widget? child;
  final Widget? leadingChild;
  final int index;
  final bool isActive;
  final String stopName;
  final int stopid;
  final BusRouteListPageViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  if (leadingChild != null) leadingChild ?? Container(),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Visibility(
                              visible: model.busLogsEmpty == false &&
                                  index <= (model.updatedRouteIndex ?? 0),
                              replacement: Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.all(4),
                                margin: EdgeInsets.only(bottom: 2.h),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.textLightGray),
                                child: CommonText(
                                    text: "${index + 1}",
                                    style: AppTypography.caption,
                                    color: Colors.white),
                              ),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.all(4),
                                margin: EdgeInsets.only(bottom: 2.h),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  color: model.busLogsEmpty == false &&
                                          index <=
                                              (model.updatedRouteIndex ?? 0)
                                      ? AppColors.primary
                                      : AppColors.textLightGray,
                                  width: lineWidth,
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 10; i++)
                                        Column(
                                          children: [
                                            Container(
                                              color: model.busLogsEmpty ==
                                                          false &&
                                                      index <=
                                                          (model.updatedRouteIndex ??
                                                              0)
                                                  ? AppColors.primary
                                                  : AppColors.textLightGray,
                                              height: 5.h,
                                              width: lineWidth,
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              if (model.busLogsEmpty == false &&
                                  index == model.updatedRouteIndex) ...{
                                SizedBox(height: 24.h),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Image.asset(AppImages.yellowBus,
                                        height: 70.h),
                                    Positioned(
                                      left: 60.w,
                                      top: 8,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            left: -2,
                                            top: 13,
                                            bottom: 0,
                                            child: RotatedBox(
                                              quarterTurns: 3,
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.identity()
                                                    ..rotateZ(-3.14 / 4),
                                                  // Rotate to create the triangle effect
                                                  child: ClipPath(
                                                    clipper: TriangleClipper(),
                                                    child: Container(
                                                      color: AppColors
                                                          .primaryLighter,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              minWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.0,
                                              maxWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.5,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: AppColors.primaryLighter,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            margin: EdgeInsets.zero,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 10),
                                            child: CommonText(
                                              text:
                                                  "${Strings.of(context).currently_at} $stopName \n${Strings.of(context).updated1_min}",
                                              maxLines: 3,
                                              style: AppTypography.smallCaption
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurfaceVariant),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              },
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: child ??
                        Container(
                          height: 10.h,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(size.width, 0); // Top right
    path.close(); // Close to the starting point
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip
  }
}
