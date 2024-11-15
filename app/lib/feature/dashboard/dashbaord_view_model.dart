import 'dart:developer';

import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/enums/parent_student_status_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'dashboard_state.dart';

@injectable
class DashboardPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetGuardianStudentDetailsUsecase _getGuardianStudentDetailsUsecase;
  final TokenresponseUsecase tokenresponseUsecase;
  final GetUserRoleBasePermissionUsecase getUserRoleBasePermissionUsecase;

  BehaviorSubject<ParentStudentStatusEnum> statusSubject =
      BehaviorSubject.seeded(ParentStudentStatusEnum.enquiry);

  final GetUserDetailsUsecase _getUserDetailsUsecase;
  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  var dashboardState = DashboardState();

  DashboardPageModel(
      this.exceptionHandlerBinder,
      this._getGuardianStudentDetailsUsecase,
      this.tokenresponseUsecase,
      this.getUserRoleBasePermissionUsecase,
      this._getUserDetailsUsecase);

  final List<String> images = [
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    // Add more image paths if needed
  ];

  late String mobileNo;

  final List<String> dropdownValues = [
    'Vipul patel EN1437465346',
    'Amit patel EN1437465346'
  ];

  final List trackerTemp = [
    {'name': 'SR', 'image': AppImages.userSearch, 'isSelected': false},
    {'name': 'Order', 'image': AppImages.gift, 'isSelected': false},
    {'name': 'Transport', 'image': AppImages.bus, 'isSelected': false}
  ];

  final List progress = [
    {'name': 'Attendance', 'image': AppImages.attendance, 'isSelected': false},
    {
      'name': 'Discipline Slips',
      'image': AppImages.document,
      'isSelected': false
    },
    {'name': 'Performance', 'image': AppImages.activity, 'isSelected': false},
    {
      'name': 'Marksheet',
      'image': AppImages.documentNormal,
      'isSelected': false
    }
  ];

  final List enquiryAndAdmissionTemp = [
    {'name': 'Tickets', 'image': AppImages.receiptSearch, 'isSelected': false},
    {'name': 'Application', 'image': AppImages.cube, 'isSelected': false}
  ];

  final List feesTemp = [
    {'name': 'Payments', 'image': AppImages.walletAdd, 'isSelected': false},
    {
      'name': 'New Enrollment',
      'image': AppImages.activity,
      'isSelected': false
    },
  ];

  String returnRouteValue(String routeValue) {
    switch (routeValue) {
      case 'sr':
        return '';
      case 'order':
        return '';
      case 'transport':
        return RoutePaths.myDutyPage;
      case 'tickets':
        return RoutePaths.ticketListPage;
      case 'application':
        return '';
      case 'payments':
        return RoutePaths.payments;
      case '':
        return RoutePaths.payments;
      case 'attendance':
        return RoutePaths.attendanceCalender;
      case 'discipline slips':
        return RoutePaths.disciplinarySlipPage;
      default:
        return '';
    }
  }

  List<GetGuardianStudentDetailsStudentModel>? selectedStudentId = [];

  void getSelectedStudentid(List<String> names) {
    List<GetGuardianStudentDetailsStudentModel> tempList = [];
    for (var student
        in _getGuardianStudentDetailsModel.value.data!.data!.students!) {
      for (var name in names) {
        if (student.studentDisplayName == name) {
          tempList.add(student);
        }
      }
    }
    selectedStudentId = tempList;
    if (tempList.isNotEmpty) {
      dashboardState.setValueOfSelectedStudent(tempList.first);
    }
  }

  // Calling students list

  final BehaviorSubject<Resource<GetGuardianStudentDetailsModel>>
      _getGuardianStudentDetailsModel = BehaviorSubject();

  Stream<Resource<GetGuardianStudentDetailsModel>>
      get getGuardianStudentDetailsModel =>
          _getGuardianStudentDetailsModel.stream;

  Future<void> getStudentList(int mobileNo) async {
    await exceptionHandlerBinder.handle(block: () {
      GetGuardianStudentDetailsUsecaseParams params =
          GetGuardianStudentDetailsUsecaseParams(
              mobileNo: mobileNo); // 6380876483
      RequestManager<GetGuardianStudentDetailsModel>(
        params,
        createCall: () =>
            _getGuardianStudentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          List<GetGuardianStudentDetailsStudentModel> tempList = [];
          tempList.add(result.data!.data!.students![0]);
          selectedStudentId = tempList;

          if (selectedStudentId == null || selectedStudentId!.isEmpty) return;
          dashboardState.setValueOfSelectedStudent(tempList.first);
        }
        _getGuardianStudentDetailsModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getUserRoleBaseDetails() async {
    await exceptionHandlerBinder.handle(block: () {
      TokenresponseUsecaseParams params = TokenresponseUsecaseParams();
      RequestManager<TokenIntrospectionResponse>(
        params,
        createCall: () => tokenresponseUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          log("tokenresponseUsecase ${result.data.toString()}");
          getUserProfile(
              request: UserRolePermissionRequest(
                  email: result.data?.email, service: "mobile_app"));
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getUserProfile(
      {required UserRolePermissionRequest request}) async {
    await exceptionHandlerBinder.handle(block: () {
      GetUserRoleBasePermissionParams params =
          GetUserRoleBasePermissionParams(request: request);
      RequestManager<UserRolePermissionResponse>(
        params,
        createCall: () =>
            getUserRoleBasePermissionUsecase.execute(params: params),
      ).asFlow().listen((result) async {
        if (result.status == Status.success) {
          log("getUserRoleBasePermissionUsecase ${result.data}");
          SharedPreferenceHelper.saveString(
              mobileNumber, "${result.data?.data?.user?.mobileNo}");
          final statusId = result.data?.data?.user?.statusId ?? 0;
          final statusEnum = ParentStudentStatusEnum.fromStatus(statusId);
          getUserDetails();
          // Add the enum to the subject
          statusSubject.add(statusEnum);
          final phoneNo = await SharedPreferenceHelper.getString(mobileNumber);
          mobileNo = phoneNo;
          if (phoneNo.isNotEmpty &&
              statusEnum == ParentStudentStatusEnum.admission) {
            getStudentList(int.parse(phoneNo));
          }
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => _getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));
      }
    });
  }
}

class Chips {
  final String? name;
  final String? image;
  bool isSelected;

  Chips({this.name, this.image, this.isSelected = false});
}
