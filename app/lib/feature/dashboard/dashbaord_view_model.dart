import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DashboardPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  DashboardPageModel(this.exceptionHandlerBinder);

  final List<String> images = [
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    // Add more image paths if needed
  ];

  final List<String> dropdownValues = [
    'Vipul patel EN1437465346',
    'Amit patel EN1437465346'
  ];

  final List trackerTemp = [
    {'name': 'SR', 'image': AppImages.userSearch, 'isSelected': false},
    {'name': 'Order', 'image': AppImages.gift, 'isSelected': false},
    {'name': 'Transport', 'image': AppImages.bus, 'isSelected': false}
  ];

  final List enquiryAndAdmissionTemp = [
    {
      'name': 'Enquiries',
      'image': AppImages.receiptSearch,
      'isSelected': false
    },
    {'name': 'Application', 'image': AppImages.cube, 'isSelected': false}
  ];

  final List feesTemp = [
    {'name': 'Payments', 'image': AppImages.walletAdd, 'isSelected': false},
    {
      'name': 'New Enrollment',
      'image': AppImages.activity,
      'isSelected': false
    },
  ];

  String returnRouteValue(String routeValue) {
    switch (routeValue) {
      case 'sr':
        return '';
      case 'order':
        return '';
      case 'transport':
        return '';
      case 'enquires':
        return '';
      case 'application':
        return '';
      case 'payments':
        return RoutePaths.payments;
      case 'new enrollments':
        return '';
      default:
        return '';
    }
  }
}

class Chips {
  final String? name;
  final String? image;
  bool isSelected;

  Chips({this.name, this.image, this.isSelected = false});
}
