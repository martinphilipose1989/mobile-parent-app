import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesDetailsPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  EnquiriesDetailsPageModel(this.exceptionHandlerBinder);
  late TabController tabController;
  bool visivilty = false;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
      BehaviorSubject<bool>.seeded(false);

  final List menuData = [
    {'image': AppImages.registrationIcon, 'name': "Registration"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.editDetails, 'name': "Edit Details"},
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  final BehaviorSubject<bool> selectedGradeType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> selectedSchoolLocationType =
      BehaviorSubject<bool>.seeded(false);
  final List<String> schoolLocationTypes = [
    'Location 1',
    'Location 2',
    'Location 3'
  ];

  final List<String> gradeTypes = ['Grade 1', 'Grade 2', 'Grade 3'];
}
