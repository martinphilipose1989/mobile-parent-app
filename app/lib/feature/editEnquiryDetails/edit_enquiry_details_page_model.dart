import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EditEnquiriesDetailsPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  EditEnquiriesDetailsPageModel(this.exceptionHandlerBinder);

  late TabController tabController;
  bool visivilty=false;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);

  final BehaviorSubject<bool> selectedGradeType =
  BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> selectedSchoolLocationType =
  BehaviorSubject<bool>.seeded(false);
  final List<String> schoolLocationTypes = [
    'Location 1',
    'Location 2',
    'Location 3'
  ];


  final List<String> gradeTypes = [
    'Grade 1',
    'Grade 2',
    'Grade 3'
  ];
}
