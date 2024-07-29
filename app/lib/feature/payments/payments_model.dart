import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentsModel extends BasePageViewModel with CommonTabMixin {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  PaymentsModel(this.exceptionHandlerBinder);

  TabController? tabController;

  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);

  final BehaviorSubject<int> switchTabsPaymentHistory =
      BehaviorSubject<int>.seeded(0);

  final List<String> studentDropdownValues = [
    'Vipul patel EN1437465346',
    'Amit patel EN1437465346'
  ];
  final List<String> academicYearDropdownValues = [
    'AY 2023 - 2024',
    'AY 2024 - 2025',
  ];

  final List schoolList = [
    {'name': 'VIBGYOR High', 'isSelected': false},
    {'name': 'VIBGYOR Kids', 'isSelected': false},
    {'name': 'VIBGYOR Rise', 'isSelected': false},
    {'name': 'VIBGYOR Roots', 'isSelected': false},
    {'name': 'VIVA', 'isSelected': false}
  ];

  final List paymentHistoryTypes = [
    {'name': 'Transaction Type', 'isSelected': false},
    {'name': 'Fees Type', 'isSelected': false},
    {'name': 'Student Ledger', 'isSelected': false},
  ];

  @override
  Stream<int> getSelectedIndex() {
    return selectedValue;
  }
}

class Chips {
  final String? name;

  bool isSelected;

  Chips({this.name, this.isSelected = false});
}

mixin CommonTabMixin {
  Stream<int> getSelectedIndex();
}
