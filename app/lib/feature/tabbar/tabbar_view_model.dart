import 'dart:developer';

import 'package:app/feature/tabbar/tabbar_page.dart';
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
  final BehaviorSubject<DrawerItems?> selectedMenu = BehaviorSubject<DrawerItems?>.seeded(null);
  Stream<DrawerItems?>get selectedIndexStream => selectedMenu.stream;
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
    DrawerItems(menu:'Attendance',route: RoutePaths.attendanceCalender ),
    DrawerItems(menu:'Disciplinary Slip', route: RoutePaths.disciplinarySlipPage ),
    DrawerItems(menu:'Performance',  ),
    DrawerItems(menu:'MarkSheet', ),



  ];
  final List<DrawerItems> dailyDiary = [
    DrawerItems(menu:'Class Update', ),
    DrawerItems(menu:'Assignments',  ),
    DrawerItems(menu:'Circulars',  ),
  ];

  final List<DrawerItems> parentServices = [
    DrawerItems(menu:'Service Request',route: RoutePaths.attendanceCalender ),
    DrawerItems(menu:'Order', route: RoutePaths.disciplinarySlipPage ),
    DrawerItems(menu:'Transport App', route: RoutePaths.myDutyPage ),
    DrawerItems(menu:'Forms Download' ),
    DrawerItems(menu:'Application',  ),
    DrawerItems(menu:'Gate Management', route: RoutePaths.createEditGatePassPage ),
  ];

  final List<DrawerItems> infoItems = [
    DrawerItems(menu:'Brochers ', ),
    DrawerItems(menu:'Personal/Academic',  ),
    DrawerItems(menu:'Academics' ),
    DrawerItems(menu:'Refferal', route: RoutePaths.myDutyPage ),
    DrawerItems(menu:'Scholars' ),
    DrawerItems(menu:'Competitive Exams',  ),
    DrawerItems(menu:'Calender', ),
    DrawerItems(menu:'Canteen Menu',  ),
    DrawerItems(menu:'Parent Menu',  ),
    DrawerItems(menu:'Syllabus',  ),
    DrawerItems(menu:'Time Table',  ),
    DrawerItems(menu:'Kids Club',  ),
    DrawerItems(menu:'IVT',  ),
  ];


}
