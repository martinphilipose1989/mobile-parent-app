import 'dart:developer';

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

import '../../navigation/route_paths.dart';

@injectable
class TabbarViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetUserDetailsUsecase getUserDetailsUsecase;

  // Initialize userSubject without accessing it during declaration
  final BehaviorSubject<User?> userSubject = BehaviorSubject<User>();

  TabbarViewModel(
      {required this.exceptionHandlerBinder,
      required this.getUserDetailsUsecase}) {
    // getUserDetails();
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
        icon: AppImages.attendance,
        key: 'student_profile',
        isActive: false),
    DrawerItems(
      menu: 'Disciplinary Slip',
      route: RoutePaths.disciplinarySlipPage,
      icon: AppImages.disciplinarySlip,
      isActive: false,
      key: 'disciplinary_slip',
    ),
    DrawerItems(
      menu: 'Performance',
      icon: AppImages.activity,
      isActive: false,
      key: "performance",
    ),
    DrawerItems(
        menu: 'MarkSheet',
        icon: AppImages.documentNormal,
        isActive: false,
        key: "marksheet"),
  ];

  final List<DrawerItems> dailyDiary = [
    DrawerItems(
        menu: 'Class Update',
        icon: AppImages.classupdate,
        key: "class_update",
        isActive: false),
    DrawerItems(
        menu: 'Assignments',
        icon: AppImages.assignment,
        key: "assignments",
        isActive: false),
    DrawerItems(
        menu: 'Circulars',
        icon: AppImages.circulars,
        key: "circulars",
        isActive: false),
  ];

  final List<DrawerItems> fessItems = [
    DrawerItems(
        menu: 'Payments',
        key: "payments",
        icon: AppImages.walletAdd,
        isActive: false),
    DrawerItems(
        key: "new_enrolment",
        menu: 'New Enrollment',
        icon: AppImages.activity,
        isActive: false,
        route: RoutePaths.newEnrolmentPage),
    DrawerItems(
        key: "transaction_history",
        menu: 'Transaction History',
        route: RoutePaths.paymentsPage,
        icon: AppImages.transactionHistory,
        isActive: false),
    DrawerItems(
        key: "receipt",
        menu: 'Receipt',
        icon: AppImages.receipt,
        isActive: false),
  ];

  final List<DrawerItems> parentServices = [
    DrawerItems(
      key: "subject_selection",
      menu: 'Subject Selection',
      icon: AppImages.subjectSelection,
      isActive: false,
    ),
    DrawerItems(
        key: 'service_request',
        menu: 'Service Request',
        route: RoutePaths.attendanceCalender,
        icon: AppImages.serviceRequest,
        isActive: false),
    DrawerItems(
        key: 'order',
        menu: 'Order',
        route: RoutePaths.disciplinarySlipPage,
        icon: AppImages.order,
        isActive: false),
    DrawerItems(
        key: 'transport_app',
        menu: 'Transport App',
        route: RoutePaths.myDutyPage,
        icon: AppImages.bus,
        isActive: true),
    DrawerItems(
        key: 'forms_download',
        menu: 'Forms Download',
        icon: AppImages.downloadform,
        isActive: false),
    DrawerItems(
        key: 'application',
        menu: 'Application',
        icon: AppImages.application,
        isActive: false),
    //
    DrawerItems(
        key: 'gate_management',
        menu: 'Gate Management',
        route: RoutePaths.createEditGatePassPage,
        icon: AppImages.gate,
        isActive: false),
  ];

  final List<DrawerItems> infoItems = [
    DrawerItems(
        menu: 'Brochers ',
        icon: AppImages.bookLogo,
        key: 'brochers',
        isActive: false),
    DrawerItems(
        menu: 'Personal/Academic',
        icon: AppImages.academic,
        key: 'personal',
        isActive: false),
    DrawerItems(
        menu: 'Admission',
        icon: AppImages.addPerson,
        key: 'admission',
        isActive: false),
    DrawerItems(
        menu: 'Referral',
        icon: AppImages.refferal,
        key: 'referral',
        isActive: false),
    DrawerItems(
        menu: 'Scholars',
        icon: AppImages.icon,
        key: 'scholars',
        isActive: false),
    DrawerItems(
        menu: 'Competitive Exams',
        icon: AppImages.competitiveExam,
        key: 'competitive_exams',
        isActive: false),
    DrawerItems(
        menu: 'Calender',
        icon: AppImages.calender,
        key: 'calendar',
        isActive: false),
    DrawerItems(
        menu: 'Canteen Menu',
        icon: AppImages.canteen,
        key: 'canteen_menu',
        isActive: false),
    DrawerItems(
        menu: 'Parent Menu',
        icon: AppImages.parent,
        key: 'parent_menu',
        isActive: false),
    DrawerItems(
        menu: 'Syllabus',
        icon: AppImages.serviceRequest,
        key: 'syllabus',
        isActive: false),
    DrawerItems(
        menu: 'Time Table',
        icon: AppImages.downloadform,
        key: 'time_table',
        isActive: false),
    DrawerItems(
        menu: 'Kids Club',
        icon: AppImages.kidsclob,
        key: 'kids_club',
        isActive: false),
    DrawerItems(
        menu: 'IVT', icon: AppImages.assignment, key: 'ivt', isActive: false),
  ];

  BehaviorSubject<List<MenuItem>> menuItems = BehaviorSubject.seeded([]);

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        if (data.data != null) {
          userSubject.add(data.data);
        }

        setDrawerMenuItems(data);
      } else if (data.status == Status.error) {
        log("ERROR ${data.dealSafeAppError?.error.message}");
      }
    });
  }

  void setDrawerMenuItems(Resource<User> data) {
    showDrawerMenu.add(true);
    for (int i = 0; i < fessItems.length; i++) {
      if (fessItems[i].key == "payments" ||
          fessItems[i].key == "new_enrolment") {
        if (data.data?.statusId != 0) {
          fessItems[i].isActive = true;
        }
      }
    }

    for (int i = 0; i < progressItems.length; i++) {
      if (progressItems[i].key == "student_profile") {
        if (data.data?.statusId != 0) {
          progressItems[i].isActive = true;
        }
      }
    }

    for (int i = 0; i < parentServices.length; i++) {
      if (parentServices[i].key == "subject_selection") {
        if (data.data?.statusId != 0) {
          parentServices[i].isActive = true;
        }
      }
    }

    // for (int i = 0; i < infoItems.length; i++) {
    //   if (infoItems[i].key == "payments" ||
    //       infoItems[i].key == "new_enrolment") {
    //     if (data.data?.statusId != 0) {
    //       infoItems[i].isActive = true;
    //     }
    //   }
    // }

    // for (int i = 0; i < dailyDiary.length; i++) {
    //   if (dailyDiary[i].key == "payments" ||
    //       dailyDiary[i].key == "new_enrolment") {
    //     if (data.data?.statusId != 0) {
    //       dailyDiary[i].isActive = true;
    //     }
    //   }
    // }

    menuItems.add([
      MenuItem(
          menuItem: "Fees",
          menuItemActive: data.data?.statusId != 0,
          drawerItmes: fessItems),
      MenuItem(
          menuItem: "Child Progress/Academic Progress",
          menuItemActive: data.data?.statusId != 0,
          drawerItmes: progressItems),
      MenuItem(
          menuItem: "Parent Services",
          menuItemActive: data.data?.statusId != 0,
          drawerItmes: parentServices),
      MenuItem(menuItem: "Info", menuItemActive: false, drawerItmes: infoItems),
      MenuItem(
          menuItem: "Daily Diary",
          menuItemActive: false,
          drawerItmes: dailyDiary)
    ]);
  }
}
