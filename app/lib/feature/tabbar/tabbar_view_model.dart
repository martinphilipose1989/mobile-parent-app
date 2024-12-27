import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class TabbarViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  TabbarViewModel(this.exceptionHandlerBinder);

  late TabController tabController;

  final BehaviorSubject<int> indexSubject = BehaviorSubject<int>();
  final BehaviorSubject<bool> isSelected = BehaviorSubject<bool>();
  final BehaviorSubject<int> selectedIndex = BehaviorSubject<int>();
  Stream<int> get selectedIndexstream => selectedIndex.stream;
  Stream<int> get indexSteam => indexSubject.stream;

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
}
