import 'dart:developer';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/notification/notification_list_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_popups.dart';

import 'package:app/utils/common_widgets/common_refresh_indicator.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';

import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../utils/common_widgets/common_tab_page.dart';
import '../../utils/common_widgets/data_status_widget.dart';

import 'notification_viewmodel.dart';

class NotificationPageView
    extends BasePageViewWidget<NotificationPageViewModel> {
  // ignore: use_super_parameters
  NotificationPageView(ProviderBase<NotificationPageViewModel> model)
      : super(model);

  @override
  Widget build(BuildContext context, NotificationPageViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10.w,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: AppStreamBuilder<int>(
                stream: model.selectedStatusValue,
                dataBuilder: (context, data) {
                  return Row(
                    children: [
                      InkWell(
                        child: Chip(
                          label: Text("Today"),
                          backgroundColor: data == 0
                              ? AppColors.primaryLighter
                              : AppColors.lightgrey,
                        ),
                        onTap: () {
                          model.pageNumber=1;
                          model.selectedStatusValue.add(0);
                          model.fetchNotification(
                              notificationRequestModel:
                                  NotificationRequestModel(
                                      userId: 305,
                                      userType: 2,
                                      type: model.getType(model.selectedStatusValue.value, model.selectedValue.value),

                                      limit: 10,
                                      page: model.pageNumber));
                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        child: Chip(
                          label: Text("This Week"),
                          backgroundColor: data == 1
                              ? AppColors.primaryLighter
                              : AppColors.lightgrey,
                        ),
                        onTap: () {
                          model.pageNumber=1;
                          model.selectedStatusValue.add(1);
                          model.fetchNotification(
                              notificationRequestModel:
                                  NotificationRequestModel(
                                      userId: 305,
                                      userType: 2,
                                      type: model.getType(model.selectedStatusValue.value, model.selectedValue.value),

                                      limit: 10,
                                      page: model.pageNumber));
                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        child: Chip(
                          label: Text("Important"),
                          backgroundColor: data == 2
                              ? AppColors.primaryLighter
                              : AppColors.lightgrey,
                        ),
                        onTap: () {
                          model.pageNumber=1;
                          model.selectedStatusValue.add(2);
                          model.fetchNotification(
                              notificationRequestModel:
                                  NotificationRequestModel(
                                      userId: 305,
                                      userType: 2,
                                      type: model.NOTIFICATION_LIST_TYPE[3],
                                      limit: 10,
                                      page: model.pageNumber));
                        },
                      ),
                    ],
                  );
                },
                initialData: 0,
              ),
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          CommonTabPage(
            firstTabTitle: "Unread()",
            onFirstTabChange: () {
              model.pageNumber=1;
              model.selectedValue.add(0);

              model.fetchNotification(
                  notificationRequestModel: NotificationRequestModel(
                      userId: 305,
                      userType: 2,
                      type: model.getType(model.selectedStatusValue.value, model.selectedValue.value),

                      limit: 10,
                      page: model.pageNumber));
            },
            onSecondTabChange: () {
              model.pageNumber=1;
              model.selectedValue.add(1);
              model.fetchNotification(
                  notificationRequestModel: NotificationRequestModel(
                      userId: 305,
                      userType: 2,
                      type: model.getType(model.selectedStatusValue.value, model.selectedValue.value),
                      limit: 10,
                      page: model.pageNumber));
            },
            secondTabTitle: "Read()",
            // tabController: model.tabController,
            selectedValue: model.selectedValue, tabController: null,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppStreamBuilder<Resource<List<NotificationDetail>>>(
                stream: model.notificationStream,
                dataBuilder: (context, notification) {
                  return DataStatusWidget(
                      status: notification?.status ?? Status.none,
                      loadingWidget: () =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: () => Center(
                            child: NoDataFoundWidget(
                              title: notification?.dealSafeAppError?.error.message
                                          .contains("internet") ??
                                      false
                                  ? "No Internet Connection"
                                  : "Something Went Wrong",
                              subtitle: notification
                                          ?.dealSafeAppError?.error.message
                                          .contains("internet") ??
                                      false
                                  ? "It seems you're offline. Please check your internet connection and try again."
                                  : "An unexpected error occurred. Please try again later or contact support if the issue persists.",
                              onPressed: () {
                                model.fetchNotification(
                                    notificationRequestModel:
                                        NotificationRequestModel(
                                            userId: 305,
                                            userType: 2,
                                            type:
                                                model.NOTIFICATION_LIST_TYPE[0],
                                            limit: 10,
                                            page: model.pageNumber));
                              },
                            ),
                          ),
                      successWidget: () => notification?.data?.isEmpty ?? false
                          ? NoDataFoundWidget(title: "No data found")
                          : ListView.separated(
                        controller: model.scrollController,
                              shrinkWrap: true,
                              itemCount:
                              notification?.data?.length??0,
                              itemBuilder: (BuildContext context, int index) {
                              print ( notification?.data?.length??0,);
                              final notificationItem = notification?.data?[index];
                                return NotificationListItem(
                                   // subject:snapshot?.data?[index].mode?.modeContent?.subject??""
                                    subject: notificationItem?.mode?.modeContent?.subject??""    ,
                                    content: notificationItem?.mode?.modeContent?.content??""
                              // content: snapshot?.data?[index].mode?.modeContent?.content??""
                                    );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 2.h,
                                );
                              },
                            ));
                },
                initialData: Resource.none(),
              ),
            ),
          )


        ],
      ),
    );
  }
}
