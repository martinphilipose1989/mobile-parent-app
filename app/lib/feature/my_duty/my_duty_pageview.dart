import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';

import 'package:app/utils/common_widgets/common_refresh_indicator.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';

import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/tansport/trip_list/completed_trip_list_tile.dart';
import '../../molecules/tansport/trip_list/upcoming_trip_list_tile.dart';
import '../../utils/common_widgets/data_status_widget.dart';
import '../../utils/common_widgets/toggle_option_list.dart';
import 'my_duty_page_viewmodel.dart';

class MyDutyPageView extends BasePageViewWidget<MyDutyPageViewModel> {
  // ignore: use_super_parameters
  MyDutyPageView(ProviderBase<MyDutyPageViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, MyDutyPageViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: REdgeInsets.all(16.0),
          child: ToggleOptionList<String>(
              selectedValue: model.selectedTripStatus,
              options: model.tripStatusType,
              onSelect: (value) => {model.getMyDutyList()}),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: SvgPicture.asset(AppImages.duty_list),
                onTap: () {
                  //  ProviderScope.containerOf(context).read(createIntimationProvider).pickImage(UpoladFileTypeEnum.image);
                  CommonPopups().showCreateIntimation(
                    context,
                    studentId: 10,
                    userId: 1,
                  );
                },
              ),
            ],
          ),
        ),
        AppStreamBuilder<String>(
            stream: model.selectedTripStatus,
            initialData: model.selectedTripStatus.value,
            dataBuilder: (context, data) {
              return Expanded(
                child: AppStreamBuilder<Resource<List<TripResult>>>(
                  stream: model.tripListStream,
                  initialData: Resource.none(),
                  dataBuilder: (context, tripData) {
                    return CommonRefreshIndicator(
                      onRefresh: () {
                        return model.refreshMyDutyList();
                      },
                      child: DataStatusWidget(
                        status: tripData?.status ?? Status.none,
                        loadingWidget: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: () => Center(
                          child: NoDataFoundWidget(
                            title: tripData?.dealSafeAppError?.error.message
                                        .contains("internet") ??
                                    false
                                ? Strings.of(context).no_internet_connection
                                : Strings.of(context).something_got_wrong,
                            subtitle: tripData?.dealSafeAppError?.error.message
                                        .contains("internet") ??
                                    false
                                ? Strings.of(context).it_seems_you_re_offline
                                : Strings.of(context).no_internet_connection,
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
                              return NotificationListener<ScrollNotification>(
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
                                    final itemCount = (tripData?.data?.length ??
                                            0) +
                                        (isLoading! && hasMorePage! ? 1 : 0);
                                    return Visibility(
                                      visible: tripData?.data?.isEmpty ?? false,
                                      replacement: CommonRefreshIndicator(
                                        isChildScrollable: true,
                                        onRefresh: () {
                                          return model.refreshMyDutyList();
                                        },
                                        child: ListView.builder(
                                          itemCount: itemCount,
                                          itemBuilder: (context, index) {
                                            if (index <
                                                (tripData?.data?.length ?? 0)) {
                                              return data == "completed trips"
                                                  ? CompletedTripListTile(
                                                      trip: tripData!
                                                          .data![index],
                                                    )
                                                  : UpcomingTripListTile(
                                                      trip: tripData!
                                                          .data![index]);
                                            } else if (isLoading) {
                                              return const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    bottom: 32),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              return const SizedBox.shrink();
                                            }
                                          },
                                        ),
                                      ),
                                      child:  NoDataFoundWidget(
                                        title: Strings.of(context).no_trip_found,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            })
      ],
    );
  }
}
