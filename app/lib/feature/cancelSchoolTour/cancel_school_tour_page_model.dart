import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class CancelSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  CancelSchoolTourPageModel(this.exceptionHandlerBinder);

  final BehaviorSubject<bool> selectedReasonType =
  BehaviorSubject<bool>.seeded(false);
  final List<String> reasonTypes = [
    'Reason 1',
    'Reason 2',
    'Reason 3'
  ];
}
