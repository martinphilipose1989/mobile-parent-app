import 'dart:async';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/dashboard/dashboard_state.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/permission_handler.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class BusRouteListPageViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GetAllBusStopsUsecase getAllBusStopsUsecase;
  final GetStudentAttendanceUseCase getStudentAttendanceUseCase;

  final FetchStopLogsUsecase fetchStopLogsUsecase;

  BusRouteListPageViewModel(
      {required this.exceptionHandlerBinder,
      required this.getStudentAttendanceUseCase,
      required this.flutterToastErrorPresenter,
      required this.getAllBusStopsUsecase,
      required this.fetchStopLogsUsecase});

  TripResult? trip;
  late Timer timer;

  final _loadingSubject = BehaviorSubject<bool>.seeded(false);
  final _pageSubject = BehaviorSubject<int>.seeded(1);
  final _busStopsListSubject =
      BehaviorSubject<Resource<List<RouteStopMappingModel>>>.seeded(
          Resource.none());
  final fetchBusStopLogsSubject =
      BehaviorSubject<Resource<List<FetchStopLogsData>>>.seeded(
          Resource.none());

  final studentAttendanceSubject =
      BehaviorSubject<Resource<GetStudentAttendance>>.seeded(Resource.none());

  Stream<Resource<GetStudentAttendance>> get studentAttendanceStream =>
      studentAttendanceSubject.stream;

  final hasMorePagesSubject = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get loadingStream => _loadingSubject.stream;

  Stream<bool> get hasMorePagesStream => hasMorePagesSubject.stream;
  DashboardState dashBoardState = DashboardState();
  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent = [];

  Stream<Resource<List<RouteStopMappingModel>>> get busStopsListStream =>
      _busStopsListSubject.stream;

  bool? dropStarted;

  void getBusStopsList() {
    _loadingSubject.add(true);
    if (_pageSubject.value == 1) {
      _busStopsListSubject.add(Resource.loading(data: null));
    }

    final GetAllBusStopsParams params = GetAllBusStopsParams(
        routeId: trip?.id ?? '', dayId: DateTime.now().weekday, app: 'app');

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => getAllBusStopsUsecase.execute(params: params),
      onSuccess: (result) {
        _busStopsListSubject
            .add(Resource.success(data: result?.data?.routeStopMapping));
        _loadingSubject.add(false);
        fetchBusStopLogs(result?.data?.routeStopMapping ?? []);
      },
      onError: (error) {
        _busStopsListSubject.add(Resource.error(data: null, error: error));
        _loadingSubject.add(false);
      },
    );
  }

  void getStudentAttendance() async {
    //  _loadingSubject.add(true);

    GetStudentAttendanceUsecaseParams getStudentAttendanceUsecaseParams =
        GetStudentAttendanceUsecaseParams(
          // academicYearId: 25,

          attendanceStartDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          attendanceEndDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            studentId: dashBoardState.selectedStudent?.id,
          //  attendanceType: [int.parse(trip?.routeType == '1' ? "4" : "6")]
         attendanceType: []

        );
    print("attendance type-----------");
    print(getStudentAttendanceUsecaseParams.attendanceType);
//int.parse(trip?.routeType == '1' ? "4" : "6")
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: getStudentAttendanceUsecaseParams,
      createCall: (params) =>
          getStudentAttendanceUseCase.execute(params: params),
      onSuccess: (result) {
        _loadingSubject.add(true);
        studentAttendanceSubject.add(Resource.success(data: result));



        // fetchBusStopLogs(result?.data?.routeStopMapping ?? []);
      },
      onError: (error) {
        studentAttendanceSubject.add(Resource.error(data: null, error: error));
        //  _loadingSubject.add(false);
      },
    );
  }

  // ignore: unused_field
  Position? _busPosition;

  void getUserLoacation() async {
    PermissionHandlerService permission = PermissionHandlerService();
    _busPosition = await permission.getUserLocation();
  }

  void fetchBusStopLogs(List<RouteStopMappingModel> a) {
    final FetchStopLogsParams params = FetchStopLogsParams(
        routeId: int.parse(trip?.id ?? ''), platform: "app");

    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) => fetchStopLogsUsecase.execute(params: params),
      onSuccess: (results) {
        for (var value in a) {
          for (var result in results!.data!) {
            if (value.stop?.id == result.stopId) {
              if (result.stopStatus == 'At Stop') {
                if (!value.stopComplete) {
                  value.stopComplete = true;
                }
              }
            }
          }
        }

        updatRoute(a);

        fetchBusStopLogsSubject
            .add(Resource.success(data: results?.data ?? []));
        if (fetchBusStopLogsSubject.valueOrNull?.data?.isNotEmpty ?? false) {
          busLogsEmpty = false;
        }
      },
      onError: (error) {
        fetchBusStopLogsSubject.add(Resource.error(data: null, error: error));
      },
    );
  }

  int? updatedRouteIndex;
  bool busLogsEmpty = true;

  String getAttendanceStatus(int? attendanceType) {
    switch (attendanceType) {
      case 3:
        return "Reached School";
      case 4:
        return "Picked from school";
      case 5:
        return "Dropped";
      case 6:
        return "Pickup from Stop";
      default:
        return "Absent";
    }
  }
  // RouteStopMappingModel? currentStop;
  // RouteStopMappingModel? nextStop;
  // String getAttendanceStatus(int? attendanceType) {
  //   switch (attendanceType) {
  //     case 4:
  //       return "Picked from school";
  //     case 5:
  //       return "Dropped";
  //     default:
  //       return "Absent";
  //   }
  // }
  void updatRoute(List<RouteStopMappingModel> a) {
    // a.sort(
    //   (a, b) => a.stop!.orderBy!.compareTo(b.stop!.orderBy!),
    // );
    for (var i = 0; i < a.length; i++) {
      if (i != a.length - 1) {
        if (a[i].stopComplete && a[i + 1].stopComplete) {
          updatedRouteIndex = i + 1;
          // currentStop = a[updatedRouteIndex];
          // nextStop = a[updatedRouteIndex + 1];
          //break;
        } else {
          updatedRouteIndex ??= 0;
          //  break;
        }
      }
    }
    //  log("nextStop ${nextStop?.stop?.lat} ${nextStop?.stop?.long}");
    _busStopsListSubject.add(Resource.success(data: a));
  }

  // distance between bus and next stop
  BehaviorSubject<double> distanceSubject = BehaviorSubject<double>.seeded(0);

  Stream<double> get distanceStream => distanceSubject.stream;

  Future<void> checkBusProximity(
      {required double latitude, required double longitude}) async {
    // Check the distance to the bus stop
    // if (nextStop?.stop == null) return;

    // double distanceInMeters = Geolocator.distanceBetween(
    //     19.141425, //latitude,
    //     72.8309000, //  longitude,

    //     double.parse(nextStop?.stop?.lat ?? '0'),
    //     double.parse(nextStop?.stop?.long ?? '0'));

    // if (distanceInMeters > 0 && distanceInMeters <= 50) {
    //   log("IF distanceInMeters ${distanceInMeters.floor()}");
    //   distanceSubject.add(distanceInMeters);
    // } else {
    //   log("ELSE distanceInMeters ${distanceInMeters.floor()}");
    // }
  }

  StreamSubscription<Position>?
      _positionSubscription; // Declare a StreamSubscription
  bool enableLiveLocation =
      false; // Example flag for enabling/disabling location tracking

  void trackLiveLocation() {
    PermissionHandlerService permission = PermissionHandlerService();

    // Check if location tracking is enabled
    if (enableLiveLocation) {
      // If already subscribed, return to avoid duplicate subscriptions
      _positionSubscription ??= permission.liveLocation().listen((position) {
        // Call checkBusProximity whenever a new position is received
        checkBusProximity(
            latitude: position.latitude, longitude: position.longitude);
      });
    } else {
      // If not enabled, pause the subscription
      _positionSubscription?.pause();
    }
  }

  void updateLiveLocationStatus(bool isEnabled) {
    enableLiveLocation = isEnabled;

    // If enabled, resume the stream; if disabled, pause it
    if (enableLiveLocation) {
      _positionSubscription?.resume();
    } else {
      _positionSubscription?.pause();
    }
  }

  String convertTo12HourFormat(String time) {
    // Split the input string to extract hours, minutes, and seconds
    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Determine if it's AM or PM
    String period = hour >= 12 ? 'PM' : 'AM';

    // Convert hour to 12-hour format
    int hourIn12HourFormat = hour % 12 == 0 ? 12 : hour % 12;

    // Format the time as required (without seconds)
    return "$hourIn12HourFormat:${minute.toString().padLeft(2, '0')} $period";
  }

  Future<void> refreshMyDutyList() async {
    _pageSubject.add(1);
    _busStopsListSubject.add(Resource.success(data: []));
    hasMorePagesSubject.add(true);
    _loadingSubject.add(false);
    getBusStopsList();
  }

  @override
  void dispose() {
    _loadingSubject.close();
    _pageSubject.close();
    hasMorePagesSubject.close();
    _busStopsListSubject.close();
    _positionSubscription?.cancel();
    _positionSubscription = null;
    super.dispose();
  }
}
