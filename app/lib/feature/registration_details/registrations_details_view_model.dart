import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class RegistrationsDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  RegistrationsDetailsViewModel(this.exceptionHandlerBinder);

  final List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false},
    {'name': 'Parent Info', 'isSelected': false},
    {'name': 'Contact Info', 'isSelected': false},
    {'name': 'Medical Details', 'isSelected': false},
    {'name': 'Bank Details', 'isSelected': false},
    {'name': 'Upload Docs', 'isSelected': false}
  ];

  final List menuData = [
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.payments, 'name': "Payments"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.editDetails, 'name': "Edit Details"},
    {'image': AppImages.bookTest, 'name': "Book Test"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
      BehaviorSubject<bool>.seeded(false);

  final CommonRadioButton<String> radioButtonController =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController1 =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController2 =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController3 =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController4 =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController5 =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController6 =
      CommonRadioButton<String>(null);
}
