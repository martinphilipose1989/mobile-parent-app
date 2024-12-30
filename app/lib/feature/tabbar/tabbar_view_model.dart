import 'dart:developer';

import 'package:app/feature/tabbar/tabbar_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../navigation/route_paths.dart';

@injectable
class TabbarViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  TabbarViewModel(this.exceptionHandlerBinder);

  late TabController tabController;

  final BehaviorSubject<int> indexSubject = BehaviorSubject<int>();
  final BehaviorSubject<bool> isSelected = BehaviorSubject<bool>();
  final BehaviorSubject<DrawerItems?> selectedMenu =
      BehaviorSubject<DrawerItems?>.seeded(null);
  Stream<DrawerItems?> get selectedIndexStream => selectedMenu.stream;
  Stream<int> get indexStream => indexSubject.stream;

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
        menu: 'Attendance',
        route: RoutePaths.attendanceCalender,
        icon: AppImages.attendance),
    DrawerItems(
        menu: 'Disciplinary Slip',
        route: RoutePaths.disciplinarySlipPage,
        icon: AppImages.disciplinarySlip),
    DrawerItems(menu: 'Performance', icon: AppImages.activity),
    DrawerItems(menu: 'MarkSheet', icon: AppImages.documentNormal),
  ];

  final List<DrawerItems> dailyDiary = [
    DrawerItems(menu: 'Class Update', icon: AppImages.classupdate),
    DrawerItems(menu: 'Assignments', icon: AppImages.assignment),
    DrawerItems(menu: 'Circulars', icon: AppImages.circulars),
  ];

  final List<DrawerItems> parentServices = [
    DrawerItems(
        menu: 'Service Request',
        route: RoutePaths.attendanceCalender,
        icon: AppImages.serviceRequest),
    DrawerItems(
        menu: 'Order',
        route: RoutePaths.disciplinarySlipPage,
        icon: AppImages.order),
    DrawerItems(
        menu: 'Transport App',
        route: RoutePaths.myDutyPage,
        icon: AppImages.bus),
    DrawerItems(menu: 'Forms Download', icon: AppImages.downloadform),
    DrawerItems(menu: 'Application', icon: AppImages.application),
    DrawerItems(
        menu: 'Gate Management',
        route: RoutePaths.createEditGatePassPage,
        icon: AppImages.gate),
  ];

  final List<DrawerItems> infoItems = [
    DrawerItems(menu: 'Brochers ', icon: AppImages.bookLogo),
    DrawerItems(menu: 'Personal/Academic', icon: AppImages.academic),
    DrawerItems(menu: 'Admission', icon: AppImages.addPerson),
    DrawerItems(menu: 'Refferal', icon: AppImages.refferal),
    DrawerItems(menu: 'Scholars', icon: AppImages.icon),
    DrawerItems(menu: 'Competitive Exams', icon: AppImages.competitiveExam),
    DrawerItems(menu: 'Calender', icon: AppImages.calender),
    DrawerItems(menu: 'Canteen Menu', icon: AppImages.canteen),
    DrawerItems(menu: 'Parent Menu', icon: AppImages.parent),
    DrawerItems(menu: 'Syllabus', icon: AppImages.serviceRequest),
    DrawerItems(menu: 'Time Table', icon: AppImages.downloadform),
    DrawerItems(menu: 'Kids Club', icon: AppImages.kidsclob),
    DrawerItems(
      menu: 'IVT',icon: AppImages.assignment
    ),
  ];
}
