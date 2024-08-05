import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesAdmissionsJourneyViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  EnquiriesAdmissionsJourneyViewModel(this.exceptionHandlerBinder);

  final List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false},
    {'name': 'Parent Info', 'isSelected': false},
    {'name': 'Contact Info', 'isSelected': false},
    {'name': 'Medical Details', 'isSelected': false},
    {'name': 'Bank Details', 'isSelected': false},
    {'name': 'Upload Docs', 'isSelected': false}
  ];

  final List stepperData = [
    {'name': 'New Enquiry', 'subtitle': ""},
    {
      'name': 'School Visit',
      'subtitle': "School Visit scheduled on 18th July 10:30 AM"
    },
    {'name': 'Registration', 'subtitle': ""},
  ];

  final List menuData = [
    {'image': AppImages.registrationIcon, 'name': "Registration"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> activeStep = BehaviorSubject<int>.seeded(1);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);
}
