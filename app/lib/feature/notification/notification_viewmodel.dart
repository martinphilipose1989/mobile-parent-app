// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';

import 'package:data/data.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class NotificationPageViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final NotificationUsecase notificationUsecase;
  final GetUserDetailsUsecase getUserDetailsUsecase;

  NotificationPageViewModel(
      {required this.notificationUsecase,
      required this.getUserDetailsUsecase,
      required this.exceptionHandlerBinder,
      required this.flutterToastErrorPresenter}) {
    _setupThrottling();
    setupScrollListener();
    getUserDetails();
  }
  //TabController tabController=TabController(length: 2, vsync: this);

  final BehaviorSubject<int> selectedStatusValue =
      BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(-1);
  final BehaviorSubject<bool> expand = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(true);
  int userId = 0;
  int userType = 2;
  final _throttleDuration = const Duration(milliseconds: 300);
  String getType(int selectedStatusValue, int selectedValue) {
    if (selectedStatusValue == 0 && selectedValue == -1) {
      return notificationListType[0];
    } else if (selectedStatusValue == 0 && selectedValue == 0) {
      return notificationListType[1];
    } else if (selectedStatusValue == 0 && selectedValue == 1) {
      return notificationListType[2];
    } else if (selectedStatusValue == 1 && selectedValue == 0) {
      return notificationListType[3];
    } else if (selectedStatusValue == 1 && selectedValue == 1) {
      return notificationListType[4];
    } else {
      return notificationListType[5];
    }
  }

  List<String> notificationListType = [
    'all-today',
    'unread-today',
    'read-today',
    'unread-this_week',
    'read-this_week',
    'all-this_week',
  ];

  void loadMoreNotificationList() {
    if (notificationSubject.value.data?.isNotEmpty ?? false) {
      _throttlingController.add(null);
    }
  }

  final StreamController<void> _throttlingController = StreamController<void>();

  void _setupThrottling() {
    _throttlingController.stream.throttleTime(_throttleDuration).listen((_) {
      if (!_loadingSubject.value && !isLastPage()) {
        pageNumber++;
        fetchNotification(
            notificationRequestModel: NotificationRequestModel(
                userId: userId,
                userType: userType,
                type: getType(selectedStatusValue.value, selectedValue.value),
                limit: 10,
                page: pageNumber));
      }
    });
  }

  final ScrollController scrollController = ScrollController();

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreNotificationList();

        if (isLoading.value) {
          return;
        }

        pageNumber++;
        isLoading.add(false);
        fetchNotification(
            notificationRequestModel: NotificationRequestModel(
                userId: userId,
                userType: userType,
                type: getType(selectedStatusValue.value, selectedValue.value),
                limit: 10,
                page: pageNumber));
      }
    });
  }

  final notificationSubject =
      BehaviorSubject<Resource<List<NotificationDetail>>>.seeded(
          Resource.none());
  final _loadingSubject = BehaviorSubject<bool>.seeded(false);
  Stream<Resource<List<NotificationDetail>>> get notificationStream =>
      notificationSubject.stream;

  int pageNumber = 1, pageSize = 10;
  int count = 0;

  bool isLastPage() {
    // Calculate total pages
    int totalPages = (count / pageSize).ceil();
    return pageNumber >= totalPages;
  }

  List<NotificationDetail> notificationList = [];
  // List to hold notifications
  void _updatenotificationList(
    List<NotificationDetail> notifications,
  ) {
    if (pageNumber == 1) {
      notificationSubject.add(Resource.success(data: notifications));
    } else {
      final List<NotificationDetail> updatedList = [
        ...notificationSubject.value.data ?? <NotificationDetail>[],
        ...notifications
      ];
      notificationSubject.add(Resource.success(data: updatedList));
    }
    if (isLastPage()) {
      //notificationSubject.add(Resource.success(data: notifications));
      _loadingSubject.add(false);
    }
  }

  Future<void> fetchNotification({
    bool isRefresh = false,
    required NotificationRequestModel notificationRequestModel,
  }) async {
    exceptionHandlerBinder.handle(block: () async {
      if (isRefresh) {
        pageNumber = 1;
        notificationList.clear(); // Clear the list on refresh
      }

      NotificationUsecaseParams notificationUsecaseParams =
          NotificationUsecaseParams(
        userId: notificationRequestModel.userId,
        userType: notificationRequestModel.userType,
        type: notificationRequestModel.type,
        limit: notificationRequestModel.limit,
        page: notificationRequestModel.page,
      );

      if (pageNumber > 1) {
        isLoading.value = true;
      }

      RequestManager<NotificationResponseModel>(
        notificationUsecaseParams,
        createCall: () => notificationUsecase.execute(
          params: notificationUsecaseParams,
        ),
      ).asFlow().listen((event) {
        if (event.status == Status.loading) {
          if (pageNumber == 1 && !isRefresh) {
            notificationSubject
                .add(Resource.loading()); // Notify UI about loading state
          }
        }

        if (event.status == Status.success) {
          count = event.data?.data?.totalCount ?? 0;
          if (pageNumber == 1) {
            notificationSubject
                .add(Resource.success(data: event.data?.data?.data ?? []));
          } else {
            if (!isLastPage()) {
              notificationList = event.data?.data?.data ?? []; //

              _updatenotificationList(notificationList);
            }
          }

          // count = event.data?.data?.totalCount ?? 0;// Notify UI about new data
        }

        if (event.status == Status.error) {
          if (pageNumber == 1) {
            notificationSubject.add(Resource.success(
                data: event.data?.data?.data ??
                    [])); // Notify UI about error for the first page
          } else {
            // if (!isLastPage()) {
            // pageNumber++;
//_updatenotificationList(notificationList);
            //notificationSubject.add(Resource.success(data: event.data?.data?.data ?? [])); // Notify UI about the error
            // }
          }
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));

        if (userSubject.value.data?.id != null) {
          userId = userSubject.value.data!.id!;

          fetchNotification(
              notificationRequestModel: NotificationRequestModel(
                  userId: userId,
                  userType: userType,
                  type: getType(selectedStatusValue.value, selectedValue.value),
                  limit: 10,
                  page: pageNumber));
        }
      }
    });
  }
}
