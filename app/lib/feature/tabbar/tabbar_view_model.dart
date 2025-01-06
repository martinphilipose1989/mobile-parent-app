import 'package:app/dependencies.dart';
import 'package:app/feature/dashboard/dashboard_state.dart';

import 'package:app/feature/tabbar/tabbar_class.dart';

import 'package:app/model/resource.dart';

import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../myapp.dart';
import '../../navigation/route_paths.dart';
import '../payments/payments_pages/payments.dart';

@injectable
class TabbarViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetUserDetailsUsecase getUserDetailsUsecase;

  // Initialize userSubject without accessing it during declaration
  final BehaviorSubject<User> userSubject = BehaviorSubject<User>();

  TabbarViewModel(
      {required this.exceptionHandlerBinder,
      required this.getUserDetailsUsecase}) {
    getUserDetails();
  }

  late TabController tabController;

  final BehaviorSubject<int> indexSubject = BehaviorSubject<int>();
  final BehaviorSubject<bool> isSelected = BehaviorSubject<bool>.seeded(true);
  ValueStream<bool> get isSelectedStream => isSelected.stream;

  final BehaviorSubject<DrawerItems?> selectedMenu =
      BehaviorSubject<DrawerItems?>.seeded(null);

  Stream<DrawerItems?> get selectedIndexStream => selectedMenu.stream;

  Stream<int> get indexStream => indexSubject.stream;
  final phoneNo = SharedPreferenceHelper.getString(mobileNumber);

  void onItemTapped(int index) {
    tabController.index = index;
    indexSubject.add(index);
  }

  String getPageName(int value) {
    switch (value) {
      case 0:
        return 'Dashboard';
      case 1:
        return '2';
      case 2:
        return '3';
      case 3:
        return '4';
      default:
        return 'N/A';
    }
  }

  final List<DrawerItems> progressItems = [
    DrawerItems(
        menu: 'Student Profile',
        route: RoutePaths.attendanceCalender,
        icon: AppImages.attendance),
    DrawerItems(
        menu: 'Disciplinary Slip',
        route: RoutePaths.disciplinarySlipPage,
        icon: AppImages.disciplinarySlip,
        isActive: false),
    DrawerItems(menu: 'Performance', icon: AppImages.activity, isActive: false),
    DrawerItems(
        menu: 'MarkSheet', icon: AppImages.documentNormal, isActive: false),
  ];

  final List<DrawerItems> dailyDiary = [
    DrawerItems(menu: 'Class Update', icon: AppImages.classupdate),
    DrawerItems(menu: 'Assignments', icon: AppImages.assignment),
    DrawerItems(menu: 'Circulars', icon: AppImages.circulars),
  ];

  final List<DrawerItems> fessItems = [
    DrawerItems(
        menu: 'Payments',
        onTap: () async {
          Navigator.pushNamed(
            navigatorKey.currentContext!,
            RoutePaths.payments,
            arguments: PaymentArguments(
                phoneNo:
                    "+91${await SharedPreferenceHelper.getString(mobileNumber)}"),
          );
        },
        icon: AppImages.walletAdd),
    DrawerItems(
        menu: 'New Enrollment',
        icon: AppImages.activity,
        isActive: true,
        route: RoutePaths.newEnrolmentPage),
    DrawerItems(
        menu: 'Transaction History',
        route: RoutePaths.paymentsPage,
        icon: AppImages.transactionHistory,
        isActive: false),
    DrawerItems(menu: 'Receipt', icon: AppImages.receipt, isActive: false),
  ];

  final List<DrawerItems> parentServices = [
    DrawerItems(
        menu: 'Subject Selection',
        icon: AppImages.subjectSelection,
        isActive: false,
        onTap: () {
          DashboardState dashboardState = DashboardState();
          final String subjectSelectionUrl =
              getIt.get<String>(instanceName: "SubjectSelectionUrl");
          final selectedStudent = dashboardState.selectedStudent;

          // Navigator.pushNamed(
          //   navigatorKey.currentContext!,
          //   RoutePaths.webview,
          //   arguments: WebviewArguments(
          //       enquiryDetailArgs: EnquiryDetailArgs(),
          //       paymentsLink:
          //           '$subjectSelectionUrl?platform=mobile&authToken=${userSubject.value.data?.token}&unique_url_key=${selectedStudent?.urlKey}'),
          // );
        }),
    DrawerItems(
        menu: 'Service Request',
        route: RoutePaths.attendanceCalender,
        icon: AppImages.serviceRequest,
        isActive: false),
    DrawerItems(
        menu: 'Order',
        route: RoutePaths.disciplinarySlipPage,
        icon: AppImages.order,
        isActive: false),
    DrawerItems(
        menu: 'Transport App',
        route: RoutePaths.myDutyPage,
        icon: AppImages.bus,
        isActive: false),
    DrawerItems(
        menu: 'Forms Download', icon: AppImages.downloadform, isActive: false),
    DrawerItems(
        menu: 'Application', icon: AppImages.application, isActive: false),
    //
    DrawerItems(
        menu: 'Gate Management',
        route: RoutePaths.createEditGatePassPage,
        icon: AppImages.gate,
        isActive: false),
  ];

  final List<DrawerItems> infoItems = [
    DrawerItems(menu: 'Brochers ', icon: AppImages.bookLogo),
    DrawerItems(menu: 'Personal/Academic', icon: AppImages.academic),
    DrawerItems(menu: 'Admission', icon: AppImages.addPerson),
    DrawerItems(menu: 'Referral', icon: AppImages.refferal),
    DrawerItems(menu: 'Scholars', icon: AppImages.icon),
    DrawerItems(menu: 'Competitive Exams', icon: AppImages.competitiveExam),
    DrawerItems(menu: 'Calender', icon: AppImages.calender),
    DrawerItems(menu: 'Canteen Menu', icon: AppImages.canteen),
    DrawerItems(menu: 'Parent Menu', icon: AppImages.parent),
    DrawerItems(menu: 'Syllabus', icon: AppImages.serviceRequest),
    DrawerItems(menu: 'Time Table', icon: AppImages.downloadform),
    DrawerItems(menu: 'Kids Club', icon: AppImages.kidsclob),
    DrawerItems(menu: 'IVT', icon: AppImages.assignment),
  ];

  List<MenuItem> menuItems = [];

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(data.data!);
      }
    });
  }
}
